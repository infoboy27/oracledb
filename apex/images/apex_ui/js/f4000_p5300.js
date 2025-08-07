/*!
 * Copyright (c) 2023, Oracle and/or its affiliates.
 */

/* 
* Working Copy function to show progress of exports for diffing
*
* Note: this code is almost the same as an execute javascript code
* action "Click Create Application Button" on app 4020 page 1 for the 
* create application wizard. If accessibility or other changes are required 
* then both places should be updated.
*/

/* eslint no-var: "error" */
/* eslint semi: "error" */

(function ($, server) {
    "use strict";

    window.workingCopyDiff =
    {
        init: () => {

            let lProgressTxt, lProgressPct, lLastProgressTxt, lLastProgressPct, lOverlay$, lMessage$, lComplete$, currentStatus,
                fakeProgress = 0,
                statusUpdCnt = 0,
                fakeProgressReset = false;

            function updatePageItems(items) {
                let i, item;
                for (i = 0; i < items.length; i++) {
                    item = items[i];
                    $s(item.id, item.value, null, true);
                }
            }

            let doDiff = server.process("doDiff", {
                pageItems: ["P5300_REVERSE"]
            });

            // add overlay
            let lHtml =
                '<div class="a-PWWait-overlay" id="progress_overlay" role="progressbar" aria-busy="true" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" tabindex="-1">' +
                '   <div class="a-PWWait-body">' +
                '      <div class="a-PWWait-progress">' +
                '         <span class="a-PWWait-bar" id="pct_complete"></span>' +
                '     </div>' +
                '   <div class="a-PWWait-label" id="progress_messages"></div>' +
                '</div>';

            $("body").append(lHtml);

            lOverlay$ = $("#progress_overlay");
            lMessage$ = $("#progress_messages", lOverlay$);
            lComplete$ = $("#pct_complete", lOverlay$);

            // set focus to overlay, this gives better results with screen readers in announcing the progress
            lOverlay$.focus();

            doDiff.done((data) => {
                if (data && data.items) {
                    updatePageItems(data.items);
                }
                currentStatus = $v("P5300_STATUS");

                if (["DONE", "ERROR"].includes(currentStatus)) {
                    setTimeout(() => {
                        lOverlay$.remove();
                        apex.event.trigger("body", "working-copy-diff-completed");
                    }, 2000);
                }
            }).fail(() => {
                // we will rely on automatic handling of the "error" to show a message
                lOverlay$.remove();
            });

            // we want to increase the polling interval based on number of polls
            function getTimeoutInterval() {
                return 1500 + ((statusUpdCnt / 5) * 1000);
            }

            function waitForStatus() {
                setTimeout(function () {
                    statusUpdCnt += 1;
                    fakeProgress += 1;

                    let getCurrent = server.process("getCurrentStatus");

                    getCurrent.done(function (data) {
                        let currentStatus;
                        if (data && data.items) {
                            updatePageItems(data.items);
                        }

                        lLastProgressTxt = lProgressTxt;
                        lLastProgressPct = lProgressPct;

                        currentStatus = $v("P5300_STATUS");
                        lProgressTxt = $v("P5300_CURRENT_STATUS");
                        lProgressPct = parseInt($v("P5300_PCT_COMPLETE"),10);

                        if (lProgressPct === 55 && fakeProgress > 1 && !fakeProgressReset) {
                            fakeProgress = 1;
                            fakeProgressReset = true;
                        }

                        if (currentStatus !== "DONE") {

                            lProgressPct += Math.min(fakeProgress, 44);

                            if (currentStatus === "ERROR") {
                                // we will rely on automatic handling of the "error" to show a message
                                lOverlay$.remove();
                                apex.message.showErrors([
                                    {
                                        type: "error",
                                        location: "page",
                                        message: lProgressTxt,
                                        unsafe: false
                                    }
                                ]);
                                $("#NEXT_BTN").attr("disabled", true);
                            } else {
                                waitForStatus();

                                // Only update text if text has changed
                                if (lLastProgressTxt !== lProgressTxt) {
                                    lMessage$.text(lProgressTxt);
                                    lOverlay$.attr("aria-valuetext", lProgressTxt);
                                }

                                // Only update percent complete if it has changed
                                if (lLastProgressPct !== lProgressPct) {
                                    lComplete$.css("width", lProgressPct + "%");
                                    lOverlay$.attr("aria-valuenow", lProgressPct);
                                }
                            }
                        } else {
                            if (currentStatus === "DONE") {
                                lMessage$.text($v("P5300_CURRENT_STATUS"));
                                lComplete$.css("width", "100%");
                                lOverlay$
                                    .attr("aria-valuenow", $v("P5300_PCT_COMPLETE"))
                                    .attr("aria-valuetext", "100");
                                setTimeout(() => {
                                    lOverlay$.remove();
                                    apex.event.trigger("body", "working-copy-diff-completed");
                                }, 1000);
                            }
                        }
                    });
                }, getTimeoutInterval());
            }

            waitForStatus();
        }
    };
})(apex.jQuery, apex.server);