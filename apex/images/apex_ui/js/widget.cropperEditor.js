/*!
 * Copyright (c) 2022, 2024, Oracle and/or its affiliates.
 */

(function ($) {
    "use strict";

    let cropperZoom$,
        cropper,
        cropperImage,
        cropperImageHasChanged = false,
        cropperOptionsDefaults = {
            aspectRatio: 1,
            viewMode: 1,
            dragMode: "move",
            cropBoxMovable: false,
            cropBoxResizable: false,
            toggleDragModeOnDblclick: false,
            zoom(event) {
                const containerData = cropper.getContainerData();
                const canvasData = cropper.getCanvasData();
                const minRatio = containerData.height / canvasData.naturalHeight;
                const cropperZoomValue = parseInt((event.detail.ratio - (minRatio * 0.8)) / minRatio * 100, 10);

                if (!cropperZoom$.data("active")) {
                    cropperZoom$.val(cropperZoomValue);
                }
            },
            ready() {
                const containerData = cropper.getContainerData();
                const canvasData = cropper.getCanvasData();
                const minRatio = containerData.height / canvasData.naturalHeight;

                cropper.zoomTo(0); // zoom to minimum
                cropperZoom$.val(0);
                cropperZoom$.on("input", () => {
                    cropperZoom$.data("active", true);
                    const cropperZoomValue = Number(cropperZoom$.val()) / 100;
                    cropper.zoomTo((minRatio * 0.8) + (minRatio * cropperZoomValue));
                    cropperZoom$.data("active", false);
                });

                $(cropperImage).siblings(".cropper-container")
                    .attr("tabindex", 0)
                    .attr("role", "application")
                    .trigger( "focus" )
                    .keydown(function (event) {
                        switch (event.key) {
                            // Move to the left
                            case 'ArrowLeft':
                                event.preventDefault();
                                if (event.shiftKey) {
                                    cropper.move(-10, 0);
                                } else {
                                    cropper.move(-1, 0);
                                }
                                break;
                            // Move to the top
                            case 'ArrowUp':
                                event.preventDefault();
                                if (event.shiftKey) {
                                    cropper.move(0, -10);
                                } else {
                                    cropper.move(0, -1);
                                }
                                break;
                            // Move to the right
                            case 'ArrowRight':
                                event.preventDefault();
                                if (event.shiftKey) {
                                    cropper.move(10, 0);
                                } else {
                                    cropper.move(1, 0);
                                }
                                break;
                            // Move to the bottom
                            case 'ArrowDown':
                                event.preventDefault();
                                if (event.shiftKey) {
                                    cropper.move(0, 10);
                                } else {
                                    cropper.move(0, 1);
                                }
                                break;
                            // Zoom in
                            case 'i':
                                cropper.zoom(0.1);
                                break;
                            // Zoom out
                            case 'o':
                                cropper.zoom(-0.1);
                                break;
                            // Rotate left
                            case 'l':
                                cropper.rotate(-90);
                                break;
                            // Rotate right
                            case 'r':
                                cropper.rotate(90);
                                break;
                            default:
                        }
                    });
                
                // remember if an cropping action was applied to the image.
                // we use this information to indicate if something has changed
                // therefore we compare the original width/height to the one after changes
                // were made. For the case where no changes were made, we take the aspectRatio
                // into account, if that differs we also return true.
                const imageData = cropper.getImageData();
                cropperImageHasChanged = imageData.aspectRatio !== cropper.options.aspectRatio;

                cropperImage.addEventListener( "crop", ( event ) => {
                    cropperImageHasChanged = imageData.naturalWidth  !== event.detail.width
                                          || imageData.naturalHeight !== event.detail.height
                                          || imageData.rotate        !== event.detail.rotate;
                } );
            }
        };

    let cropperEditor = {};

    // Applies transformations on a canvas or image object for
    // 10% padding
    // 20% border radius
    // Returns a rounded and padded canvas which is useful for macOS icons
    cropperEditor.applyRoundedCanvas = ( object, size ) => {
        const x = size * 0.1;
        const y = x;
        const radius = x * 2;
        const curvedWidth = size * 0.8;
        const curvedHeight = curvedWidth;

        const canvas = document.createElement("canvas");
        canvas.width = size;
        canvas.height = size;

        let ctx = canvas.getContext("2d");

        ctx.beginPath();

        // ctx.roundRect is a 1 line solution to replace the following 9 lines
        // below but it is not supported in Firefox as of Dec 2022
        //ctx.roundRect( x, y, width, height, [ radius ] );

        ctx.moveTo( x + radius, y );
        ctx.lineTo( x + curvedWidth - radius, y );
        ctx.quadraticCurveTo( x + curvedWidth, y, x + curvedWidth, y + radius );
        ctx.lineTo( x + curvedWidth, y + curvedHeight - radius );
        ctx.quadraticCurveTo( x + curvedWidth, y + curvedHeight, x + curvedWidth - radius, y + curvedHeight );
        ctx.lineTo( x + radius, y + curvedHeight );
        ctx.quadraticCurveTo( x, y + curvedHeight, x, y + curvedHeight - radius );
        ctx.lineTo( x, y + radius );
        ctx.quadraticCurveTo( x, y, x + radius, y );

        ctx.closePath();
        ctx.clip();

        ctx.drawImage( object, x, y, curvedWidth, curvedHeight );

        return canvas;
    };

    cropperEditor.getCanvas = ( { 
        width,
        height,
        minWidth,
        minHeight,
        maxWidth,
        maxHeight,
        rounded
    } = { } ) => {

        const data = cropper.getData();

        // defaults
        if ( typeof width === "undefined" ) {
            width = data.width;
        }
        if ( typeof height === "undefined" ) {
            height = data.height;
        }

        const canvas = cropper.getCroppedCanvas({
            width: width,
            height: height,
            minWidth: minWidth || width,
            minHeight: minHeight || height,
            maxWidth: maxWidth || width,
            maxHeight: maxHeight || height,
            imageSmoothingEnabled: true,
            imageSmoothingQuality: 'high',
        });

        if ( rounded ) {
            return cropperEditor.applyRoundedCanvas( canvas, width );
        } else {
            return canvas;
        }
    };

    cropperEditor.getDataURL = ( { 
        width,
        height,
        minWidth,
        minHeight,
        maxWidth,
        maxHeight,
        fileType,
        rounded
    } = { } ) => {

        const canvas = cropperEditor.getCanvas({
            width,
            height,
            minWidth,
            minHeight,
            maxWidth,
            maxHeight,
            rounded
        });

        return canvas.toDataURL( fileType );
    };

    cropperEditor.getBlob = async ( { 
        width,
        height,
        minWidth,
        minHeight,
        maxWidth,
        maxHeight,
        fileType,
        rounded
    } = { } ) => {

        const _getBlob = ( canvas ) => new Promise( ( resolve ) => {
            canvas.toBlob( resolve, fileType );
        } );

        const canvas = cropperEditor.getCanvas({
            width,
            height,
            minWidth,
            minHeight,
            maxWidth,
            maxHeight,
            rounded
        });

        return _getBlob( canvas );
    };

    cropperEditor.init = function ({ imageItemName, cropperOptions }) {
        cropperImage = document.getElementById(imageItemName);
        cropperZoom$ = $("#APEXCropperZoom");

        const opts = {
            ...cropperOptionsDefaults,
            ...cropperOptions
        };

        /*global Cropper*/
        cropper = new Cropper(cropperImage, opts);
    };

    cropperEditor.initZoom = function ( el ) {
        cropperZoom$ = el;
    };

    cropperEditor.isChanged = function () {
        return cropperImageHasChanged;
    };

    cropperEditor.reset = function () {
        cropper.reset();
        cropper.zoomTo(0);
        cropperZoom$.val(0);
        cropperImageHasChanged = false;
    };

    //Destroy cropper object to re-use it.
    cropperEditor.destroy = function () {
        if (cropper) {
            cropper.destroy();
        }
        cropperImageHasChanged = false;
    };

    apex.cropperEditor = cropperEditor;

})(apex.jQuery);
