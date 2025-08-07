/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * User model.
 */

class User {

    #id;
    #name;
    #avatarInitials;
    #messageStyle;
    #avatarImageUrl;
    #avatarIconClasses;

    constructor({
        id,
        name,
        messageStyle = 'outbound',
        avatar
    }) {
        this.#id = id;
        this.#name = name;
        this.#messageStyle = messageStyle;
        this.#avatarImageUrl = avatar?.imageUrl;
        this.#avatarIconClasses = avatar?.iconClasses;
        this.#avatarInitials = avatar?.initials || '';
    }

    get messageStyle() {
        return this.#messageStyle;
    }

    get avatarInitials() {
        return this.#avatarInitials;
    }

    get name() {
        return this.#name;
    }

    get avatarImageUrl() {
        return this.#avatarImageUrl;
    }

    get avatarIconClasses() {
        return this.#avatarIconClasses;
    }

    get id() {
        return this.#id;
    }
}

export { User };