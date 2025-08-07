type jQuery = (...params: any[]) => any;

declare namespace actions {
    /**
     * <p>This is an object that defines the state and behavior of an action. There are 3 kinds of actions:</p>
     * <ul>
     * <li>action: This is typically associated with a button, link, or action menu item. The action must have an
     *     action function or an href URL.</li>
     * <li>toggle: This is typically associated with a checkbox input, button, or toggle menu item. The action must have
     *     get and set functions and not have a choices property. Toggle actions update an external Boolean state variable
     *     by means of the get and set functions. It is also possible to keep the state in the action by using 'this'
     *     in the get and set functions.</li>
     * <li>radio group: This is typically associated with radio inputs, select list, or a radioGroup menu item. The action
     *     must have get and set functions and a choices property. Radio group actions update an external state variable
     *     with the currently selected value of the group by means of the get and set functions. It is also possible to
     *     keep the state in the action by using 'this' in the get and set functions.</li>
     * </ul>
     *
     * <p>Note: When an action is hidden or disabled the {@link actions#invoke}, {@link actions#toggle},
     * and {@link actions#set} methods have no effect.</p>
     *
     * <p>Note: The disabled and hide properties cannot be functions. Menu widget can use actions and non-action based menu
     * items allow hide and disabled to be functions. But when a menu uses an action that action still must not use
     * functions for disabled and hide.</p>
     *
     * <p>As an alternative to label (or onLabel, offLabel) you can specify labelKey (or onLabelKey, offLabelKey) and
     * the apex.lang.getMessage function will be used to lookup the label text. The localized label text is then stored in
     * the normal label/onLabel/offLabel property. This happens when the action is added. The same applies to titleKey
     * groupKey, and labelKey of each object in the choices array.</p>
     * @property name - A unique name for the action. By convention the style of names uses a dash to separate
     *   words as in "clear-log". Name must not contain spaces, ">", ":", quote, or double quote, or non-printing characters.
     * @property [idArg] - Only applies when an action handles multiple instances such as when an action is used
     *   in a report row or list item. This is the name of the argument
     *   that uniquely identifies the bound UI element (button or input element for example) in the row or item.
     * @property [instanceSelector] - Only applies when an action handles multiple instances. This is the selector
     *   of an ancestor element of the UI element bound to this action. This allows keyboard shortcuts to find
     *   the correct instance of the action.
     * @property label - Translatable label for action used in buttons, menus etc. Note: if this is a
     *   radio group action (action has choices property) the label is optional. It is used in results of the list
     *   and listShortcuts methods. Depending on what kind of UI control the action is bound to it may be used as a label
     *   for the whole group. For example using aria-label.
     * @property [onLabel] - Only for dynamic antonyms toggle actions. This is the label when the value is true.
     * @property [offLabel] - Only for dynamic antonyms toggle actions. This is the label when the value is false.
     * @property [contextLabel] - A more descriptive label used in place of label for use in listing actions and shortcuts.
     * @property [icon] - The icon CSS class(es) for action may be used in buttons and menus
     * @property [onIcon] - Only for dynamic antonyms toggle actions. This is the icon CSS class(es) to use when the value is true.
     * @property [offIcon] - Only for dynamic antonyms toggle actions. This is the icon CSS class(es) to use when the value is false.
     * @property [iconType] - The icon type CSS class. Defaults to a-Icon. Updates to the iconType
     *   may not be supported by all control types that can be associated with actions.
     * @property [disabled] - Disabled state of action; true if the action is disabled and false if it is enabled. The default is enabled
     * @property [hide] - Hidden state of action; true if UI controls connected to this action should be hidden and false otherwise.
     *   The default is false (show).
     * @property [title] - The title to use as the title attribute when appropriate.
     * @property [shortcut] - The keyboard shortcut to invoke action (not allowed for radio group actions).
     * @property [href] - For actions that navigate set href to the URL to navigate to and don't set an action function.
     *   An action of type action must have an href or action property set.
     * @property [target] - For actions that navigate this is the window to open the href URL in. Only applies
     *   when href is specified. Typical value is "_blank" to open in a new tab or window. Omit to open in the
     *   current window.
     * @property [action] - <em>function(event, focusElement, args):boolean</em> The function that is called when the
     *   action is invoked with {@link actions#invoke}. The action must return true if it sets focus. An action of
     *   type action must have an href or action property set. The args parameter is an optional object argument that
     *   can pass in additional data.
     * @property [convertBindingArguments] - Determines if arguments passed to the
     *    <code class="prettyprint">action</code> function are converted. Only applies if this action is expected to
     *    take arguments.
     *    If true then an attempt is made to convert the value of all arguments
     *    to a JavaScript value when the action is invoked by a UI control.
     *    Every attempt is made to convert the argument's string value to a JavaScript value (this includes booleans,
     *    numbers, objects, arrays, and null). A string is only converted to a number if doing so doesn't change its
     *    representation (for example, the string "100" is converted to the number 100, but "1E02" and "100.000" are
     *    left as strings because their numeric value of 100 serializes to "100"). When a string starts with '{' or '[',
     *    then <code class="prettyprint">JSON.parse</code> is used to parse it;
     *    it must follow valid JSON syntax including quoted property names.
     *    A string not parseable as a JavaScript value is not converted.
     *    If false then no conversion is done. The default is false.
     * @property [get] - <em>function(args):*</em>
     *   For toggle actions this function should return true or false. For radio group actions this
     *   should return the current value. The args parameter is an optional object argument that
     *   can pass in additional data.
     * @property [set] - <em>function(value, args)</em>
     *   For toggle actions this receives a boolean value. For radio group actions this function receives
     *   the new value. The args parameter is an optional object argument that can pass in additional data.
     * @property [choices] - This is only for radio group actions. Array of objects. Each object has properties:
     *                   label, value, icon, iconType, shortcut, disabled, group (for select lists only)
     * @property [labelClasses] - This is only for radio group actions. Classes to add to all radio labels. This and the next two label
     *   properties are only used when rendering radio group choices.
     * @property [labelStartClasses] - Only for radio group actions. Classes to add to last radio label
     * @property [labelEndClasses] - Only for radio group actions. Classes to add to last radio label
     * @property [itemWrapClasses] - Only for radio group actions. Classes to add to a span wrapper element. Or to change the
     *   span use one of these prefixes: p:, li:, div:, span:<br>
     *   For example "li:myRadio"
     */
    type action = {
        name: string;
        idArg?: string;
        instanceSelector?: string;
        label: string;
        onLabel?: string;
        offLabel?: string;
        contextLabel?: string;
        icon?: string;
        onIcon?: string;
        offIcon?: string;
        iconType?: string;
        disabled?: boolean;
        hide?: boolean;
        title?: string;
        shortcut?: actions.shortcutName;
        href?: string;
        target?: string;
        action?: (...params: any[]) => any;
        convertBindingArguments?: boolean;
        get?: (...params: any[]) => any;
        set?: (...params: any[]) => any;
        choices?: any[];
        labelClasses?: string;
        labelStartClasses?: string;
        labelEndClasses?: string;
        itemWrapClasses?: string;
    };
    /**
     * <p>This is the string name of a keyboard shortcut. It represents the key(s) to be typed by the user and can
     * be a single key combination or a sequence of keys. The shortcut name must be given in the following format:<p>
     * <pre><code class="prettyprint">
     *   [Ctrl+][Alt+][Meta+][Shift+]key
     * </code></pre>
     *
     * <p>Where strings in square brackets ([]) are optional and represent a modifier key. The string <code class="prettyprint">key</code> is
     * the name of the key and may be one of: "0"-"9", "A"-"Z" or "Help", "Backspace", "Enter", "Escape",
     *   "Space", "Page Up", "Page Down", "End", "Home", "Left", "Up", "Right", "Down", "Insert", "Delete",
     *   "Keypad 0"-"Keypad 9", "Keypad *", "Keypad +", "Keypad -", "Keypad .", "Keypad /", "Keypad =",
     *   "Keypad Clear", "F1"-"F15",
     *   "Comma", "Period", "Semicolon", "Minus", "Quote", "Backtick", "=", "/", "[", "\", "]".
     * </p>
     * <p>Order and case is important. Key names and modifiers are not localized. The key names are based on
     * the standard US keyboard layout and may not correspond with what is actually printed on the key caps or
     * what character is printed (in the case of a printing key).
     * </p>
     * <p>The shortcut name can be a sequence of key combinations separated by commas. The user types the shortcut by
     * typing the first key combination followed by the second and so on. It is possible to have a sequence of length one,
     * which allows defining shortcuts as single letters without any modifier key. Letters can be in upper or lower case.
     * </p>
     * <p>The primary shortcut for an action is specified in the shortcut property of the {@link actions.action} object.
     * This is so that it can be shown in associated menu items.
     * Additional shortcuts can be added with {@link actions#addShortcut}.</p>
     *
     * <p>One limitation of shortcuts in the browser environment is that it is difficult to find keyboard combinations
     * that are not already used for something else and are consistent across all browsers, operating systems and with
     * all keyboard layouts. Key combinations used by the operating system or browser may not be passed on to the
     * actions keydown handler or even if they are the browser or operating system function has also already happened.
     * Many keyboard layouts use the Right side Alt key (known as AltGr) to enter additional characters. The AltGr key
     * can be simulated by pressing Ctrl+Alt. This makes some Ctrl+Alt combinations unavailable. On Mac OS the
     * Option/Alt key plus a letter or number is used to produce additional characters.
     * </p>
     * <p>See {@link apex.actions.shortcutSupport} for information about what kinds of shortcuts if any the user
     * can type. If shortcut support is "off" then no shortcuts are recognized. Shortcut sequences are only recognized
     * if shortcut support is "sequence". Shortcuts can always be defined.
     * <p>
     * <p>When focus is in a control that allows character input then shortcuts that would produce printable
     * characters or are used for editing are ignored by actions. This includes controls such as text fields and
     * text areas but also controls such as select lists that support type to select.</p>
     * @example
     * <caption>Example key combinations. Press the modifier keys in combination with the specified
     * key: W, F7, Page Down.</caption>
     *   Ctrl+W
     *   Ctrl+Shift+F7
     *   Alt+Page Down
     * @example
     * <caption>Example key sequence. Press the first key combination Ctrl+F2 and release then press the G key
     * and then the H key. For the second example press the C key then the S key. In the third example press
     * C then 6 (not Shift+6). In the last example simply press W.
     * Although the letters must be in upper case in the shortcut name they can be typed with our without the Shift
     * modifier. All but the first example will be ignored when focus is in a control that takes character input.
     * </caption>
     *   Ctrl+F2,G,H
     *   C,S
     *   C,6
     *   W
     */
    type shortcutName = string;
    /**
     * <p>Information about a shortcut.</p>
     * @property shortcut - The shortcut name.
     * @property shortcutDisplay - The shortcut display string.
     * @property actionName - The name of the action that the shortcut invokes.
     * @property actionLabel - The label of the action. For choice actions this includes the choice label.
     */
    type shortcutListItem = {
        shortcut: string;
        shortcutDisplay: string;
        actionName: string;
        actionLabel: string;
    };
}

/**
 * <p>The actions interface manages a collection of {@link actions.action} objects. An action encapsulates
 * the identity, state and behavior of a named operation or procedure that the user initiates via a user
 * interface element. Actions are most useful when an operation can be initiated in multiple ways such as with a button
 * or toolbar button, menu, or keyboard shortcut. The operation should be labeled consistently and if it can be
 * enabled and disabled that state must be kept consistent. By using an action and then associating a button and/or
 * menu item with that action all aspects of the action are centralized and kept in sync. This avoids duplicating
 * labels, icons etc.</p>
 *
 * <div class="hw">
 *     <h3 class="name" id="contexts-section">Actions Contexts</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Actions Contexts" href="#contexts-section"></a>
 * </div>
 * <p>The apex.actions singleton (which is also the {@link apex.actions} namespace) manages
 * all the global (page level) actions. For components that can have multiple
 * instances on a page the global actions will not work because it is not clear which instance of the component the
 * action applies to. To support components the {@link apex.actions.createContext} function is used to create an actions
 * interface that is scoped to a specific component instance (the context). Typically the component (e.g. widget) would
 * call {@link apex.actions.createContext} when it is created and {@link apex.actions.removeContext}
 * when it is destroyed.</p>
 *
 * <p>For global actions and any other created actions contexts the methods on the actions object are used to add,
 * remove, lookup, and invoke actions. There are also methods to manage keyboard shortcuts. Additional state can be
 * stored in the action if desired. If any of the action properties change then {@link actions#update} must be called.</p>
 *
 * <p>Actions are associated with UI controls that invoke the action. It is also possible to invoke
 * the action explicitly with the {@link actions#invoke} method. To toggle actions the {@link actions#toggle}
 * method is used and for radio group actions the {@link actions#set} method is used to change the value.
 * The following sections describes how to associate actions with various controls.</p>
 *
 * <p>Binding a UI element to an action uses the custom attribute <code class="prettyprint">data-action</code>
 * or for links (&lt;a&gt; elements) the <code class="prettyprint">href</code> attribute.
 * The value of this attribute specifies the binding. In the simple case it is just the name of an action.
 * The full syntax of the binding value is:</p>
 *
 * <pre><code class="prettyprint">[<em>context-id</em>]<em>action-name</em>?<em>arguments</em>
 * </code></pre>
 * <ul>
 *     <li><em>context-id</em> is the static id of a region that has defined an actions context or the element
 *       id of the element specified in a call to {@link apex.actions.createContext}. To explicitly reference
 *       the global context use <code class="prettyprint">[global]</code>.
 *       This part of the binding including the square brackets is optional.
 *       The square brackets must be included in the syntax when there is a context-id.</li>
 *     <li><em>action-name</em> is the name of an action in the global context or if
 *       <em>context-id</em> is given, in that context.</li>
 *     <li><em>arguments</em> is a list of <em>arg-name</em>=<em>arg-value</em> pairs separated by &.
 *     This part of the binding including the leading ? is optional.
 * </ul>
 *
 * <h4>Handling Multiple Instances</h4>
 * <p>A single action can handle multiple instances by passing an argument to the action that identifies the
 * specific instance. Consider a tabular report (or a list report) containing tasks.
 * Each row could have a "Complete" button that when pressed marks the task as complete.
 * The action binding might look like this: <code class="prettyprint">complete-task?taskId=&TASK_ID!ATTR.</code>
 * The argument <code class="prettyprint">taskId</code> lets the action know which task it is operating on.
 * In this example the argument value comes from an APEX symbol substitution.
 * When an action handles multiple instances the functionality that keeps the action state in sync with
 * UI elements is more complicated. The label, icon, and enabled states, for example, could be different for
 * the button in each row. The {@link actions.action} property <code class="prettyprint">idArg</code> lets you
 * specify the argument that uniquely identifies the instance. This argument can be passed to the
 * {@link actions#enable}, {@link actions#disable}, {@link actions#show}, {@link actions#hide}, and
 * {@link actions#update} methods to update a specific UI element. Note that when this is done the
 * action state is no longer in sync with all UI elements bound to the action. Only the hidden and disabled
 * states can be updated for a specific instance when the action has the <code class="prettyprint">idArg</code>
 * property defined. In order for keyboard shortcuts to apply to the correct instance the
 * {@link actions.action} property <code class="prettyprint">instanceSelector</code> must be set and the
 * button (or other UI control) bound to the action must be within an element identified by the selector.
 * </p>
 *
 * <div class="hw">
 *     <h3 class="name" id="buttons-section">Buttons</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Buttons" href="#buttons-section"></a>
 * </div>
 * <p>To associate a button element with an action give it a <code class="prettyprint">data-action</code>
 * attribute with the name of the action as its value. The button icon, label text, title, aria-label, hide/show,
 * and disabled state are all updated automatically.</p>
 * <p>For this automatic updating to work buttons should use the following classes:</p>
 * <ul>
 * <li>t-Button-label if a button has a text label this class should be on an element that wraps the text.
 *       This is useful when the button also has an icon or other non-text label content. This class does not
 *       go on the button element. If this class is not used then the content of the button element will be the
 *       label text.</li>
 * <li>t-Button--icon if a button has an icon this class should be on the button element. If the action has an
 *       icon and the button has this class then any elements with the icon type class will be updated with
 *       the icon. Any classes on the icon element that are not the icon, the icon type or start with "t-"
 *       will get removed.</li>
 * <li>t-Button--noLabel if a button has no visible label this class should be on the button element. A button with
 *       no visible label text will have the button's aria-label attribute set to the button label. Also if there
 *       is no title the label will be used as the title.</li>
 * </ul>
 * <p>If the action label or title are null they will be initialized with the text and title attribute value respectively
 * from the first button (in document order) associated with the action. This is useful if the server has
 * already rendered a localized button for the action. The title comes from the button title attribute. The label comes
 * from the first found of; aria-label attribute, title attribute if button has class t-Button--noLabel,
 * content of the descendant element with class t-Button-label, and finally the button element content. If disabled
 * is null it will be taken from the button disabled property. If you don't want the label, title, or icon to be updated
 * add attribute data-no-update="true".</p>
 *
 * <p>Example:</p>
 * <pre><code class="prettyprint">    &lt;button class="..." type="button" data-action="undo">Undo&lt;/button>
 * </code></pre>
 *
 * <div class="hw">
 *     <h3 class="name" id="checkboxes-section">Checkboxes</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Checkboxes" href="#checkboxes-section"></a>
 * </div>
 * <p>A checkbox can be associated with a toggle action by giving the input element (or a wrapping parent element)
 * a class of <code class="prettyprint">js-actionCheckbox</code> and a
 * <code class="prettyprint">data-action</code> attribute with the name of the action as its value. The checkbox
 * should have a label element. The icon, label text, title, hide/show, disabled state, and checked state are all
 * updated automatically. For hide to work correctly use a wrapping element.</p>
 *
 * <p>If the label has the class t-Button then it should be marked up like a button and the same classes described for
 * a button are used to update the label and icon (except a visually hidden child element is used for the label
 * in place of aria-label). Otherwise the label element content will be updated with the label and the icon is not used.
 * If the action label or title are null they will be initialized from the markup. If the checkbox label is marked up
 * like a button then the label comes from the text of a child element with class t-Button-label or if the label
 * has class t-Button--noLabel then from a child element with class u-VisuallyHidden. If you don't want the label,
 * title, or icon to be updated add attribute data-no-update="true".</p>
 *
 * <p>Example:</p>
 * <pre class="prettyprint"><code>    &lt;input id="abc" type="checkbox" class="js-actionCheckbox" data-action="option-a">
 *         &lt;label for="abc">Option A&lt;/label>
 *    or
 *     &lt;div class="js-actionCheckbox" data-action="option-a">
 *         &lt;input id="abc" type="checkbox">&lt;label for="abc">Option A&lt;/label>
 *     &lt;/div>
 * </code></pre>
 *
 * <div class="hw">
 *     <h3 class="name" id="radiogroups-section">Radio Groups</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Radio Groups" href="#radiogroups-section"></a>
 * </div>
 * <p>A radio group is a set of input elements of type radio and sharing the same name value. A radio group can be
 * associated with a radio group action by giving the element that wraps the radio group a class of
 * <code class="prettyprint">js-actionRadioGroup</code> and a <code class="prettyprint">data-action</code>
 * attribute with the name of the action as its value. The wrapper element
 * aria label is kept in sync with the action label. The radio group as a whole does not have a disabled state,
 * icon or title. When the radio action value changes (or when update is called) the checked state (and disabled state)
 * of each radio input is updated.</p>
 * <p>The element with class js-actionRadioGroup can also have attributes: data-item-start, data-item, data-item-end,
 * data-item-wrap to override action properties labelStartClasses, labelClasses, labelEndClasses, and itemWrapClasses
 * respectively.</p>
 * <p>If the action label is null it will be initialized from the wrapper element aria-label. If the wrapping element
 * has no children when the action is added or when updateChoices is called (after the choices have been changed) then
 * the choices are rendered as radio input, label pair elements. The action labelStartClasses, labelClasses,
 * labelEndClasses values are used for the classes of the label elements. If there is an icon it will be used
 * as the label. The label will be included as a hidden but accessible label. The label element will have a title
 * if there is a title property or if the choice has an icon. The title comes from the label property if the title
 * property isn't given.</p>
 *
 * <p>Example:</p>
 * <pre class="prettyprint"><code>    &lt;div class="js-actionRadioGroup" data-action="item-size">
 *       &lt;input id="lc1" type="radio" name="RG1" value="s">&lt;label for="lc1">Small&lt;/label>
 *       &lt;input id="lc2" type="radio" name="RG1" value="m">&lt;label for="lc2">Medium&lt;/label>
 *       &lt;input id="lc3" type="radio" name="RG1" value="l">&lt;label for="lc3">Large&lt;/label>
 *     &lt;/div>
 * </code></pre>
 *
 * <div class="hw">
 *     <h3 class="name" id="selectlists-section">Select List</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Select List" href="#selectlists-section"></a>
 * </div>
 * <p>To associate a select element with a radio group action give it a <code class="prettyprint">data-action</code>
 * attribute with the name of the action as its value. Select lists used with actions are assumed to not have an
 * associated label element. The select element aria label, title, value, and disabled state are kept in sync with the
 * action. When the radio action value changes (or when update is called) the select element value is updated and
 * also the disabled state of each option element.</p>
 * <p>If the action label or title are null they will be initialized from the select element aria-label and
 * title attributes. If the select element has no children when the action is added or when updateChoices is called
 * (after the choices have been changed) then the choices are rendered as option elements. The choice group property
 * is used to put options in optgroup elements. The group property value is used as the optgroup label. The choices
 * need to be sorted first by group value.</p>
 *
 * <p>Example:</p>
 * <pre><code class="prettyprint">    &lt;select class="..." data-action="item-size">...&lt;/select>
 * </code></pre>
 *
 * <div class="hw">
 *     <h3 class="name" id="links-section">Links (anchor elements)</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Buttons" href="#links-section"></a>
 * </div>
 * <p>To associate an anchor (&lt;a&gt;) element with an action the href must be a fragment with prefix "action$" and
 * then the action name. Unlike buttons, links do not synchronize the label, title, or icon action state with
 * the anchor element. The action hide property will hide or show the link. The action disabled property will
 * disable or enable the link by adding (or removing) the <code class="prettyprint">is-disabled</code>
 * and <code class="prettyprint">apex_disabled</code> classes.</p>
 * <p>If the action label is null it will be initialized from the link label from the first link
 * (in document order) associated with the action.</p>
 *
 * <p>Example:</p>
 * <pre><code class="prettyprint">    &lt;a class="..." href="#action$my-action">...&lt;/a>
 * </code></pre>
 *
 * <div class="hw">
 *     <h3 class="name" id="menuitems-section">Menu Items</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Menu Items" href="#menuitems-section"></a>
 * </div>
 * <p>For {@link menu} widget menu items of type action, toggle, or radioGroup simply specify the
 * action name as the value of the action property. Values for
 * label, icon, iconType, disabled, hide, and accelerator are taken from the action (accelerator is taken from
 * the action shortcut property). It is possible to override action values such as label and icon by specifying them
 * in the menu item.</p>
 *
 * <p>Examples:</p>
 * <pre class="prettyprint"><code>    { type: "action", action: "undo" },
 *     { type: "toggle", action: "my-toggle-action" },
 *     { type: "radioGroup", action: "my-radio-action" }
 * </code></pre>
 *
 * <div class="hw">
 *     <h3 class="name" id="shortcuts-section">Shortcuts</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Shortcuts" href="#shortcuts-section"></a>
 * </div>
 * <p>Shortcuts are not an actual widget or a DOM Element. The keyboard event handler for invoking actions in
 * response to shortcut keys is in this module and is registered on the context element
 * (body for the global context).</p>
 *
 * <div class="hw">
 *     <h3 class="name" id="customcontrols-section">Associating actions with custom UI controls</h3>
 *     <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Associating actions with custom UI controls" href="#customcontrols-section"></a>
 * </div>
 * <p>To integrate actions with other UI controls:</p>
 * <ul>
 * <li>Devise a way to specify the action name. For example using a class such as
 * js-actionRadioGroup and an attribute such as <code class="prettyprint">data-action</code> attribute (recommended)
 * on an appropriate element. For widgets the action name could be passed as an option to the initialization function.</li>
 * <li>Register an observer call back using {@link actions#observe} to get notified when the action is added,
 * removed, or updated. Use this callback to update the state of the UI control such as enabling or
 * disabling it or changing the label or icon.</li>
 * <li>Call the {@link actions#invoke} method when it is time to invoke the action.</li>
 * </ul>
 */
declare interface actions {
    /**
     * <p>This is type name of the actions context as given in the {@link apex.actions.createContext} call.
     * The typeName of the global context apex.actions is "global".</p>
     */
    typeName: string;
    /**
     * <p>This is the Element context that actions are scoped within as given in
     * the {@link apex.actions.createContext} call.</p>
     */
    context: Element;
    /**
     * <p>Add an {@link actions.action} object or an array of {@link actions.action} objects to this actions context.
     * The action name must be unique within the context and the shortcut if any must be unique
     * within the context and valid. Debug warnings are logged if any of these conditions are not met.
     * See also {@link actions#remove}.</p>
     * <p>Note: The global actions context (apex.actions) does not exist until after the DOM is ready.
     * Actions should be added after the DOM is ready. For code in JavaScript files or in APEX page attribute
     * "Function and Global Variable Declaration" you can wrap the call to <code class="prettyprint">add</code>
     * in the jQuery ready handler if needed. For example:</p>
     * <pre class="prettyprint"><code>$( function() {
     *     apex.actions.add(...);
     * } );
     * </code></pre>
     * @example
     * <caption>This example adds one action to the global actions context.</caption>
     * apex.actions.add({
     *     name: "send-email",
     *     label: "Send Email",
     *     action: function(event, focusElement) {...}
     * });
     * @example
     * <caption>This example adds an array of actions to the context
     * <code class="prettyprint">log1</code> returned by {@link apex.actions.createContext}.</caption>
     * log1.add([{
     *         name: "clear-log",
     *         label: "Clear",
     *         action: function(event, focusElement) {...}
     *     },
     *     {
     *         name: "verbose",
     *         label: "Verbose",
     *         get: function() {...},
     *         set: function(value) {...}
     *     },
     *     ...
     * ]);
     * @param pActions - The action or an array of actions to add.
     * @returns true if all the actions and shortcuts are added without errors or warnings,
     *   false otherwise.
     */
    add(pActions: actions.action | actions.action[]): boolean;
    /**
     * <p>Add one or more {@link actions.action} objects from simple list markup. This is useful in cases where it is easier
     * to render list markup than an array of action objects. This does not support adding actions
     * with functions but action functions can be added either before or after.</p>
     * <p>The markup expected by this method overlaps with what the {@link menu} widget expects.</p>
     *
     * <p>Expected markup:</br>
     * An element with a <code class="prettyprint">&lt;ul&gt;</code> child. The
     * <code class="prettyprint">&lt;ul&gt;</code> has one or more <code class="prettyprint">&lt;li&gt;</code>
     * elements each one representing an action.
     * The <code class="prettyprint">&lt;li&gt;</code> element can contain either an
     * <code class="prettyprint">&lt;a&gt;</code> or <code class="prettyprint">&lt;span&gt;</code> element.</p>
     * <table>
     *   <caption>Action property markup source, for actions based on list markup</caption>
     *   <thead>
     *     <tr>
     *       <th scope="col">Action property</th>
     *       <th scope="col">Comes from</th>
     *     </tr>
     *   </thead>
     *   <tbody>
     *     <tr>
     *       <th scope="row">name</th>
     *       <td>li[data-id]</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">label</th>
     *       <td>a or span content</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">title</th>
     *       <td>a[title] or span[title]</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">href</th>
     *       <td>a[href]</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">target</th>
     *       <td>a[target]</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">disabled</th>
     *       <td>true if li[data-disabled=true] false otherwise</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">hide</th>
     *       <td>true if li[data-hide=true] false otherwise</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">shortcut</th>
     *       <td>li[data-shortcut]</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">icon</th>
     *       <td>li[data-icon] If the value has a space the icon is the word after the space
     *         otherwise it is the whole value</td>
     *     </tr>
     *     <tr>
     *       <th scope="row">iconType</th>
     *       <td>li[data-icon] If the value has a space the type is the word before the space</td>
     *     </tr>
     *   </tbody>
     * </table>
     *
     * <p>If there is no name or label or the value of <code class="prettyprint">&lt;href&gt;</code> equals
     * "separator" then no action is created for that <code class="prettyprint">&lt;li&gt;</code>.
     * If the <code class="prettyprint">&lt;li&gt;</code> has a <code class="prettyprint">&lt;ul&gt;</code>
     * child the <code class="prettyprint">&lt;ul&gt;</code> is processed recursively.</p>
     * @example
     * <caption>This example shows markup for two actions.</caption>
     * <div id="myActionList">
     *     <ul>
     *         <li data-id="goto-page-1">
     *             <a href="...">Page One</a>
     *         </li>
     *         <li data-id="goto-page-2">
     *             <a href="...">Page Two</a>
     *         </li>
     *     </ul>
     * </div>
     * @example
     * <caption>This example shows how to turn the above markup into actions in the global context.</caption>
     * apex.actions.addFromMarkup($("#myActionList"));
     * @param pList$ - The jQuery object representing the parent of the actions list markup.
     */
    addFromMarkup(pList$: jQuery): void;
    /**
     * <p>Remove one or more {@link actions.action} objects from this actions context.
     * See also {@link actions#add}.</p>
     * @example
     * <caption>This example removes one action from the global action context.</caption>
     * apex.actions.remove( "send-email" );
     * @example
     * <caption>This example removes an array of actions from the context
     * <code class="prettyprint">log1</code> returned by {@link apex.actions.createContext}.</caption>
     * log1.remove( ["clear-log", "verbose"] );
     * @param pActions - The action or action name or an array of actions
     *     or an array of action names to remove.
     */
    remove(pActions: actions.action | string | actions.action[] | string[]): void;
    /**
     * <p>Remove all actions from this actions context.</p>
     * @example
     * <caption>This example removes all the actions from the global context.</caption>
     * apex.actions.clear();
     */
    clear(): void;
    /**
     * <p>Lookup and return an action by name. If you modify the properties of the action
     * you may need to call {@link actions#update} to update any associated UI elements or shortcuts.
     * If you modify the choices of the action then call {@Link actions#updateChoices}.</p>
     * @example
     * <caption>This example updates the label and title of an action.</caption>
     * var action = apex.actions.lookup( "my-action" );
     * action.title = "New Title";
     * action.label = "New Label";
     * apex.actions.update( "my-action" );
     * @param pActionName - The name of the action to return.
     * @returns action or undefined if action doesn't exist.
     */
    lookup(pActionName: string): actions.action;
    /**
     * <p>Return an array of actionName, label pairs for all actions in the context. For actions with
     * choices there is an array item for each choice.</p>
     * @example
     * <caption>This example writes to the console a list of all the actions in the global context.</caption>
     * apex.actions.list().forEach(function(a) {
     *     console.log( "Action Label: " + a.label +
     *         ", Name: " + a.name +
     *         (a.choice !== undefined ? ", Choice: " + a.choice : "" ) );
     * });
     * @returns An array of objects with name, label and optional choice properties.
     */
    list(): any[];
    /**
     * <p>Update any UI elements associated with the action after it changes. Calling update will
     * notify any observers that the action has changed. Debug warnings will be logged and
     * the return value is false if the action has a problem with the shortcut.</p>
     * @example
     * <caption>See example for {@link actions#lookup}</caption>
     * @param pActionName - The name of the action to update.
     * @param [pArgs] - An object containing arguments for the action. If the action is bound
     *   to many row or item instances in a report the <code class="prettyprint">pArgs</code> property
     *   with the same name as the {@link actions.action} <code class="prettyprint">idArg</code> property
     *   value is used to determine which UI element to update.
     * @returns false if the shortcut is invalid or a duplicate and true otherwise.
     */
    update(pActionName: string, pArgs?: any): boolean;
    /**
     * <p>Call this only if the set of choices for an action has changed. This will
     * notify any observers that the set of action choices has changed.</p>
     * @example
     * <caption>This example adds a new choice to the action "choose-fruit".</caption>
     * var action = apex.actions.lookup( "choose-fruit" );
     * action.choices.push( {
     *     label: "Apple",
     *     value: "APPLE"
     * } );
     * apex.actions.updateChoices( "choose-fruit" );
     * @param pActionName - The name of the action that has had its choices updated.
     * @returns false if the action has no choices and true otherwise
     */
    updateChoices(pActionName: string): boolean;
    /**
     * <p>Enable UI elements associated with the action by setting <code class="prettyprint">disabled</code> property to false.
     * This is a convenience method to enable without having to call {@link actions#lookup} and
     * {@link actions#update}.</p>
     * @example
     * <caption>This example enables the "send-email" action.</caption>
     * apex.actions.enable( "send-email" );
     * @param pActionName - The name of the action to enable.
     * @param [pArgs] - An object containing arguments for the action. If the action is bound
     *   to many row or item instances in a report the <code class="prettyprint">pArgs</code> property
     *   with the same name as the {@link actions.action} <code class="prettyprint">idArg</code> property
     *   value is used to determine which UI element to enable.
     */
    enable(pActionName: string, pArgs?: any): void;
    /**
     * <p>Disable UI elements associated with the action by setting <code class="prettyprint">disabled</code> property to true.
     * This is a convenience method to disable without having to call {@link actions#lookup} and
     * {@link actions#update}.</p>
     * @example
     * <caption>This example disables the "send-email" action.</caption>
     * apex.actions.disable( "send-email" );
     * @param pActionName - The name of the action to disable.
     * @param [pArgs] - An object containing arguments for the action. If the action is bound
     *   to many row or item instances in a report the <code class="prettyprint">pArgs</code> property
     *   with the same name as the {@link actions.action} <code class="prettyprint">idArg</code> property
     *   value is used to determine which UI element to disable.
     */
    disable(pActionName: string, pArgs?: any): void;
    /**
     * <p>Hide UI elements associated with the action by setting the <code class="prettyprint">hide</code> property to true.
     * This is a convenience method to hide without having to call {@link actions#lookup} and
     * {@link actions#update}.</p>
     * @example
     * <caption>This example hides the "send-email" action.</caption>
     * apex.actions.hide( "send-email" );
     * @param pActionName - The name of the action to hide.
     * @param [pArgs] - An object containing arguments for the action. If the action is bound
     *   to many row or item instances in a report the <code class="prettyprint">pArgs</code> property
     *   with the same name as the {@link actions.action} <code class="prettyprint">idArg</code> property
     *   value is used to determine which UI element to hide.
     */
    hide(pActionName: string, pArgs?: any): void;
    /**
     * <p>Show UI elements associated with the action by setting the <code class="prettyprint">hide</code> property to false.
     * This is a convenience method to show without having to call {@link actions#lookup} and
     * {@link actions#update}.</p>
     * @example
     * <caption>This example shows the "send-email" action.</caption>
     * apex.actions.show( "send-email" );
     * @param pActionName - The name of the action to show.
     * @param [pArgs] - An object containing arguments for the action. If the action is bound
     *   to many row or item instances in a report the <code class="prettyprint">pArgs</code> property
     *   with the same name as the {@link actions.action} <code class="prettyprint">idArg</code> property
     *   value is used to determine which UI element to show.
     */
    show(pActionName: string, pArgs?: any): void;
    /**
     * <p>Invoke the named action. Even though pEvent and pFocusElement are optional it is recommended to
     * always include them.</p>
     * <p>This has no effect if the action is hidden or disabled.</p>
     * @example
     * <caption>This example invokes the "send-email" action when something is clicked.</caption>
     * $( "#something" ).click( function( event ) {
     *     apex.actions.invoke( "send-email", event, event.target );
     * } );
     * @param pActionName - Name of the action to invoke.
     * @param [pEvent] - Browser event that caused the action to be invoked.
     * @param [pFocusElement] - The element that will receive focus when the action is complete unless
     *   the action returns true. This is likely also the element that had focus when the action was invoked.
     * @param [pArgs] - An object containing arguments for the action. The object properties are the
     *   argument names and the property values are the argument values. This is passed to the action function
     *   as the third argument. This is not used if the action has only an href.
     * @returns false if there is no such action or action has no action method, true if action set the focus,
     *   all other cases should return undefined.
     */
    invoke(pActionName: string, pEvent?: Event, pFocusElement?: Element, pArgs?: any): boolean | undefined;
    /**
     * <p>Toggle the named action. This should only be used for toggle actions.
     * Toggle actions have get and set methods and don't have a choices property.</p>
     * <p>This has no effect if the action is hidden or disabled.</p>
     * @example
     * <caption>This example toggles the "verbose" action of the context
     * <code class="prettyprint">log1</code> returned by {@link apex.actions.createContext}.</caption>
     * log1.toggle( "verbose" );
     * @param pActionName - Name of the action to toggle.
     * @param [pArgs] - An object containing arguments for the toggle action. The object properties are the
     *   argument names and the property values are the argument values. This is passed to the action's
     *   get and set functions as the last argument.
     * @returns false if there is no such action or action doesn't have get/set methods
     * all other cases should return undefined
     */
    toggle(pActionName: string, pArgs?: any): boolean | undefined;
    /**
     * <p>Return the current value of a radio group or toggle action.</p>
     * @example
     * <caption>This example returns the current choice of radio group action "change-view"
     * of the interactive grid region with static id "emp". The Interactive Grid method getActions
     * returns the actions context for the region.</caption>
     * apex.region( "emp" ).call( "getActions" ).get( "change-view" );
     * @param pActionName - The name of the action.
     * @param [pArgs] - An object containing arguments for the get function. The object properties are the
     *   argument names and the property values are the argument values. This is passed to the action's
     *   get function.
     * @returns The current value or null if the action doesn't exist.
     */
    get(pActionName: string, pArgs?: any): string;
    /**
     * <p>Set the value of a radio group action or toggle action.</p>
     * <p>This has no effect if the action is hidden or disabled.</p>
     * @example
     * <caption>This example sets the current choice of radio group action "change-view"
     * of the interactive grid region with static id "emp" to "detail". The Interactive Grid method getActions
     * returns the actions context for the region.</caption>
     * apex.region( "emp" ).call( "getActions" ).set( "change-view", "detail" );
     * @param pActionName - The name of the action.
     * @param pValue - The value to set.
     * @param [pArgs] - An object containing arguments for the set function. The object properties are the
     *   argument names and the property values are the argument values. This is passed as the last argument
     *   to the action's set function.
     */
    set(pActionName: string, pValue: string | boolean, pArgs?: any): void;
    /**
     * <p>Add a keyboard shortcut synonym for an action. Debug warnings are logged if there are problems.
     * See also {@link actions#removeShortcut}.</p>
     * <p>This allows an action to have more than one shortcut key to invoke it.
     * The <code class="prettyprint">shortcut</code> property of the action is not affected.</p>
     * @example
     * <caption>This example adds a shortcut synonym for action "send-email".</caption>
     * apex.actions.addShortcut("Ctrl+Shift+E", "send-email");
     * @param pShortcutName - The keyboard shortcut synonym to add.
     * @param pActionName - The name of the action to add a shortcut for.
     * @param [pChoiceValue] - Choice value only if the action is a radio group. The shortcut
     *   will select the given choice.
     * @returns true if successful and false if there is no such action or there is a duplicate shortcut.
     */
    addShortcut(pShortcutName: actions.shortcutName, pActionName: string, pChoiceValue?: string): boolean;
    /**
     * <p>Remove a keyboard shortcut synonym for an action.
     * See also {@link actions#addShortcut}</p>
     * @example
     * <caption>This example removes a shortcut synonym.</caption>
     * apex.actions.addShortcut( "Ctrl+Shift+E" );
     * @param pShortcutName - The keyboard shortcut synonym to remove.
     * @returns true if successful false if the shortcut is the primary shortcut for an action.
     */
    removeShortcut(pShortcutName: actions.shortcutName): boolean;
    /**
     * <p>Return a list of all shortcuts in the context.</p>
     * @example
     * <caption>This example writes to the console all the shortcuts in the global context.</caption>
     * var i,
     *     shortcuts = apex.actions.listShortcuts();
     * for ( i = 0; i < shortcuts.length; i++ ) { // for each shortcut
     *      console.log("Press shortcut " + shortcuts[i].shortcutDisplay + " to " + shortcuts[i].actionLabel );
     * }
     * @param pWithMarkup - Optional default is false. If true wrap the display name in HTML markup.
     * @returns An array of objects with information about the shortcut.
     */
    listShortcuts(pWithMarkup: boolean): actions.shortcutListItem[];
    /**
     * <p>Return the friendly display string for a keyboard shortcut name.</p>
     * @param pShortcutName - Keyboard shortcut to get the display string for.
     * @param [pWithMarkup] - Optional default is false. If true wrap the display name in HTML markup.
     * @returns A friendly version of the shortcut.
     *   The display string is sensitive to the operating system. See {@link apex.actions.setKeyCaps}.
     */
    shortcutDisplay(pShortcutName: actions.shortcutName, pWithMarkup?: boolean): string;
    /**
     * <p>Return the keyboard shortcut name formatted for the aria-keyshortcuts attribute.</p>
     * @param pShortcutName - Keyboard shortcut to get the ARIA label for.
     * @returns A string formatted for the aria-keyshortcuts attribute or null if the input pShortcutName parameter is not a valid shortcut.
     */
    ariaKeyshortcut(pShortcutName: actions.shortcutName): string | null;
    /**
     * <p>This is used to disable all shortcuts temporarily. Call at the start of a user interaction
     * that should have shortcuts disabled for example a custom popup. Call {@link actions#enableShortcuts} when
     * finished. It is called automatically when APEX modal dialogs or menus open.
     * Calls can be nested. For each call to disableShortcuts there should be a corresponding
     * call to {@link actions#enableShortcuts}.</p>
     */
    disableShortcuts(): void;
    /**
     * <p>This is used to enable all shortcuts after they were disabled with {@link actions#disableShortcuts}.
     * It is called automatically when APEX modal dialogs or menus close.
     * Calls can be nested. For each call to {@link actions#disableShortcuts} there should be a corresponding
     * call to enableShortcuts.</p>
     */
    enableShortcuts(): void;
    /**
     * <p>Register a callback function to be notified when an action changes.
     * This is used to update UI elements associated with an action when that action state changes.
     * The most common elements including buttons, checkbox and radio group inputs, select lists,
     * and menus are already handled.</p>
     * @param pCallback - function notifyObservers( action, operation, args )
     * <ul>
     * <li><em>action</em> is the {@Link actions.action} object that has had a change in state or value.</li>
     * <li><em>operation</em> is one of "add", "remove", "update", or "updateChoices".</li>
     * <li><em>args</em> is an optional object containing any arguments that were passed to the function that
     * updated the action. See the <code class="prettyprint">pArgs</code> parameter to the {@link actions#invoke},
     * {@link actions#update} functions and others for more information about this parameter.</li>
     * </ul>
     */
    observe(pCallback: (...params: any[]) => any): void;
    /**
     * <p>Remove callback.</p>
     * @param pCallback - The function that was added with {@link actions#observe}.
     */
    unobserve(pCallback: (...params: any[]) => any): void;
}

/**
 * Given a DOM node or string ID (pNd), this function returns a DOM node if the element is on the page, or returns false if it is not.
 */
declare function $x(pNd: Element | string): Element | false;

/**
 * Given a DOM node or string ID (pNd), this function returns the value of an APEX item as a string.
 * This will either be a single value, or if the item supports multiple values, it will
 * be a ':' colon separated list of values. Note this does not make use of the configurable separator or
 * storage type for multivalued items.
 * See {@link item#getValue} for more details.
 */
declare function $v(pNd: Element | string): void;

/**
 * Given a DOM node or string ID (pNd), this function returns the value of an APEX item as a string or an array if the item type
 * can contain multiple values. For example checkbox or multi select list.
 * See {@link item#getValue} for more details.
 */
declare function $v2(pNd: Element | string): void;

/**
 * Given a DOM node or string ID (pNd), this function sets the APEX item value taking into account the item type.
 * This is a shortcut for {@link item#setValue}. See setValue documentation for details.
 * @param pNd - The DOM node or string id of the item to set the value on.
 * @param pValue - The value to set. For items that support multiple values (for example a
 * 'Shuttle'), an array of string values can be passed to set multiple values at once.
 * @param [pDisplayValue] - The display value only if different from pValue and can't be determined by the item itself.
 *   For example for the item type Popup LOV, with the attribute Input Field =
 *   'Not Enterable, Show Display Value and Store Return Value', this value sets the Input Field display value.
 *   The value of pValue is used to set the item's hidden return field.
 * @param [pSuppressChangeEvent] - Pass true to prevent the change event from being triggered
 *   for the item being set. The default is false.
 */
declare function $s(pNd: Element | string, pValue: string | string[], pDisplayValue?: string, pSuppressChangeEvent?: boolean): void;

/**
 * Given a DOM node or string ID or an array (pNd), this function returns an array. Used for creating DOM based
 * functionality that can accept a single or multiple DOM nodes.
 */
declare function $u_Carray(pNd: Element | string | any[]): any[];

/**
 * Given a DOM node or string ID or an array (pNd), this function returns a single value, if an pNd is an array but
 * only has one element the value of that element is returned otherwise the array is returned. Used for creating
 * DOM based functionality that can accept a single or multiple DOM nodes.
 * @returns Array or first value
 */
declare function $u_Narray(pNd: Element | string | any[]): any[];

/**
 * If pTest is empty or false return pDefault otherwise return pTest.
 */
declare function $nvl(pTest: any, pDefault: any): any;

/**
 * Sets a specific style property (pStyle) to given value (pString) of a DOM node or DOM node Array (pNd).
 */
declare function $x_Style(pNd: Element | string | Element[], pStyle: string, pString: string): Element | Element[];

/**
 * Hides a DOM node or array of DOM nodes (pNd). This also takes into consideration which type of APEX item is being hidden.
 */
declare function $x_Hide(pNd: Element | string | Element[]): Element | any[];

/**
 * Shows a DOM node or array of DOM nodes (pNd). This also takes into consideration which type of APEX item is being shown.
 */
declare function $x_Show(pNd: Element | string | Element[]): Element | any[];

/**
 * Toggles (shows or hides) a DOM node or array of DOM nodes (pNd).
 */
declare function $x_Toggle(pNd: Element | string | Element[]): Element | any[];

/**
 * Removes a DOM node or array of DOM nodes.
 */
declare function $x_Remove(pNd: Element | string | Element[]): Element | any[];

/**
 * Sets the value (pValue) of a DOM node or array of DOM nodes (pNd).
 */
declare function $x_Value(pNd: Element | string | Element[], pValue: string): void;

/**
 * Starting from a DOM node (pNd), this function cascades up the DOM tree until the tag of node name (pToTag) is found.
 * If the optional pToClass is present, the ancestor node must have a node name that equals pToTag and the class must equal pToClass.
 * @returns The matching DOM node found and false otherwise.
 */
declare function $x_UpTill(pNd: Element | string, pToTag: string, pToClass?: string): Element | false;

/**
 * Given DOM node or array of DOM nodes, this function (shows, hides, or toggles) the entire row that contains
 * the DOM node or array of DOM nodes. This is most useful when using Page Items. This function only works in
 * table layouts since it explicitly looks for a containing tr element.
 * @param pFunc - One of 'TOGGLE', 'SHOW', 'HIDE'
 */
declare function $x_ItemRow(pNd: Element | string | Element[], pFunc: string): void;

/**
 * Given a page item name, this function hides the entire row that holds the item.
 * In most cases, this is the item and its label. This function only works in table
 * layouts since it explicitly looks for a containing tr element.
 */
declare function $x_HideItemRow(pNd: Element | string | Element[]): void;

/**
 * Given a page item name, this function shows the entire row that holds the item.
 * In most cases, this is the item and its label. This function only works in table
 * layouts since it explicitly looks for a containing tr element.
 */
declare function $x_ShowItemRow(pNd: Element | string | Element[]): void;

/**
 * Given a page item name (pNd), this function toggles (shows or hides) the entire row that holds the item.
 * In most cases, this is the item and its label. This function only works in table
 * layouts since it explicitly looks for a containing tr element.
 */
declare function $x_ToggleItemRow(pNd: Element | string | Element[]): void;

/**
 * Hides all DOM nodes referenced in pNdArray and then shows the DOM node referenced by pNd. This is most useful when pNd is also a node in pNdArray.
 */
declare function $x_HideAllExcept(pNd: Element | string | Element[], pNdArray: Element | string | any[]): Element | Element[];

/**
 * Hides all sibling nodes of given DOM node (pNd).
 */
declare function $x_HideSiblings(pNd: Element | string): Element[];

/**
 * Shows all sibling DOM nodes of given DOM nodes (pNd).
 */
declare function $x_ShowSiblings(pNd: Element | string): Element[];

/**
 * Sets the className of a DOM node or array of DOM nodes to class (pClass).
 * @param pClass - The class name to set. Any other class names will be overwritten.
 */
declare function $x_Class(pNd: Element | string | Element[], pClass: string): Element | Element[];

/**
 * Sets the class (pClass) of all DOM node siblings of a node (pNd). If pNdClass is not null the class of pNd is set to pNdClass.
 */
declare function $x_SetSiblingsClass(pNd: Element | string, pClass: string, pNdClass?: string): Element[];

/**
 * Returns an array of DOM nodes by a given class name (pClass). If the pNd parameter is provided, then the returned elements will be all be children of that DOM node. Including the pTag parameter further narrows the list to just return nodes of that tag type.
 */
declare function $x_ByClass(pClass: string, pNd?: Element | string, pTag?: string): any[];

/**
 * Show all the DOM node children of a DOM node (pNd) that have a specific class (pClass) and tag (pTag).
 */
declare function $x_ShowAllByClass(pNd: Element | string, pClass: string, pTag?: string): void;

/**
 * Show all all DOM node children of a DOM node (pNd).
 */
declare function $x_ShowChildren(pNd: Element | string): void;

/**
 * Hide all all DOM node children of a DOM node (pNd).
 */
declare function $x_HideChildren(pNd: Element | string): void;

/**
 * Disables or enables an item or array of items based on (pTest).
 */
declare function $x_disableItem(pNd: Element | string | Element[], pTest: boolean): void;

/**
 * Checks an item or an array of items to see if any are empty, set the class of all items that are empty to pClassFail, set the the class of all items that are not empty to pClass.
 * @returns Array of all items that are empty
 */
declare function $f_get_emptys(pNd: Element | string | Element[], pClassFail?: string, pClass?: string): false | any[];

/**
 * Returns an item value as an array. Useful for multiselects and checkboxs.
 */
declare function $v_Array(pNd: Element | string): any[];

/**
 * Returns an item value as an array. Useful for radio items and checkboxes.
 */
declare function $f_ReturnChecked(pNd: Element | string): any[];

/**
 * Clears the content of a DOM node or array of DOM nodes and hides them.
 * @param pNd - The node(s) to clear and hide.
 */
declare function $d_ClearAndHide(pNd: Element | string | Element[]): void;

/**
 * Returns the DOM nodes of the selected options of a select item (pNd).
 * @returns The selected option elements or false if none selected.
 */
declare function $f_SelectedOptions(pNd: Element | string): Element[] | Element | false;

/**
 * Returns the values of the selected options of a select item (pNd).
 */
declare function $f_SelectValue(pNd: Element | string): any[] | string;

/**
 * Checks an page item's (pThis) value against a set of values (pValue). This function returns true if any value matches.
 */
declare function $v_CheckValueAgainst(pThis: Element | string, pValue: number | string | any[]): boolean;

/**
 * Checks page item's (pThis) value against a value (pValue). If it matches, a DOM node (pThat) is set to hidden. If it does not match, then the DOM node (pThat) is set to visible.
 */
declare function $f_Hide_On_Value_Item(pThis: Element | string, pThat: Element | string | Element[], pValue: number | string | any[]): boolean;

/**
 * Checks an page item's (pThis) value against a value (pValue). If it matches, a DOM node (pThat) is set to visible. If it does not match, then the DOM node (pThat) is set to hidden.
 */
declare function $f_Show_On_Value_Item(pThis: Element | string, pThat: Element | string | Element[], pValue: number | string | any[]): boolean;

/**
 * Checks the value (pValue) of an item (pThis). If it matches, this function hides the table row that holds (pThat). If it does not match, then the table row is shown.
 */
declare function $f_Hide_On_Value_Item_Row(pThis: Element | string, pThat: Element | string | Element[], pValue: number | string | any[]): boolean;

/**
 * Checks the value (pValue) of an item (pThis). If it matches, the function shows the table row that holds pThat. If it does not match then the table row is hidden.
 */
declare function $f_Show_On_Value_Item_Row(pThis: Element | string, pThat: Element | string | Element[], pValue: number | string | any[]): boolean;

/**
 * Checks the value (pValue) of an item (pThis). If it matches, this function disables the item or array of items (pThat). If it does not match, then the item is enabled.
 */
declare function $f_DisableOnValue(pThis: Element | string, pValue: string, pThat: Element | string | Element[]): boolean;

/**
 * Sets the className of an array of nodes that are selected by (pNd), (pClass) and (pTag) to class (pClass2).
 * See {@link $x_ByClass} and {@link $x_Class}.
 */
declare function $x_ClassByClass(pNd: Element | string, pClass: string, pTag?: string, pClass2?: string): Element | Element[];

/**
 * Collects the values of form items contained within DOM node (pThis) of class attribute (pClass) and nodeName (pTag) and returns an array.
 * @returns The collected values.
 */
declare function $f_ValuesToArray(pThis: Element | string, pClass: string, pTag: string): String[];

/**
 * Returns all form input items contained in a DOM node (pNd) of the given type (pType).
 */
declare function $x_FormItems(pNd: Element | string, pType: string): Element[];

/**
 * Check or uncheck (pCheck) all check boxes contained within a DOM node (pThis). If an array of checkboxes DOM nodes (pArray) is provided, use that array for affected check boxes.
 * @param pThis - The DOM node or string id of the DOM node that contains the checkboxes.
 * @param pCheck - true to check and false to uncheck.
 * @param pArray - Checkbox elements.
 */
declare function $f_CheckAll(pThis: Element | string, pCheck: boolean, pArray: Element[]): void;

/**
 * This function sets all checkboxes located in the first column of a table based on the checked state of the calling checkbox (pNd), useful for tabular forms.
 */
declare function $f_CheckFirstColumn(pNd: Element | string): Element[];

/**
 * Given an image element (pThis) and a DOM node (pNd), this function toggles the display of the DOM node (pNd).
 * The src attribute of the image element (pThis) is rewritten. The image src has any plus substrings replaced
 * with minus substrings or minus substrings are replaced with plus substrings.
 */
declare function $x_ToggleWithImage(pThis: Element | string, pNd: Element | string | Element[]): Element;

/**
 * Checks an image (pId) src attribute for a substring (pSearch). If a substring is found, this function replaces the image entire src attribute with (pReplace).
 */
declare function $x_SwitchImageSrc(pNd: Element | string, pSearch: string, pReplace: string): Element | false;

/**
 * Checks an image (pNd) source attribute for a substring (pSearch). The function returns true if a substring (pSearch) is found. It returns false if a substring (pSearch) is not found.
 */
declare function $x_CheckImageSrc(pNd: Element | string, pSearch: string): boolean;

/**
 * Use DOM methods to remove all DOM children of DOM node (pND).
 */
declare function html_RemoveAllChildren(pNd: Element | string): void;

/**
 * Sets the value (pValue) of a select item (pId). If the value is not found, this functions selects the first option (usually the NULL selection).
 */
declare function html_SetSelectValue(pId: Element | string, pValue: string): void;

/**
 * Swaps the form values of two form elements (pThis,pThat).
 * @param pThis - Element or string id for first form element.
 * @param pThat - Element or string id for second form element.
 */
declare function $f_Swap(pThis: Element | string, pThat: Element | string): void;

/**
 * Sets array of form items (pArray) values to sequential number in multiples of (pMultiple).
 */
declare function $f_SetValueSequence(pArray: Element[], pMultiple: string | number): void;

/**
 * Inserts the html element (pTag) as a child node of a DOM node (pThis) with the innerHTML set to (pText).
 * @param pThis - The DOM node to append the new element to.
 * @param [pTag] - The new element tag.
 * @param [pText] - The new element content.
 * @returns The DOM node inserted.
 */
declare function $dom_AddTag(pThis: Element | string, pTag?: string, pText?: string): Element;

/**
 * Appends a table cell &lt;td> to a table row (pThis). And sets the content to (pText).
 */
declare function $tr_AddTD(pThis: Element | string, pText: string): Element;

/**
 * Appends a table header cell &lt;th> to a table row (pThis). And sets the content to (pText).
 */
declare function $tr_AddTH(pThis: Element | string, pText: string): Element;

/**
 * Inserts the html form input element (pType) as a child node of a DOM node (pThis) with an id (pId) and name (pName) value set to (pValue).
 * @param [pType] - The input type. The default is "text".
 * @param [pId] - The input element id.
 * @param [pName] - The input element name.
 * @param [pValue] - The input element value.
 * @returns The element inserted.
 */
declare function $dom_AddInput(pThis: Element | string, pType?: string, pId?: string, pName?: string, pValue?: string): Element;

/**
 * Takes a DOM node (p_Node) and makes it a child of DOM node (p_Parent) and then returns the DOM node (pNode).
 * @param pThis - DOM node or string ID
 * @param pParent - DOM node or string ID
 */
declare function $dom_MakeParent(pThis: Element | string, pParent: Element | string): Element;

/**
 * Give an table row DOM node (pThis), this function sets the background of all table cells to a color (pColor). A global variable gCurrentRow is set to the current table row (pThis).
 */
declare function $x_RowHighlight(pThis: Element | string, pColor: string): void;

/**
 * Give an table row DOM node (pThis), this function clears the background of all table cells.
 */
declare function $x_RowHighlightOff(pThis: Element | string): void;

/**
 * Sets the value of a form element (pNd) to uppercase. Note this does not go through the item setValue method so this
 * will not work with all item types or trigger a change event.
 */
declare function $v_Upper(pNd: Element | string): void;

/**
 * <p>The apex namespace is the top level Oracle APEX namespace and contains a number of sub namespaces,
 * and a few common functions and properties.</p>
 *
 * <p>The apex namespace also contains information on APEX specific events.</p>
 */
declare namespace apex {
    /**
     * <p>The apex.actions namespace contains global functions related to the Oracle APEX actions facility.
     * The methods and properties of the global actions context are also available in the apex.actions namespace but
     * are documented with the {@link actions} interface.
     * </p>
     */
    namespace actions {
        /**
         * <p>Create a new {@link actions} interface object that is scoped to the given DOM element context.
         * Any action buttons or other UI elements must be within the given pContext. Focus must be within pContext for
         * keyboard shortcuts defined in this context to be recognized. A global context at
         * <code class="prettyprint">document.body</code> is created automatically and is accessed from apex.actions.
         * The global context type name is "global".</p>
         *
         * <p>Plug-ins that define actions should use {@link apex.actions.createContext} and add actions to the created
         * context after calling {@link apex.region.create}.</p>
         * @example
         * <caption>This example creates a context within the element with id
         * <code class="prettyprint">myLogger</code> with type name "logger". Actions can then be added to the
         * actions interface <code class="prettyprint">log1</code>.</caption>
         * var log1 = apex.actions.createContext( "logger", $("#myLogger")[0] );
         * @param pTypeName - Type name of the actions context.
         * @param pContext - DOM element context that actions are scoped within.
         * @returns The actions interface object that was created.
         */
        function createContext(pTypeName: string, pContext: Element): actions;
        /**
         * <p>Remove an actions context that was created with {@link apex.actions.createContext}.</p>
         * @example
         * <caption>This example removes the context for the element with id
         * <code class="prettyprint">myLogger</code> with type name "logger".</caption>
         * apex.actions.removeContext( "logger", $("#myLogger")[0] );
         * @param pTypeName - Type name of the actions context to remove.
         * @param pContext - DOM element context that actions are scoped within.
         */
        function removeContext(pTypeName: string, pContext: Element): void;
        /**
         * <p>Return an array of all the actions context type names.</p>
         * @example
         * <caption>This example will log to the console the number of actions in each of the action contexts
         * of all types on the page.</caption>
         * var i, j, types, type, contexts;
         * types = apex.actions.getContextTypes();
         * for ( i = 0; i < types.length; i++ ) { // for each context type
         *     type = types[i];
         *     contexts = apex.actions.getContextsForType( type );
         *     for ( j = 0; j < contexts.length; j++ ) { // for each context instance
         *         console.log("Action context type: " + type + " [" + j + "]. Actions: " + contexts[j].list().length );
         *     }
         * }
         * @returns An array of context type names.
         */
        function getContextTypes(): string[];
        /**
         * <p>Return an array of all the actions context instances for a given type.</p>
         * @example
         * <caption>This example returns the contexts for type name "logger".</caption>
         * var loggers = apex.actions.getContextsForType( "logger" );
         * @param pTypeName - The type name of the actions contexts to return.
         * @returns An array of action instances.
         */
        function getContextsForType(pTypeName: string): actions[];
        /**
         * <p>Return the actions interface for a given context. The pTypeName is optional but if given must
         * match the type name used when the context was created. This is not often needed because the actions object
         * returned from createContext should be saved by any widget/component that created the context.</p>
         * @example
         * <caption>This example returns the context for the element with id
         * <code class="prettyprint">myLogger</code> and with type name "logger".</caption>
         * var log1 = apex.actions.findContext( "logger", $("#myLogger")[0] );
         * @example
         * <caption>This example is the same as the previous one except it does not provide the type name.</caption>
         * var log1 = apex.actions.findContext( $("#myLogger")[0] );
         * @param [pTypeName] - The type name of the actions context.
         * @param pContext - DOM element context that actions are scoped within.
         * @returns The actions interface or undefined if there is no actions defined for pContext.
         */
        function findContext(pTypeName: string, pContext: Element): actions;
        /**
         * <p>Return the actions interface for a context given by the element id of the context or the {@link apex.region}
         * that contains the context.</p>
         * @example
         * <caption>This example returns the context for an Interactive Grid region with static id
         * <code class="prettyprint">contactsIG</code>.</caption>
         * var igActions = apex.actions.findContextById( "contactsIG" );
         * igActions === apex.region( "contactsIG" ).call( "getActions" ) // true;
         * @param pContextId - Element id of the context element or the id of the APEX region that contains the context
         *   element as its widget element. If this parameter is "global" the global context is returned.
         * @returns The actions interface or undefined if there is no actions defined for pContextId.
         */
        function findContextById(pContextId: string): actions;
        /**
         * <p>Get or set the type of shortcut key support. The default is "sequence".
         * </p>
         * <p>Note: The shortcut key support setting does not affect what shortcuts can be defined for actions
         * but only how what the user types is recognized.</p>
         * @example
         * <caption>Get the current setting.</caption>
         * apex.actions.shortcutSupport();
         * @example
         * <caption>Turn off the ability to use shortcuts on the page for all action contexts.</caption>
         * apex.actions.shortcutSupport( "off" );
         * @example
         * <caption>Disable shortcut sequences such as C,B.</caption>
         * apex.actions.shortcutSupport( "single" );
         * @param [pShortcutType] - One of "off", "single", "sequence". If not specified the current value is returned.
         * @returns When no arguments are given returns the current setting otherwise returns nothing.
         */
        function shortcutSupport(pShortcutType?: string): string | undefined;
        /**
         * <p>Different types of keyboards for different types of operating systems or different languages can have
         * different symbols printed on the keys. The shortcuts must be defined according to {@link actions.shortcutName}.
         * This static method lets you set keyboard layout specific names or symbols to display for key names.
         * </p>
         * <p>Note: This affects how shortcuts are displayed not how they are defined.</p>
         * @example
         * <caption>Set some key caps for a Spanish keyboard.</caption>
         * apex.actions.setKeyCaps( {
         *    "/": "Minus",
         *    "Quote": "{",
         *    "Minus": "?"
         * } );
         * @param pKeyCaps - An object that maps the shortcutName key name such as "Ctrl" or "A" to the desired
         * word or character.  Pass in null to clear all the key cap mappings.
         */
        function setKeyCaps(pKeyCaps: any | null): void;
        /**
         * <p>Returns the current key caps. See {@link apex.actions.setKeyCaps}.
         * </p>
         */
        function getKeyCaps(): any;
    }
    /**
     * This namespace property holds all the {@link item} interfaces that have been created on this page.
     * See {@link apex.item|apex.item} for details.
     */

    /**
     * This namespace property holds all the {@link region} interfaces that have been created on this page.
     * See {@link apex.region|apex.region} for details.
     */

    /**
     * This object holds various environment values related to the APEX instance, current application and page.
     * @example
     * <caption>Redirect to page 2 in the current application.</caption>
     * apex.navigation.redirect( "f?p=" + apex.env.APP_ID + ":2:" + apex.env.APP_SESSION );
     * @property APP_USER - The current username
     * @property APP_ID - The application ID
     * @property APP_PAGE_ID - The page ID
     * @property APP_SESSION - The session ID
     * @property APP_FILES - The relative path of the application static files
     * @property WORKSPACE_FILES - The relative path of the workspace static files
     * @property APEX_FILES - The relative path of the files distributed with Oracle APEX
     * @property APEX_VERSION - The full version of the Oracle APEX instance
     * @property APEX_BASE_VERSION - The base version of the Oracle APEX instance
     */
    var env: {
        APP_USER: string;
        APP_ID: string;
        APP_PAGE_ID: string;
        APP_SESSION: string;
        APP_FILES: string;
        WORKSPACE_FILES: string;
        APEX_FILES: string;
        APEX_VERSION: string;
        APEX_BASE_VERSION: string;
    };
    /**
     * <p>This namespace property holds the jQuery function that APEX uses. Ideally there is just one copy
     * of jQuery on a page but it is possible to have multiple copies and even different versions of jQuery on a page.
     * This is sometimes necessary when using third party plugins that only work with an older version of jQuery.
     * Use this property in place of global variables $ or jQuery to ensure you are using the same jQuery library that
     * APEX is using.</p>
     * @example
     * <caption>The following function creates a local variable $ as a convenient way to reference jQuery
     * while ensuring that it is using the same jQuery that APEX uses.</caption>
     * function myFunction() {
     *     var $ = apex.jQuery;
     *     // use $ to access jQuery functionality
     * }
     */
    var jQuery: (...params: any[]) => any;
    /**
     * <p>This namespace property stores the current page context. The current page context is set to the HTML document
     * (same as apex.jQuery(document)).</p>
     * @example
     * <caption> This selects all elements with a CSS class of my_class, in the context of the current page.</caption>
     * apex.jQuery( ".my_class", apex.gPageContext$ );
     */
    var gPageContext$: jQuery;
    /**
     * <p>Determine if the user is or has been interacting with this web app using touch since the browser session
     * began. Note: it is possible for the user to touch for the first time after this function is called.</p>
     *
     * <p>It is rare to need know this information since the app should be designed to work for both touch and non-touch environments.</p>
     * @returns true if the user has been using touch to interact with the web app and false otherwise.
     */
    function userHasTouched(): boolean;
    /**
     * <p>The apex.date namespace contains Oracle APEX functions related to date operations.</p>
     */
    namespace date {
        /**
         * <p>Constants for the different date/time units used by apex.date functions.</p>
         * @example
         * <caption>apex.date.UNIT constant</caption>
         *
         * apex.date.UNIT = {
         *     MILLISECOND: "millisecond",
         *     SECOND: "second",
         *     MINUTE: "minute",
         *     HOUR: "hour",
         *     DAY: "day",
         *     WEEK: "week",
         *     MONTH: "month",
         *     YEAR: "year"
         * };
         * @example
         * <caption>Example usage</caption>
         *
         * apex.date.add( myDate, 2, apex.date.UNIT.DAY );
         * apex.date.add( myDate, 1, apex.date.UNIT.YEAR );
         * apex.date.subtract( myDate, 30, apex.date.UNIT.MINUTE );
         * apex.date.subtract( myDate, 6, apex.date.UNIT.HOUR );
         * @property MILLISECOND - Constant to use for milliseconds
         * @property SECOND - Constant to use for seconds
         * @property MINUTE - Constant to use for minutes
         * @property HOUR - Constant to use for hours
         * @property DAY - Constant to use for days
         * @property WEEK - Constant to use for weeks
         * @property MONTH - Constant to use for months
         * @property YEAR - Constant to use for years
         */
        var UNIT: {
            MILLISECOND: string;
            SECOND: string;
            MINUTE: string;
            HOUR: string;
            DAY: string;
            WEEK: string;
            MONTH: string;
            YEAR: string;
        };
        /**
         * <p>Return true if a given object is a valid date object.</p>
         * @example
         * <caption>Returns if a date object is valid.</caption>
         *
         * var isDateValid = apex.date.isValid( myDate );
         * @param pDate - A date object
         * @returns is it a valid date
         */
        function isValid(pDate: Date): boolean;
        /**
         * <p>Return true if a given string can parse into a date object.
         * <em>Note: This could be browser specific dependent on the implementation of Date.parse.</em></p>
         * <p>Most browsers expect a string in ISO format (ISO 8601) and shorter versions of it, like "2021-06-15T14:30:00" or
         * "2021-06-15T14:30" or "2021-06-15"</p>
         * @example
         * <caption>Returns if a date string is valid.</caption>
         *
         * var isDateValid = apex.date.isValidString( "2021-06-29 15:30" );
         * @param pDateString - A date string
         * @returns is it a valid date
         */
        function isValidString(pDateString: string): boolean;
        /**
         * <p>Return the cloned instance of a given date object.
         * This is useful when you want to do actions on a date object without altering the original object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the clone of a given date object.</caption>
         *
         * var myDate = new Date();
         * var clonedDate = apex.date.clone( myDate );
         * @param pDate - A date object
         * @returns The cloned date object
         */
        function clone(pDate: Date): Date;
        /**
         * <p>Add a certain amount of time to an existing date.
         * This function returns the modified date object as well as altering the original object.
         * If the given date object should not be manipulated use {@link apex.date.clone} before calling this function.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the modified date object.</caption>
         *
         * var myDate = new Date( "2021-06-20" );
         * myDate = apex.date.add( myDate, 2, apex.date.UNIT.DAY );
         * // myDate is now "2021-06-21"
         * @param [pDate = new Date()] - A date object
         * @param pAmount - The amount to add
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns The modified date object
         */
        function add(pDate: Date, pAmount: number, pUnit?: string): Date;
        /**
         * <p>Subtract a certain amount of time of an existing date.
         * This function returns the modified date object as well as altering the original object.
         * If the given date object should not be manipulated use {@link apex.date.clone} before calling this function.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the modified date object.</caption>
         *
         * var myDate = new Date( "2021-06-20" )
         * myDate = apex.date.subtract( myDate, 2, apex.date.UNIT.DAY );
         * // myDate is now "2021-06-19"
         * @param [pDate = new Date()] - A date object
         * @param pAmount - The amount to subtract
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns The modified date object
         */
        function subtract(pDate: Date, pAmount: number, pUnit?: string): Date;
        /**
         * <p>Return the ISO-8601 week number of the year of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the ISO-8601 week number.</caption>
         *
         * var weekNumber = apex.date.ISOWeek( myDate );
         * @param [pDate = new Date()] - A date object
         * @returns The week number
         */
        function ISOWeek(pDate?: Date): number;
        /**
         * <p>Return the week number of a month of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the week number of given month.</caption>
         *
         * var weekNumber = apex.date.weekOfMonth( myDate );
         * @param [pDate = new Date()] - A date object
         * @returns The week number
         */
        function weekOfMonth(pDate?: Date): number;
        /**
         * <p>Return the day count of a month of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the day count of given month.</caption>
         *
         * var dayCount = apex.date.daysInMonth( myDate );
         * @param [pDate = new Date()] - A date object
         * @returns The days count
         */
        function daysInMonth(pDate?: Date): number;
        /**
         * <p>Return the day number of week of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the day number of given week.</caption>
         *
         * var weekDay = apex.date.dayOfWeek( myDate );
         * @param [pDate = new Date()] - A date object
         * @returns The day number
         */
        function dayOfWeek(pDate?: Date): number;
        /**
         * <p>Return the day number of a year of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the day number of given year.</caption>
         *
         * var dayNumber = apex.date.getDayOfYear( myDate );
         * @param [pDate = new Date()] - A date object
         * @returns The day number
         */
        function getDayOfYear(pDate?: Date): number;
        /**
         * <p>Set the day number of a year of a given date object.
         * If the given date object should not be manipulated use {@link apex.date.clone} before calling this function.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the date object.</caption>
         *
         * var myDate = new Date();
         * apex.date.setDayOfYear( myDate, 126 );
         * @param [pDate = new Date()] - A date object
         * @param pDay - The day number
         * @returns The date object
         */
        function setDayOfYear(pDate: Date, pDay: number): Date;
        /**
         * <p>Return the seconds past midnight of day of a given date object.</p>
         * @example
         * <caption>Returns the seconds past midnight.</caption>
         *
         * var seconds = apex.date.secondsPastMidnight( myDate );
         * @param [pDate = new Date()] - A date object
         * @returns seconds past midnight
         */
        function secondsPastMidnight(pDate?: Date): number;
        /**
         * <p>Return a new date object for the first day a month of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the first day of a given month as date object.</caption>
         *
         * var firstDayDate = apex.date.firstOfMonth( myDate );
         * // output: "2021-JUN-01" (as date object)
         * @param [pDate = new Date()] - A date object
         * @returns The first day as date
         */
        function firstOfMonth(pDate?: Date): Date;
        /**
         * <p>Return a new date object for the last day of a month of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the last day of a given month as date.</caption>
         *
         * var lastDayDate = apex.date.lastOfMonth( myDate );
         * // output: "2021-JUN-30" (as date object)
         * @param [pDate = new Date()] - A date object
         * @returns The last day as date
         */
        function lastOfMonth(pDate?: Date): Date;
        /**
         * <p>Return the start date of a day of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the start date of a given day.</caption>
         *
         * var dayStartDate = apex.date.startOfDay( myDate );
         * // output: "2021-JUN-29 24:00:00" (as date object)
         * @param [pDate = new Date()] - A date object
         * @returns The start date of a day
         */
        function startOfDay(pDate?: Date): Date;
        /**
         * <p>Return the end date of a day of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the end date of a given day.</caption>
         *
         * var dayEndDate = apex.date.endOfDay( myDate );
         * // output: "2021-JUN-29 23:59:59" (as date object)
         * @param [pDate = new Date()] - A date object
         * @returns The end date of a day
         */
        function endOfDay(pDate?: Date): Date;
        /**
         * <p>Return the count of months between 2 date objects.</p>
         * @example
         * <caption>Returns the count of months between 2 dates.</caption>
         *
         * var months = apex.date.monthsBetween( myDate1, myDate2 );
         * @param pDate1 - A date object
         * @param pDate2 - A date object
         * @returns The month count
         */
        function monthsBetween(pDate1: Date, pDate2: Date): number;
        /**
         * <p>Return the minimum date of given date object arguments.
         * If <em>pDates</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the minimum (most distant future) of the given date.</caption>
         *
         * var minDate = apex.date.min( myDate1, myDate2, myDate3 );
         * @param [pDates = [new Date()]] - Multiple date objects as arguments
         * @returns The min date object
         */
        function min(...pDates: Date[]): Date;
        /**
         * <p>Return the maximum date of given date object arguments.
         * If <em>pDates</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the maximum (most distant future) of the given date.</caption>
         *
         * var maxDate = apex.date.max( myDate1, myDate2, myDate3 );
         * @param [pDates = [new Date()]] - Multiple date objects as arguments
         * @returns The max date object
         */
        function max(...pDates: Date[]): Date;
        /**
         * <p>Return true if the first date object is before the second date.
         * <em>pUnit</em> controls the precision of the comparison.</p>
         * @example
         * <caption>Returns if a date object is before another.</caption>
         *
         * var isDateBefore = apex.date.isBefore( myDate1, myDate2, apex.date.UNIT.SECOND );
         * @param pDate1 - A date object
         * @param pDate2 - A date object
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns is the date before
         */
        function isBefore(pDate1: Date, pDate2: Date, pUnit?: string): boolean;
        /**
         * <p>Return true if the first date object is after the second date.
         * <em>pUnit</em> controls the precision of the comparison.</p>
         * @example
         * <caption>Returns if a date object is before another.</caption>
         *
         * var isDateAfter = apex.date.isAfter( myDate1, myDate2, apex.date.UNIT.SECOND );
         * @param pDate1 - A date object
         * @param pDate2 - A date object
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns is the date after
         */
        function isAfter(pDate1: Date, pDate2: Date, pUnit?: string): boolean;
        /**
         * <p>Return true if the first date object is the same as the second date.
         * <em>pUnit</em> controls the precision of the comparison.</p>
         * @example
         * <caption>Returns if a date object is the same as another.</caption>
         *
         * var isDateSame = apex.date.isSame( myDate1, myDate2, apex.date.UNIT.SECOND );
         * @param pDate1 - A date object
         * @param pDate2 - A date object
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns is the date same
         */
        function isSame(pDate1: Date, pDate2: Date, pUnit?: string): boolean;
        /**
         * <p>Return true if the first date object is the same or before the second date.
         * <em>pUnit</em> controls the precision of the comparison.</p>
         * @example
         * <caption>Returns if a date object is the same or before another.</caption>
         *
         * var isDateSameBefore = apex.date.isSameOrBefore( myDate1, myDate2, apex.date.UNIT.SECOND );
         * @param pDate1 - A date object
         * @param pDate2 - A date object
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns is the date same/before
         */
        function isSameOrBefore(pDate1: Date, pDate2: Date, pUnit?: string): boolean;
        /**
         * <p>Return true if the first date object is the same or after the second date.
         * <em>pUnit</em> controls the precision of the comparison.</p>
         * @example
         * <caption>Returns if a date object is the same or after another.</caption>
         *
         * var isDateSameAfter = apex.date.isSameOrAfter( myDate1, myDate2, apex.date.UNIT.SECOND );
         * @param pDate1 - A date object
         * @param pDate2 - A date object
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns is the date same/after
         */
        function isSameOrAfter(pDate1: Date, pDate2: Date, pUnit?: string): boolean;
        /**
         * <p>Return true if the first date object is between the second date and the third date.
         * <em>pUnit</em> controls the precision of the comparison.</p>
         * @example
         * <caption>Returns if a date object is between 2 another.</caption>
         *
         * var isDateBetween = apex.date.isBetween( myDate1, myDate2, myDate3, apex.date.UNIT.SECOND );
         * @param pDate1 - A date object
         * @param pDate2 - A date object
         * @param pDate3 - A date object
         * @param [pUnit = apex.date.UNIT.MILLISECOND] - The unit to use - apex.date.UNIT constant
         * @returns is the date between
         */
        function isBetween(pDate1: Date, pDate2: Date, pDate3: Date, pUnit?: string): boolean;
        /**
         * <p>Return true if a given date object is within a leap year.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns if it's a leap year for a given date.</caption>
         *
         * var isLeapYear = apex.date.isLeapYear( myDate );
         * @param [pDate = new Date()] - A date object
         * @returns is a leap year
         */
        function isLeapYear(pDate?: Date): boolean;
        /**
         * <p>Return the ISO format string (ISO 8601) without timezone information of a given date object.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns date as ISO format string.</caption>
         *
         * var isoFormat = apex.date.toISOString( myDate );
         * // output: "2021-06-15T14:30:00"
         * @param [pDate = new Date()] - A date object
         * @returns The formatted date string
         */
        function toISOString(pDate?: Date): string;
        /**
         * <p>Return the relative date in words of a given date object
         * This is the client side counterpart of the PL/SQL function <em>APEX_UTIL.GET_SINCE</em>.
         * If <em>pDate</em> is not provided it uses the current date & time.</p>
         * @example
         * <caption>Returns the relative date in words.</caption>
         *
         * var sinceString = apex.date.since( myDate );
         * // output: "2 days from now" or "30 minutes ago"
         *
         * var sinceString = apex.date.since( myDate, true );
         * // output: "In 1.1y" or "30m"
         * @param [pDate = new Date()] - A date object
         * @param [pShort = false] - Whether to return a short version of relative date
         * @returns The formatted date string
         */
        function since(pDate?: string, pShort?: boolean): string;
        /**
         * <p>Return the formatted string of a date with a given (Oracle compatible) format mask.
         * If <em>pDate</em> is not provided it uses the current date & time.
         * It uses the default date format mask & locale defined in the application globalization settings.</p>
         *
         * <p>Currently not supported Oracle specific formats are:
         * SYEAR,SYYYY,IYYY,YEAR,IYY,SCC,TZD,TZH,TZM,TZR,AD,BC,CC,EE,FF,FX,IY,RM,TS,E,I,J,Q,X</p>
         * @example
         * <caption>Returns the formatted date string.</caption>
         *
         * var dateString = apex.date.format( myDate, "YYYY-MM-DD HH24:MI" );
         * // output: "2021-06-29 15:30"
         *
         * var dateString = apex.date.format( myDate, "Day, DD Month YYYY" );
         * // output: "Wednesday, 29 June 2021"
         *
         * var dateString = apex.date.format( myDate, "Day, DD Month YYYY", "de" );
         * // output: "Mittwoch, 29 Juni 2021"
         * @param [pDate = new Date()] - A date object
         * @param [pFormat = apex.locale.getDateFormat()] - The format mask
         * @param [pLocale = apex.locale.getLanguage()] - The locale
         * @returns The formatted date string
         */
        function format(pDate: Date, pFormat?: string, pLocale?: string): string;
        /**
         * <p>Return the parsed date object of a given date string and a (Oracle compatible) format mask.
         * It uses the default date format mask defined in the application globalization settings.</p>
         *
         * <p>Currently not supported Oracle specific formats are:
         * SSSSS,SYEAR,SYYYY,IYYY,YEAR,IYY,SCC,TZD,TZH,TZM,TZR,AD,BC,CC,EE,FF,FX,IW,IY,RM,TS,WW,E,I,J,Q,W,X</p>
         * @example
         * <caption>Returns the parsed date object.</caption>
         *
         * var date = apex.date.parse( "2021-06-29 15:30", "YYYY-MM-DD HH24:MI" );
         * var date = apex.date.parse( "2021-JUN-29 08:30 am", "YYYY-MON-DD HH12:MI AM" );
         * @param pDateString - A formatted date string
         * @param [pFormat = apex.locale.getDateFormat()] - The format mask
         * @returns The date object
         */
        function parse(pDateString: string, pFormat?: string): Date;
    }
    /**
     * This namespace stores all debug functions of Oracle APEX.
     */
    namespace debug {
        /**
         * Log level constants
         * @property OFF - Logging is off. Value is 0.
         * @property ERROR - Error logging level. Value is 1.
         * @property WARN - Warning logging level. Value is 2.
         * @property INFO - Information logging level. Value is 4.
         * @property APP_TRACE - Application tracing logging level. Value is 6.
         * @property ENGINE_TRACE - Engine tracing logging level. Value is 9.
         */
        var LOG_LEVEL: {
            OFF: number;
            ERROR: number;
            WARN: number;
            INFO: number;
            APP_TRACE: number;
            ENGINE_TRACE: number;
        };
        /**
         * <p>Method that returns the debug log level.
         * The debug log level is synchronized with hidden input element <code class="prettyprint">#pdebug</code>.
         * In a developer session, the default log level is WARN.</p>
         * @example
         * <caption>This example retrieves the logging level, prepends "Level=" and logs to the console.</caption>
         * apex.debug.log( "Level=", apex.debug.getLevel() );
         * @returns Logging level as an integer 1 to 9, or 0 to indicate debug logging is turned off.
         */
        function getLevel(): number;
        /**
         * <p>Method that sets the debug log level. Log messages at or below the specified level are written to the
         * console log. It is rarely necessary to call this function because the debug log level is
         * synchronized with the hidden input element <code class="prettyprint">#pdebug</code> that comes from the server.</p>
         * @example
         * <caption>This example sets the logging level to application tracing.</caption>
         * apex.debug.setLevel( apex.debug.LOG_LEVEL.APP_TRACE );
         * @param pLevel - A number from 1 to 9, where level 1 is most important, and level 9 is least important.
         *   Can be one of the LOG_LEVEL constants. Any other value such as 0 will turn off debug logging.
         */
        function setLevel(pLevel: number): void;
        /**
         * <p>Log a message at the given debug log level. The log level set from the server or with {@link apex.debug.setLevel}
         * controls if the message is actually written. If the set log level is >= pLevel then the message is written.
         * Messages are written using the browsers built-in console logging, if available.
         * Older browsers may not support the console object or all of its features.</p>
         * @example
         * <caption>This example writes the message "Testing" to the console if the logging level is
         *   greater than or equal to 7.</caption>
         * apex.debug.message( 7, "Testing" );
         * @param pLevel - A number from 1 to 9, where level 1 is most important, and level 9 is
         *   least important. Can be one of the {@link apex.debug.LOG_LEVEL} constants.
         *   Any other value such as 0 will turn off debug logging.
         * @param arguments - Any number of parameters which will be logged to the console.
         */
        function message(pLevel: number, ...arguments: any[]): void;
        /**
         * <p>Log an error message. The error function always writes the error, regardless of the log level from the server
         * or set with {@link apex.debug.setLevel}.
         * Messages are written using the browsers built-in console logging, if available. If supported, console.trace is called.
         * Older browsers may not support the console object or all of its features.</p>
         * @example
         * <caption>This example writes the message "Update Failed" to the console.</caption>
         * apex.debug.error( "Update Failed" );
         * @example
         * <caption>This example writes an exception message (from variable
         * <code class="prettyprint">ex</code>) to the console.</caption>
         * apex.debug.error( "Exception: ", ex );
         * @param arguments - Any number of parameters which will be logged to the console.
         */
        function error(...arguments: any[]): void;
        /**
         * <p>Log a warning message. Similar to {@link apex.debug.message} with the level set to WARN.</p>
         * @example
         * <caption>This example writes a warning message to the console if the debug log level is WARN or greater.</caption>
         * apex.debug.warn( "Empty string ignored" );
         * @param arguments - Any number of parameters which will be logged to the console.
         */
        function warn(...arguments: any[]): void;
        /**
         * <p>Log an informational message. Similar to {@link apex.debug.message} with the level set to INFO.</p>
         * @example
         * <caption>This example prints an informational message to the console if the log level is
         *    INFO or greater.</caption>
         * apex.debug.info( "Command successful" );
         * @param arguments - Any number of parameters which will be logged to the console.
         */
        function info(...arguments: any[]): void;
        /**
         * <p>Log a trace message. Similar to {@link apex.debug.message} with the level set to APP_TRACE.</p>
         * @example
         * <caption>This example writes a log message to the console if the debug log level is APP_TRACE
         *   or greater.</caption>
         * apex.debug.trace( "Got click event: ", event );
         * @param arguments - Any number of parameters which will be logged to the console.
         */
        function trace(...arguments: any[]): void;
        /**
         * <p>Log a message. Similar to {@link apex.debug.message} with the level set to the highest level.</p>
         * @example
         * <caption>This example gets the logging level and writes it to the console,
         *   regardless of the current logging level.</caption>
         * apex.debug.log( "Level=", apex.debug.getLevel() );
         * @param arguments - Any number of parameters which will be logged to the console.
         */
        function log(...arguments: any[]): void;
    }
    /**
     * This namespace holds all Dynamic Action functions in Oracle APEX, useful for Dynamic Action plug-in developers.
     */
    namespace da {
        /**
         * <p>For Dynamic Action plug-in developers that write plug-ins that perform Ajax calls, call this function to resume
         * execution of the actions in a dynamic action. Execution of a dynamic action can be paused, if the action's <em>Wait for Result</em>
         * attribute is checked. <em>Wait for Result</em> is a dynamic action plug-in standard attribute designed for use with
         * Ajax-based dynamic actions. If a plug-in exposes this attribute, it will also need to resume execution by calling
         * this function in the relevant place in the plug-in JavaScript code (otherwise your action will break execution of
         * dynamic actions).</p>
         * <p>Note: You should call <em>resume</em> following successful execution of your plug-in logic. In the case where an error
         * has occurred, you must instead call {@link apex.da.handleAjaxErrors} which will handle resuming execution for you.</p>
         * @example
         * <caption>
         * <p>Resume execution of the actions in a dynamic action, indicating that no error has occurred (for example from a "success"
         * callback of an Ajax-based action).</p>
         * <p>Note: When executing dynamic action JavaScript logic, you have access to the 'this' variable, which contains
         * important dynamic action context information. The 'this' variable contains a property called 'resumeCallback',
         * which is a callback function to handle resuming execution of dynamic actions, and is what you need to pass
         * for the <em>pCallback</em> parameter.</p></caption>
         * apex.da.resume( this.resumeCallback, false );
         * @param pCallback - Reference to callback function available from the this.resumeCallback
         *                                      property, handles resuming execution of the dynamic action.
         * @param pErrorOccurred - Indicate to the framework whether an error has occurred. If an error
         *                                      has occurred and the action's <em>Stop Execution on Error</em> attribute
         *                                      is checked, execution of the dynamic action will be stopped.
         */
        function resume(pCallback: (...params: any[]) => any, pErrorOccurred: boolean): void;
        /**
         * <p>For Dynamic Action plug-in developers, call this function to stop execution of the remaining actions in a
         * dynamic action without indicating there was an error.
         * Returning false from the JavaScript function indicates that there has been an error which
         * stops execution of the remaining actions only if the Stop Execution On Error setting is true. This function is
         * useful to stop execution of remaining actions regardless of the Stop Execution On Error setting and also
         * when the action is asynchronous.</p>
         * @example
         * <caption>The following example of a plug-in JavaScript function is asynchronous due to the setTimeout
         * function. It will cancel the remaining actions based on the result of function <code>someCondition</code>.</caption>
         * var self = this;
         * setTimeout( function() {
         *     if ( someCondition() ) {
         *         apex.da.cancel(); // don't process any more actions
         *     } else {
         *         doSomething();
         *     }
         *     apex.da.resume( self.resumeCallback, false );
         * }, 800 );
         */
        function cancel(): void;
        /**
         * For Dynamic Action plug-in developers that write plug-ins that perform Ajax calls, call this function when
         * an Ajax error occurs. Doing so handles both displaying the error message appropriately, and also resuming
         * execution of actions in a dynamic action. It is typically passed as a callback to the <em>error</em> option passed in the
         * <em>pOptions</em> parameter of the {@link apex.server|apex.server} Ajax APIs.
         * @example
         * <caption>The following example shows a typical use case of handleAjaxErrors.</caption>
         * // When executing dynamic action JavaScript logic, you have access to the 'this' variable, which contains
         * // important dynamic action context information. The 'this' variable contains a property called 'resumeCallback',
         * // which is a callback function to handle resuming execution of the actions in a dynamic action.
         * var lResumeCallback = this.resumeCallback;
         *
         * // Define a function that calls handleAjaxErrors
         * // Note: Pass the pjqXHR, pTextStatus and pErrorThrown straight down from the apex.server error callback
         * function _error( pjqXHR, pTextStatus, pErrorThrown ) {
         *     apex.da.handleAjaxErrors( pjqXHR, pTextStatus, pErrorThrown, lResumeCallback );
         * }
         *
         * // In the plug-in's Ajax logic, pass the callback to the 'error' option
         * server.plugin ( lAction.ajaxIdentifier, {
         *     // pData options
         * }, {
         *     error           : _error
         *     // pOptions options
         * });
         * @param pjqXHR - The jqXHR object passed directly from the apex.server error callback.
         * @param pTextStatus - The text status of the error, passed directly from the apex.server error callback.
         * @param pErrorThrown - Text describing the actual error, passed directly from the apex.server error callback.
         * @param pResumeCallback - Reference to callback function available from the this.resumeCallback property,
         *                                      handles resuming execution of the dynamic action.
         */
        function handleAjaxErrors(pjqXHR: any, pTextStatus: string, pErrorThrown: string, pResumeCallback: (...params: any[]) => any): void;
    }
    /**
     * This namespace is used to store all event related functions of Oracle APEX.
     */
    namespace event {
        /**
         * Function used to trigger events, return value defines if the event should be cancelled.
         * @example
         * <caption>Example shows triggering an event called 'click', on an element using the jQuery selector
         * '#myLink' (matches an element with id='myLink'), passing an array of data.</caption>
         * lCancelEvent = apex.event.trigger('#myLink', 'click', ['apples','pears']);
         * @param pSelector - Selector for the element upon which the event will be triggered
         * @param pEvent - The name of the event
         * @param [pData] - Optional additional parameters to pass along to the event handler
         * @returns true if the event is cancelled.
         */
        function trigger(pSelector: jQuery, pEvent: string, pData?: string | any[] | any): boolean;
    }
    /**
     * <p>The apex.item namespace contains global functions related to Oracle APEX items.
     * The {@link apex.item.create} function defines the behavior for an item type.
     * The {@link apex.item|apex.item} function provides access to an {@link item} interface for a specific item. </p>
     */
    namespace item {
        /**
         * <p>This function returns true if and only if there is a DOM element with id equal to pItemId that has had
         * an {@link item} interface created for it with {@link apex.item.create}.</p>
         *
         * <p>For backward compatibility with items that don't call {@link apex.item.create} a default implementation
         * of {@link item} is used to treat any DOM element with an id as if it were an APEX item.
         * There are some simple items with only default behavior that can be used as an item even though isItem returns
         * false for it. This function allows you to distinguish items that explicitly create an
         * {@link item} interface from arbitrary DOM elements.</p>
         * @example
         * <caption>The following will only hide the item if it is an APEX item.</caption>
         * if ( apex.item.isItem( someId ) ) {
         *     apex.item( someId ).hide();
         * }
         * @param pItemId - Item id.
         * @returns true if there is an element with the given id that supports the item interface.
         */
        function isItem(pItemId: string): boolean;
        /**
         * <p>This function is only for item plug-in developers. It provides a plug-in specific implementation for the item.
         * This is necessary to seamlessly integrate a plug-in item type with the built-in item
         * related client-side functionality of Oracle APEX. A plug-in should call this method even if
         * it passes in an empty <code class="prettyprint">pItemImpl</code> object. See also {@link apex.item.addAttachHandler}.</p>
         * @example
         * <caption>The following example shows a call to apex.item.create( pNd, pItemImpl )
         *   with most available callbacks and properties passed to illustrate the syntax (although
         *   it is unlikely that any plug-in needs to supply all of these).</caption>
         * apex.item.create( "P100_COMPANY_NAME", {
         *     item_type: "FANCY_ITEM",
         *     displayValueFor: function( pValue ) {
         *         var lDisplayValue;
         *         // code to determine the display value for pValue
         *         return lDisplayValue;
         *     },
         *     getPopupSelector: function() {
         *         return "<some CSS selector>";
         *     },
         *     getValidity: function() {
         *         var lValidity = { valid: true };
         *         if ( <item is not valid expression> ) {
         *             lValidity.valid = false;
         *         }
         *         return lValidity;
         *     },
         *     getValidationMessage: function() {
         *         // return validation message if invalid or empty string otherwise
         *     },
         *     getValue: function() {
         *         var lValue;
         *         // code to determine lValue based on the item type.
         *         return lValue;
         *     },
         *     setValue: function( pValue, pDisplayValue ) {
         *         // code that sets pValue and pDisplayValue (if required), for the item type
         *     },
         *     reinit: function( pValue, pDisplayValue ) {
         *         // set the value possibly using code like
         *         // this.setValue( pValue, null, true );
         *         return function() {
         *            // make an ajax call that gets new option values for the item
         *         }
         *     },
         *     disable: function() {
         *         // code that disables the item type
         *     },
         *     enable: function() {
         *         // code that enables the item type
         *     },
         *     isDisabled: function() {
         *         // return true if item is disabled and false otherwise
         *     }
         *     show: function() {
         *         // code that shows the item type
         *     },
         *     hide: function() {
         *         // code that hides the item type
         *     },
         *     isChanged: function() {
         *         var lChanged;
         *         // code to determine if the value has changed
         *         return lChanged;
         *     },
         *     addValue: function( pValue ) {
         *         // code that adds pValue to the values already in the item type
         *     },
         *     nullValue: "<null return value for the item>",
         *     setFocusTo: $( "<some jQuery selector>" ),
         *     setStyleTo: $( "<some jQuery selector>" ),
         *     loadingIndicator: function( pLoadingIndicator$ ){
         *         // code to add the loading indicator in the best place for the item
         *         return pLoadingIndicator$;
         *     },
         *     storageType: "separated",
         *     separator: ":"
         * });
         * @example
         * <caption>The following example shows a call to apex.item.create( pNd, pItemImpl )
         *   with delayLoading option set to true. Doing so results in the create function returning a
         *   deferred object, which must be later resolved in order for page load to complete.</caption>
         * var lDeferred = apex.item.create( "P100_COMPANY_NAME", {
         *     // provide other callback functions as needed
         *     delayLoading: true
         * });
         *
         * // At some point later in the code when the item has finished its initialization, resolve the deferred object
         * lDeferred.resolve();
         * @example
         * <caption>The following example shows a call to apex.item.create where the
         *   pItemImpl argument is a function. This item plug-in provides its own custom logic for
         *   the setValue function. The plug-in supports multiple toolbar modes which can be set programmatically
         *   with the custom function setToolbarMode.</caption>
         * apex.item.create( itemName, function( baseItem ) {
         *     baseItem.setValue = function( pValue, pDisplayValue ) {
         *         // code that sets pValue and pDisplayValue (if required), for the item type
         *     };
         *     // provide other callback functions as needed
         *     baseItem.setToolbarMode = function( pMode ) {
         *         // implementation to set the toolbar mode
         *     };
         *     // other custom functions as needed
         * } );
         *
         * // later the custom function can be used as follows
         * apex.item( itemName ).setToolbarMode( "EXPANDED" );
         * @param pItemId - The item name. This is also the id of the main DOM element associated with the item.
         * For backward compatibility this can also be the main item DOM Element. Passing in an element is deprecated and the
         * id/name should be used instead.
         * @param pItemImpl - An object with properties that provide any functions needed to customize the
         * Oracle APEX item instance behavior. All the properties of this object are copied to
         * the item interface so it is possible to add additional methods or properties to it.
         * The {@link item} interface has default implementations
         * for each of its methods that are appropriate for many page items particularly for items that use standard
         * form elements. For each method of {@Link item} you should check if the default handling is appropriate for
         * your item plug-in. If it isn't you can provide your own implementation of the corresponding function
         * through this <code class="prettyprint">pItemImpl</code> object. The default behavior is used for any functions omitted.
         * <p>This parameter can also be a function that is called during creation with a single object argument that is the base item
         * interface. The function should add any needed functions or properties to the item interface.</p>
         *
         * <p>ItemImpl can contain any of the following properties:</p>
         * @param pItemImpl.addValue - <em>function(value, displayValue)</em> Specify a function for adding a value to the item,
         * where the item supports multiple values. This is called by the {@link item#addValue} method which has no default
         * behavior for adding a value. Currently there is no client-side functionality of Oracle APEX dependent on this.
         * <p>Note: Even if this function is defined, the default handling always calls the afterModify method.</p>
         * @param pItemImpl.afterModify - <em>function()</em> Specify a function that is called after an item is modified.
         *   This is useful, for example as some frameworks need to be notified if widgets are
         *   modified, for example their value has been set, or they have been disabled in order to keep both the native
         *   and enhanced controls in sync. This callback provides the hook to do so.
         *   <p class="important">Note: This callback is deprecated.</p>
         * @param pItemImpl.delayLoading - <p>Specify if the item needs to delay APEX page loading. There are many places
         * in the APEX framework where client-side logic is run after the page has finished loading, for example Dynamic Actions
         * set to 'Fire on Initialization', or code defined in the page level attribute 'Execute when Page Loads'. If an item
         * takes longer to initialize (for example if it uses a module loader like RequireJS to load additional modules,
         * or if the underlying JavaScript widget itself takes longer to initialize), setting delayLoading to true allows
         * you to tell APEX to wait for your item to finish initializing, before firing it's built in page load logic. This
         * allows you as a developer to ensure that your item is compatible with these built-in APEX features like Dynamic
         * Actions.</p>
         * <p>When this is set to true, <em>apex.item.create</em> will return a <code class="prettyprint">jQuery</code>
         * deferred object, which will need to be resolved in order for page loading to complete.</p>
         * <p>Note: If using this option, you must ensure your item initializes as quickly as possible, and also that
         * the returned deferred object is always resolved, to avoid disrupting the default APEX page load behavior.</p>
         * <p>Note: It is not necessary for the plug-in item to provide the {@link item#isReady} or
         * {@link item#whenReady} functions. They are added automatically.</p>
         * @param pItemImpl.disable - <em>function()</em> Specify a function for disabling the item, which overrides the
         *   default {@link item#disable} behavior. The default behavior sets the disabled property of the item node to true.
         *   Providing this override could be useful for example where the item consists of compound elements which
         *   also need disabling, or if the item is based on a widget that already has its own disable method that you want
         *   to reuse. Ensuring the item can disable correctly means certain item related client-side functionality of
         *   Oracle APEX still works, for example when using the Disable action of a Dynamic Action to disable
         *   the item.
         *   <p>Note: Even if this function is defined, the default handling always calls the afterModify method.</p>
         * @param pItemImpl.displayValueFor - <em>function(value, [state]):string</em> Specify a function that returns a string
         *   display value that corresponds to the given value. This overrides the default behavior of the
         *   {@link item#displayValueFor} method. The default behavior supports a standard select element and conceals the
         *   value of password inputs.
         * @param pItemImpl.enable - <em>function()</em> Specify a function for enabling the item, which overrides the
         *   default {@link item#enable} behavior. The default behavior sets the disabled property of the item node to false.
         *   Providing this override could be useful for example where the item consists of compound elements which
         *   also need enabling, or if the item is based on a widget that already has its own enable method that you want
         *   to reuse. Ensuring the item can enable correctly means certain item related client-side functionality
         *   of Oracle APEX still works, for example when using the Enable action of a Dynamic Action
         *   to enable the item.
         *   <p>Note: Even if this function is defined, the default handling always calls the afterModify method.</p>
         * @param pItemImpl.getValidationMessage - <em>function():string</em> Specify a function to return the
         *   validation message, which overrides the default {@link item#getValidationMessage} behavior. This function
         *   is not needed if the item implementation uses the native HTML validation API such as
         *   <code class="prettyprint">setCustomValidity</code>.
         * @param pItemImpl.getValidity - <em>function():ValidityState</em> Specify a function that returns a
         *   validity state object, which overrides the default {@link item#getValidity} behavior.
         *   The returned object must at a minimum have the Boolean valid property. It may include any of the properties
         *   defined for the HTML5 ValidityState object. The default implementation returns the validity object of
         *   the item element if there is one otherwise it returns { valid: true }.
         * @param pItemImpl.getValue - <em>function():string</em> Specify a function for getting the item's value,
         *   which overrides the default {@link item#getValue} behavior. The default behavior handles
         *   the standard HTML form elements. Ensuring the item returns its value correctly means certain item related
         *   client-side functionality of Oracle APEX still works, for example in Dynamic Actions to evaluate
         *   a When condition on the item, or when calling the JavaScript function {@link $v} to get the item's value.
         * @param pItemImpl.hide - <em>function()</em> Specify a function for hiding the item, which overrides the default
         *   {@link item#hide} behavior. This could be useful for example where the item consists of compound elements which also
         *   need hiding, or if the item is based on a widget that already has its own hide method that you want to reuse.
         *   Ensuring the item can hide correctly means certain item related client-side functionality of Application
         *   Express still works, for example when using the Hide action of a Dynamic Action, to hide the item.
         *   <p>Note: if the item is in an element with an id that matches the name of the item with a '_CONTAINER' suffix
         *   then the container element is hidden and this function is not called.</p>
         * @param pItemImpl.isChanged - <em>function():Boolean</em> Specify a function that returns true if the
         *   current value of the item has changed and false otherwise, which overrides the default {@link item#isChanged}
         *   behavior. This function allows the Warn on Unsaved Changes feature to work.
         *   The default implementation uses built-in functionality of HTML form elements to detect changes.
         *   If this function does not work correctly then changes to the plug-in item type value will not be
         *   detect and the user will not be warned when they leave the page.
         * @param pItemImpl.isDisabled - <em>function():Boolean</em> Specify a function that returns true if the
         *   item is disabled and false otherwise, which overrides the default {@link item#isDisabled} behavior.
         *   Ensuring the item returns its value correctly means certain item related client-side functionality of
         *   Oracle APEX still works, for example client-side validation and Interactive Grid.
         * @param pItemImpl.item_type - A string that identifies the type of the item.
         * @param pItemImpl.getPopupSelector - <em>function():string</em> Specify a function that returns a
         *   CSS selector that locates the popup used by the item.
         *   Any plug-in item type that uses a popup (a div added near the end of the document
         *   that is positioned near the input item and floating above it) needs to provide a CSS selector that locates
         *   the top level element of the popup. This allows the item type to be used in the Interactive Grid region or
         *   any other region that needs to coordinate focus with the popup. The default implementation returns null.
         *   <p>In addition the top level popup element must be focusable (have attribute tabindex = -1).</p>
         *   <p>For best behavior of a popup in the Interactive Grid. The popup should:
         *   <ul>
         *   <li>have a way of taking focus</li>
         *   <li>close on escape when it has focus</li>
         *   <li>close when the element it is attached to loses focus</li>
         *   <li>return focus to the element that opened the popup when it closes</li>
         *   <li>manage its tab stops so they cycle in the popup or return to the element that opened the popup at the ends</li>
         *   </ul>
         * @param pItemImpl.loadingIndicator - <em>function(loadingIndicator$):jQuery</em> Specify a function that normalizes
         *   how the item's loading indicator is displayed during a partial page refresh of the item.
         *   This function must pass the pLoadingIndicator$ parameter as the first parameter, which contains a
         *   jQuery object with a reference to the DOM element for the loading indicator. The function then adds
         *   this loading indicator to the appropriate DOM element on the page for the item, and also returns the
         *   jQuery object reference to the loading indicator, such that the framework has a reference to it,
         *   so it can remove it once the call is complete.
         *   <p>This is used, for example, if the item is a Cascading LOV and the Cascading LOV Parent Item changes,
         *   or when setting the item's value by using one of the server-side Dynamic Actions such as
         *   Set Value - SQL Statement.</p>
         * @param pItemImpl.nullValue - Specify a value to be used to determine if the item is null.
         *   This is used when the item supports definition of a List of Values, where a developer can define a
         *   Null Return Value for the item and where the default item handling needs to know this in order to
         *   assert if the item is null or empty. This can be done by following these steps:
         *   <p>From the Render function in the plug-in definition, emit the value stored in p_item.lov_null_value as
         *   part of the item initialization JavaScript code that fires when the page loads. For example:
         *   <pre class=class="prettyprint"><code>
         *   # Assumes that you have some JavaScript function called 'com_your_company_your_item'
         *   # that accepts 2 parameters, the first being the name of the item and the second being
         *   # an object storing properties (say pOptions) required by the item's client side code.
         *   apex_javascript.add_onload_code (
         *       p_code => 'com_your_company_your_item('||
         *           apex_javascript.add_value(
         *               apex_plugin_util.page_item_names_to_jquery(p_item.name)||', {'||
         *           apex_javascript.add_attribute(
         *               'lovNullValue', p_item.lov_null_value, false, false)||
         *      '});' );
         *   </code></pre>
         *   <p>Then, in the implementation of com_your_company_your_item( pName, pOptions ) you have the value defined for
         *   the specific item's Null Return Value in the pOptions.lovNullValue property. This can then be used in your
         *   call to {@link apex.item.create}, to set the nullValue property.</p>
         *   <p>Ensuring the nullValue property is set means certain item related client-side functionality of
         *   Oracle APEX still works, for example, in Dynamic Actions to correctly evaluate an is null
         *   or is not null when condition on the item, or when calling the JavaScript function
         *   {@link item#isEmpty} to determine if the item is null.</p>
         * @param pItemImpl.refresh - <em>function()</em> Specify a function to refresh the item.
         * This is called by the {@link item#refresh} method. The default behavior triggers event "apexrefresh"
         * for legacy plug-in items.
         * @param pItemImpl.reinit - <em>function(value, display):function</em> Specify a function to
         *   initialize an item's value when it is reused in a new context. This is only called for column items every time
         *   a new record is being edited. The default behaviour calls {@link item#setValue} and suppresses the change event.
         *   Items that support cascading LOVs should implement this function to first set the item's value (which may also
         *   require adding the value as an option in the item), then return a function where the cascade will take place.
         * @param pItemImpl.removeValue - <em>function(value)</em> Specify a function for removing a value from the item,
         * where the item supports multiple values. This is called by the {@link item#removeValue} method which has no default
         * behavior for removing a value. Currently there is no client-side functionality of Oracle APEX dependent on this.
         * <p>Note: Even if this function is defined, the default handling always calls the afterModify method.</p>
         * @param pItemImpl.setFocusTo - Specify the element to receive focus
         *   when focus is set to the item using the {@link item#setFocus} method. This can be defined as either a jQuery
         *   selector, jQuery object or DOM Element which identifies the DOM element, or a no argument function that returns a jQuery
         *   object referencing the element. This can be useful when the item consists of compound elements,
         *   and you do not want focus to go to the element that has an ID matching the item name, which is the
         *   default behavior.
         *   <p>Ensuring the item sets focus correctly means certain item related client-side functionality of
         *   Oracle APEX still works, for example when using the Set Focus action of a Dynamic Action to
         *   set focus to the item, when users follow the Go to Error link that displays in a validation error
         *   message to go straight to the associated item, or when the item is the first item on a page and
         *   the developer has the page level attribute Cursor Focus set to First item on page.</p>
         * @param pItemImpl.setStyleTo - Specify the element to receive style, when style is set to
         *   the item using the {@link item#setStyle} method. This can be defined as either a jQuery selector,
         *   jQuery object or DOM Element which identifies the DOM element(s), or a no argument function that returns a jQuery object
         *   referencing the element(s). This is useful when the item consists of compound elements, and you do not
         *   want style to be set to the element or just the element, that has an ID matching the item name which is
         *   the default behavior.
         *   <p>Ensuring the item sets style correctly means certain item related client-side
         *   functionality of Oracle APEX still works, for example when using the Set Style action of a
         *   Dynamic Action to add style to the item.</p>
         *   <p>Note: Even if this property is defined, the default behavior of {@link item#setStyle} calls the afterModify method.</p>
         * @param pItemImpl.setValue - <em>function(value, displayValue, suppressChangeEvent)</em> Specify a function for
         *   setting the item's value, which overrides the default {@link item#setValue} behavior. The default behavior handles
         *   the standard HTML form elements. Ensuring the item can set its value correctly means certain item related
         *   client-side functionality of Oracle APEX still works, for example
         *   when using the Set Value action of a Dynamic Action to set the item's value, or when calling the
         *   JavaScript function {@link $s} to set the item's value.
         *   <p>Note: Even when this function is defined, the default handling always calls the afterModify function and
         *   triggers the change event according to the pSuppressChangeEvent parameter. The pSuppressChangeEvent parameter
         *   is provided to this function for informational purpose only. In most cases it can be ignored.</p>
         * @param pItemImpl.show - <em>function()</em> Specify a function for showing the item, which overrides the
         *   default {@link item#show} behavior. This is useful for example where the item consists of compound elements which
         *   also need showing, or if the item is based on a widget that already has its own show method that you want
         *   to reuse. Ensuring the item can show correctly means certain item related client-side functionality of
         *   Oracle APEX still works, for example when using the Show action of a Dynamic Action, to show the item.
         *   <p>Note: if the item is in an element with an id that matches the name of the item with a '_CONTAINER' suffix
         *   then the container element is shown and this function is not called.</p>
         * @param pItemImpl.storageType - A string that identifies how multiple values are stored and sent
         *   to the server. Only applies to items that support multiple values. This does not change how values are
         *   returned by {@link item#getValue}.
         *   Supported types are "separated" and "json-array".
         *   When <code class="prettyprint">storageType</code> is "separated"
         *   then <code class="prettyprint">separator</code> property is required.
         * @param pItemImpl.separator - A string that is used to separate multiple values.
         * @returns Returns a <code class="prettyprint">jQuery</code> Deferred object when delayLoading is set
         * to true. The <code class="prettyprint">jQuery</code> deferred object must be resolved in order for the
         * APEX page load to complete. If delayLoading is set to false (the default), then nothing is returned.
         */
        function create(pItemId: Element | string, pItemImpl: {
            addValue: (...params: any[]) => any;
            afterModify: (...params: any[]) => any;
            delayLoading: boolean;
            disable: (...params: any[]) => any;
            displayValueFor: (...params: any[]) => any;
            enable: (...params: any[]) => any;
            getValidationMessage: (...params: any[]) => any;
            getValidity: (...params: any[]) => any;
            getValue: (...params: any[]) => any;
            hide: (...params: any[]) => any;
            isChanged: (...params: any[]) => any;
            isDisabled: (...params: any[]) => any;
            item_type: string;
            getPopupSelector: (...params: any[]) => any;
            loadingIndicator: (...params: any[]) => any;
            nullValue: string;
            refresh: (...params: any[]) => any;
            reinit: (...params: any[]) => any;
            removeValue: (...params: any[]) => any;
            setFocusTo: Element | string | ((...params: any[]) => any);
            setStyleTo: Element | string | ((...params: any[]) => any);
            setValue: (...params: any[]) => any;
            show: (...params: any[]) => any;
            storageType: string;
            separator: string;
        }): any;
        /**
         * <p>This function is only for item plug-in developers. It provides a way for item plug-ins to initialize
         * without having to render a call to a JavaScript function. The handler function is called when the page
         * initializes.</p>
         * @example
         * <caption>In this example the plug-in render function produces an input element with
         * class "mySuperInput". The following code goes in the plug-in's JavaScript file.</caption>
         * const mySuperInputPrototype = {
         *     type: "MY_SUPER_INPUT",
         *     // other item interface methods ...
         * };
         * function attachMySuperInput( pContext$ ) {
         *    $( "input.mySuperInput", pContext$ ).each( function() {
         *        var myItem$ = $(this);
         *        // Do what is needed to initialize the plug-in myItem$ element.
         *        apex.item.create( this.id, mySuperInputPrototype );
         *    } );
         * }
         * apex.item.addAttachHandler( attachMySuperInput );
         * @param pHandler - <em>pHandler( pContext$ )</em>. A function provided by the plug-in that will initialize
         * all item instances of the plug-in type. The function receives a jQuery object that is the context in which
         * the item(s) can be found.
         */
        function addAttachHandler(pHandler: (...params: any[]) => any): void;
    }
    /**
     * <p>Return an {@link item} interface that is used to access item related methods and properties.</p>
     *
     * <p>Item plug-in developers can override much of the item behavior, by calling {@link apex.item.create} with their overrides.</p>
     *
     * <p>For items that are created with <code class="prettyprint">apex.item.create</code> (which should be most
     * items), the item interface can also be accessed from the {@link apex.items} collection
     * by <code class="prettyprint">pItemId</code>.
     * So for an item with name "P1_NAME" the following are equivalent:<br>
     * <pre>
     * <code class="prettyprint">let myItem = apex.items.P1_NAME;</code>
     * <code class="prettyprint">let myItem = apex.item( "P1_NAME" );</code>
     * </pre>
     * </p>
     * @example
     * <caption>This function is not used by itself. See the examples for methods of the {@link item} interface.</caption>
     * @param pItemId - The item name. This is also the id of the main DOM element associated with the item.
     * For backward compatibility this can also be the main item DOM Element. Passing in an element is deprecated and the
     * id/name should be used instead.
     * @returns The item interface for the given item name. If there is no such item on the page the
     *   returned item interface <code class="prettyprint">node</code> property will be false.
     */
    function item(pItemId: Element | string): item;
    /**
     * <p>This namespace is used for text and message localization related functions of Oracle APEX.
     */
    namespace lang {
        /**
         * <p>Add messages for use by {@link apex.lang.getMessage} and the format functions. Can be called multiple times.
         * Additional messages are merged. It is generally not necessary to call this function, because it is
         * automatically called with all the application text messages that have attribute <em>Used in JavaScript</em> set to on.</p>
         * @example
         * <caption>This example adds a message with key "APPLY_BUTTON_LABEL" and message text "Apply".</caption>
         * apex.lang.addMessages( {
         *     APPLY_BUTTON_LABEL: "Apply"
         * } );
         * @param pMessages - An object whose properties are message keys (names), and the values are localized message text.
         */
        function addMessages(pMessages: any): void;
        /**
         * <p>Load additional messages from the server.</p>
         * <p>When an APEX page loads it automatically loads any text messages that have attribute <em>Used in JavaScript</em>
         * set to on. This function is useful when there are strings that are not always needed on the client
         * but can be loaded on demand.</p>
         * @example
         * <caption>This example loads two additional text messages with names "MY_MESSAGE1" and "MY_MESSAGE2".
         * Once they have been loaded it uses <code class="prettyprint">getMessage</code> to get the message text.</caption>
         * var promise = apex.lang.loadMessages( ["MY_MESSAGE1", "MY_MESSAGE2"] );
         * promise.done(function() {
         *     var text = apex.lang.getMessage("MY_MESSAGE1");
         *     // use text somehow
         * }.fail(function() {
         *     apex.debug.error( "Could not get messages." );
         * };
         * @example
         * <caption>This example loads all the messages for a component. The component has named all its
         * message keys with a common prefix "MY_COMPONENT_". So the following would load messages such as
         * "MY_COMPONENT_MESSAGE1", "MY_COMPONENT_MESSAGE2" and so on.</caption>
         * var promise = apex.lang.loadMessages( ["MY_COMPONENT_%"] );
         * ...
         * @param pMessageKeys - An array of message keys (names) to load. The message keys can end in "%" to load
         *   all the messages with keys that start with the given text.
         * @returns promise resolved (with no data) when messages are available, rejected (with no data) if the
         * ajax request fails.
         */
        function loadMessages(pMessageKeys: string[]): Promise<any>;
        /**
         * <p>Load additional messages from the server only if they are not already loaded.</p>
         * <p>When an APEX page loads it automatically loads any text messages that have attribute <em>Used in JavaScript</em>
         * set to on. This function is useful when there are strings that are not always needed on the client
         * but can be loaded on demand.</p>
         * @example
         * <caption>This example code could be put in a Dynamic Action Execute JavaScript Code action that runs
         * when a "More Details" button is pressed. It loads the "DETAILED_HELP_INFO" message and displays it in
         * an alert.</caption>
         * apex.lang.loadMessage( ["DETAILED_HELP_INFO"], function() {
         *     apex.message.alert( apex.lang.getMessage( "DETAILED_HELP_INFO" );
         * } );
         * @param pMessageKeys - An array of message keys (names) that are needed by pCallback. These messages
         *   will be loaded if needed.
         * @param pCallback - A no argument function that is called when all the keys have been loaded. If all the
         * messages have already been loaded then this function is called right away.
         */
        function loadMessagesIfNeeded(pMessageKeys: string[], pCallback: any): void;
        /**
         * <p>Remove all messages. This method is rarely needed. Many Oracle APEX components rely on client-side
         * messages, so if you clear the messages you need to add any needed messages again.</p>
         * @example
         * <caption>This example removes all messages.</caption>
         * apex.lang.clearMessages();
         */
        function clearMessages(): void;
        /**
         * <p>Return the message associated with the given key.
         * The key is looked up in the messages added with the {@link apex.lang.addMessages}, {@link apex.lang.loadMessages},
         * or {@link apex.lang.loadMessagesIfNeeded} functions.</p>
         * @example
         * <caption>This example returns "OK" when the localized text for key OK_BTN_LABEL is "OK".</caption>
         * apex.lang.getMessage( "OK_BTN_LABEL" );
         * @param pKey - The message key.
         * @returns The localized message text. If the key is not found then the key is returned.
         */
        function getMessage(pKey: string): string;
        /**
         * <p>Return true if pKey exists in the messages added with the {@link apex.lang.addMessages},
         * {@link apex.lang.loadMessages}, or {@link apex.lang.loadMessagesIfNeeded} functions.</p>
         * @example
         * <caption>This example checks for the existence of a message, "EXTRA_MESSAGE", before using it.</caption>
         * if ( apex.lang.hasMessage( "EXTRA_MESSAGE" ) ) {
         *     text += apex.lang.getMessage( "EXTRA_MESSAGE" );
         * }
         * @param pKey - The message key.
         * @returns true if the given message exists and false otherwise.
         */
        function hasMessage(pKey: string): boolean;
        /**
         * <p>Format a message. Parameters in the message, %0 to %9, are replaced with the corresponding function argument.
         * Use %% to include a single %. The replacement arguments are HTML escaped.
         * @example
         * <caption>This example returns "Process 60% complete" when the PROCESS_STATUS message text is
         *   "Process %0%% complete" and the progress variable value is 60.</caption>
         *   apex.lang.formatMessage( "PROCESS_STATUS", progress );
         * @param pKey - The message key. The key is used to lookup the localized message text as if with getMessage.
         * @param pValues - Any number of replacement values, one for each message parameter %0 to %9.
         *   Non string arguments are converted to strings.
         * @returns The localized and formatted message text. If the key is not found then the key is returned.
         */
        function formatMessage(pKey: string, ...pValues: any[]): string;
        /**
         * <p>Formats a message.
         * Same as {@link apex.lang.formatMessage} except the message pattern is given directly.
         * It is already localized or isn't supposed to be.
         * It is not a key. The replacement arguments are HTML escaped.</p>
         * @example
         * <caption>This example returns "Total cost: $34.00" assuming the orderTotal variable equals "34.00".</caption>
         * apex.lang.format( "Total cost: $%0", orderTotal );
         * @param pPattern - The message pattern.
         * @param pValues - Any number of replacement values, one for each message parameter %0 to %9.
         *   Non string arguments are converted to strings.
         * @returns The formatted message text.
         */
        function format(pPattern: string, ...pValues: any[]): string;
        /**
         * <p>Same as {@link apex.lang.formatMessage} except the replacement arguments are not HTML escaped.
         * They must be known to be safe or will be used in a context that is safe.</p>
         * @example
         * <caption>This example returns "You entered &lt;ok>" when the CONFIRM message text is "You entered %0"
         *   and the inputValue variable value is "&lt;ok>". Note this string must be used in a context where HTML escaping
         *   is done to avoid XSS vulnerabilities.</caption>
         * apex.lang.formatMessageNoEscape( "CONFIRM", inputValue );
         * @param pKey - The message key. The key is used to lookup the localized message text as if with getMessage.
         * @param pValues - Any number of replacement values, one for each message parameter %0 to %9.
         *   Non string arguments are converted to strings.
         * @returns The localized and formatted message text. If the key is not found then the key is returned.
         */
        function formatMessageNoEscape(pKey: string, ...pValues: any[]): string;
        /**
         * <p>Same as {@link apex.lang.format}, except the replacement arguments are not HTML escaped.
         * They must be known to be safe or are used in a context that is safe.</p>
         * @example
         * <caption>This example returns "You entered &lt;ok>" when the inputValue variable value is "&lt;ok>".
         *   Note this string must be used in a context where HTML escaping is done to avoid XSS vulnerabilities.</caption>
         * apex.lang.formatNoEscape( "You entered %0", inputValue );
         * @param pPattern - The message pattern.
         * @param pValues - Any number of replacement values, one for each message parameter %0 to %9.
         *   Non string arguments are converted to strings.
         * @returns The formatted message text.
         */
        function formatNoEscape(pPattern: string, ...pValues: any[]): string;
    }
    /**
     * <p>The apex.locale namespace contains Oracle APEX functions related to formatting numbers and
     * dates according to a specific locale. For localizing text messages see {@link apex.lang}.</p>
     */
    namespace locale {
        /**
         * <p>Used to determine if the resources needed by some of the {@link apex.locale} functions
         * have been loaded.</p>
         * @example
         * <caption>Wait until the resources are loaded before formatting a number.</caption>
         * apex.locale.resourcesLoaded( function() {
         *     var formattedNumber = apex.locale.formatCompactNumber( 123456789.12 );
         *     // In the US English locale this will log: "The number is: 123.46M"
         *     console.log( "The number is: " + formattedNumber );
         * } );
         * @example
         * <caption>This is the same as the previous example except it uses the returned promise.</caption>
         * var p = apex.locale.resourcesLoaded();
         * p.done( function() {
         *     var formattedNumber = apex.locale.formatCompactNumber( 123456789.12 );
         *     // In the US English locale this will log: "The number is: 123.46M"
         *     console.log( "The number is: " + formattedNumber );
         * } );
         * @example
         * <caption>This checks to see if the resources are loaded.</caption>
         * if ( apex.locale.resourcesLoaded().state() === "resolved" ) {
         *     // resources are loaded
         * } else {
         *     // resources are not yet loaded
         * }
         * @param [pCallback] - A Function to call when the resources have been loaded. If the resources
         * are already loaded the function is called right away.
         * @returns A promise object. The promise is resolved when the resources have been loaded.
         */
        function resourcesLoaded(pCallback?: (...params: any[]) => any): Promise<any>;
        /**
         * Return the database locale specific group separator for numeric values.
         * @returns The group separator. For example "," (US) or "." (Germany).
         */
        function getGroupSeparator(): string;
        /**
         * Return the database locale specific decimal separator for numeric values.
         * @returns The decimal separator. For example "." (US) or "," (Germany).
         */
        function getDecimalSeparator(): string;
        /**
         * Return the database abbreviated month names as an array. First element of the array is the
         * first month of the year in the current locale.
         * @returns Array of abbreviated month names. For example ["Jan","Feb","Mar", ..., "Dec"]
         */
        function getAbbrevMonthNames(): any[];
        /**
         * Return the database month names as an array. First element of the array is the
         * first month of the year in the current locale.
         * @returns Array of month names. For example ["January","February","March", ...,"December"]
         */
        function getMonthNames(): any[];
        /**
         * Return the database abbreviated day names as an array. First element of the array is the
         * first day of the week in the current locale.
         * @returns Array of abbreviated day names. For example ["Sun","Mon","Tue","Wed",...,"Sat"]
         */
        function getAbbrevDayNames(): any[];
        /**
         * Return the database day names as an array. First element of the array is the
         * first day of the week in the current locale.
         * @returns Array of day names. For example ["Sunday","Monday","Tuesday","Wednesday", ...,"Saturday"]
         */
        function getDayNames(): any[];
        /**
         * Return the database defined date format mask.
         * @returns Date format mask. For example "YYYY/MM/DD" or "DD.MM.YYYY"
         */
        function getDateFormat(): string;
        /**
         * Return the database defined DS date format mask.
         * @returns DS Date format mask. For example "fmMM/DD/RRRR" or "DD.MM.RRRR"
         */
        function getDSDateFormat(): string;
        /**
         * Return the database defined DL date format mask.
         * @returns DL Date format mask. For example "fmDay, Month fmdd, yyyy" or "fmDay, dd. Month yyyy"
         */
        function getDLDateFormat(): string;
        /**
         * Return the current language locale.
         * @returns current language. For example "en", "de", "en-US", ...
         */
        function getLanguage(): string;
        /**
         * Return the database locale specific currency symbol.
         */
        function getCurrency(): string;
        /**
         * Return the database locale specific ISO currency string.
         */
        function getISOCurrency(): string;
        /**
         * Return the database locale specific dual currency symbol.
         */
        function getDualCurrency(): string;
        /**
         * <p>Convert the given string value into a number. It does not strictly validate against the
         * given format but will strip potential format characters from the number so it can be
         * converted to a number. The intention is to allow natural human data entry of numbers.
         * The locale decimal and group separators are considered. If the number exceeds the
         * precision of a JavaScript number (IEEE 754) then NaN is returned unless the loss of
         * precision is to the right of the decimal point and any decimal places specified
         * in the format mask.</p>
         *
         * <p>The octal (0o) and binary (0b) prefixes are never allowed. Only when the format model is hex,
         * the hex (0x) prefix is allowed but not required. Although the scientific notation format model (EEEE)
         * is not supported, strings in scientific notation will be converted using the locale specific decimal
         * separator but group separators and currency symbols are not allowed.</p>
         * @example
         * <caption>In a locale that uses comma as the group separator, period as the
         * decimal separator and $ as the locale currency symbol the following all result in the same number 1234.56.</caption>
         * var number = apex.locale.toNumber( "1,234.56" );
         * number = apex.locale.toNumber( "$1,234.56", "FML999G999G990D00" );
         * number = apex.locale.toNumber( "$1234.56", "FML999G999G990D00" );
         * // number is 1234.56
         * @example
         * <caption>In a locale that uses period as the group separator, comma as the
         * decimal separator and &#x20AC; as the locale currency symbol the following all result in the same number 1234.56.</caption>
         * var number = apex.locale.toNumber( "1.234,56" );
         * number = apex.locale.toNumber( "&#x20AC;1.234,56", "FML999G999G990D00" );
         * number = apex.locale.toNumber( "&#x20AC;1234,56", "FML999G999G990D00" );
         * // number is 1234.56
         * @param pValue - The potentially formatted or partially formatted number string to convert.
         * @param [pFormat] - The optional expected format of the value to convert.
         *  This is a database format model. The format elements V, RN, TM, and EEEE are not supported and will
         *  be ignored.
         * @returns the converted number or NaN if pValue cannot be converted to a number
         */
        function toNumber(pValue: string, pFormat?: string): number;
        /**
         * <p>Formats a number using a database format model similar to the SQL <code>TO_CHAR(<i>number</i>)</code> function.</p>
         * <p>See the Oracle SQL Language reference section on Format Models for more information on the
         * pFormat parameter. The format elements RN, TM, and EEEE are not supported.</p>
         * @example
         * <caption>Format the number 1234.569 with locale specific currency symbol and 2 decimal places.</caption>
         * var formattedNumber = apex.locale.formatNumber( 1234.569, "FML999G999G999G999G990D00" );
         * // In the US English locale this will display: "The cost is: $1,234.57"
         * apex.message.alert( "The cost is: " + formattedNumber, function() {
         *      // do something after message is shown if needed
         * } );
         * @param pValue - The number to format.
         * @param [pFormat] - The database format model. The format elements RN, TM, and EEEE are not supported.
         *     If the format is not given the number is returned as a string with only the decimal separator replaced
         *     with the locale specific decimal separator.
         * @param [pOptions] - Options to override default locale settings. All properties optional.
         * @param pOptions.NLS_NUMERIC_CHARACTERS - A string where the first letter is the decimal separator and
         *   the second letter is the group separator
         * @param pOptions.NLS_CURRENCY - The local currency string.
         * @param pOptions.NLS_DUAL_CURRENCY - The dual currency string.
         * @param pOptions.NLS_ISO_CURRENCY - The ISO currency string. Note: This option differs from the corresponding
         *   database parameter. It is the ISO currency string such as "CAD" rather than the territory name such as "CANADA".
         * @returns The formatted number.
         */
        function formatNumber(pValue: number, pFormat?: string, pOptions?: {
            NLS_NUMERIC_CHARACTERS: string;
            NLS_CURRENCY: string;
            NLS_DUAL_CURRENCY: string;
            NLS_ISO_CURRENCY: string;
        }): string;
        /**
         * <p>Formats the given number in a compact, locale specific way. For example in the US English locale the
         * number 123400 would be formatted as "123.4K" and 1234000 as "1.23M".</p>
         *
         * <p>This function relies on additional resources that are loaded when the page first loads. Calling this function
         * before the resources are loaded returns the number as an unformatted string. See {@link apex.locale.resourcesLoaded}.</p>
         * @example
         * <caption>Format the large number 123456789.12 in a compact format and display it in an alert message.</caption>
         * var largeNumber = 123456789.12;
         * var formattedNumber = apex.locale.formatCompactNumber( largeNumber );
         * // In the US English locale this will display: "The number is: 123.46M"
         * apex.message.alert( "The number is: " + formattedNumber, function() {
         *      // do something after message is shown if needed
         * } );
         * @example
         * <caption>Format the same large number 123456789.12 in a compact format using an option to not include
         *     any fraction digits.</caption>
         * var largeNumber = 123456789.12;
         * var formattedNumber = apex.locale.formatCompactNumber( largeNumber, { maximumFractionDigits: 0 } );
         * // In the US English locale the formattedNumber is equal to 123M"
         * @param pValue - The number value to be formatted.
         * @param [pOptions] - An options object that affect the way the number is formatted. All properties optional.
         * @param pOptions.maximumFractionDigits - The maximum number of digits to display after the decimal point. Default 2.
         * @param pOptions.minimumFractionDigits - The minimum number of digits to display after the decimal point. Default 0.
         * @param pOptions.minimumIntegerDigits - The minimum number of integer digits to display before the decimal point. Default 1.
         * @param pOptions.roundingMode - One of 'DEFAULT', 'HALF_UP', 'HALF_DOWN', 'HALF_EVEN', 'UP', 'DOWN', 'CEILING', 'FLOOR'.
         *     The default is "DEFAULT".
         * @param pOptions.separators - The characters to use for the decimal and group separator. The default is
         *     to use the appropriate locale specific characters.
         * @param pOptions.separators.decimal - The decimal separator character.
         * @param pOptions.separators.group - The group separator character.
         * @param pOptions.useGrouping - If true use locale specific rules to separate digits into groups.
         *     The default is true.
         * @returns The compact formatted number.
         */
        function formatCompactNumber(pValue: number, pOptions?: {
            maximumFractionDigits: number;
            minimumFractionDigits: number;
            minimumIntegerDigits: number;
            roundingMode: string;
            separators: {
                decimal: string;
                group: string;
            };
            useGrouping: boolean;
        }): string;
    }
    /**
     * The apex.message namespace is used to handle client-side display and management of messages in Oracle APEX.
     */
    namespace message {
        /**
         * Message type constants
         * @property SUCCESS - Success message Value "success".
         * @property ERROR - Error message Value "error".
         */
        var TYPE: {
            SUCCESS: string;
            ERROR: string;
        };
        /**
         * Allows a theme to influence some behavior offered by the apex.message API. Call this function from theme page
         * initialization code.
         * @example
         * <caption>The following example shows beforeShow and beforeHide callbacks defined, that add and remove an
         * additional class 'animate-msg' on the notification element, before the default show and hide logic. This will only
         * happen for success messages because of the check on pMsgType.<br/>
         * Note: The callbacks do not return anything, therefore the default show / hide behavior will happen after the
         * callback.</caption>
         * apex.message.setThemeHooks({
         *     beforeShow: function( pMsgType, pElement$ ){
         *         if ( pMsgType === apex.message.TYPE.SUCCESS ) {
         *             pElement$.addClass( "animate-msg" );
         *         }
         *     },
         *     beforeHide: function( pMsgType, pElement$ ){
         *         if ( pMsgType === apex.message.TYPE.SUCCESS ) {
         *             pElement$.removeClass( "animate-msg" );
         *         }
         *     }
         * });
         * @param pOptions - An object that contains the following properties:
         * @param pOptions.beforeShow - Callback function that will be called prior to the default show
         *     page notification functionality. Optionally return false from the callback to completely override default
         *     show functionality. Callback passes the following parameters:
         *     <ul>
         *         <li>pMsgType: Identifies the message type. Use {@link apex.message.TYPE} to identify whether showing an error or success message.</li>
         *         <li>pElement$: jQuery object containing the element being shown.</li>
         *     </ul>
         * @param pOptions.beforeHide - Callback function that will be called prior to the default hide
         *     page notification functionality. Optionally return false from the callback to completely override default
         *     hide functionality. Callback passes the following parameters:
         *     <ul>
         *         <li>pMsgType: Identifies the message type. Use {@link apex.message.TYPE} to identify whether showing an error or success message.</li>
         *         <li>pElement$: jQuery object containing the element being hidden.</li>
         *     </ul>
         * @param pOptions.closeNotificationSelector - jQuery selector to identify the close buttons in notifications,
         *     defaults to that used by Universal Theme ("button.t-Button-closeAlert"). May be required by custom themes if
         *     you still want to have APEX handle the hide logic, and where messaging contains a close notification button
         *     with a different class.
         * @param pOptions.pageErrorsContainerSelector - jQuery selector to identify the HTML element used to display the errors,
         *     defaults to that used by Universal Theme ("#t_Alert_Notification"). May be required by custom themes if
         *     you still want to have APEX to focus the error region after the page level errors are displayed.
         * @param pOptions.successMessageContainerSelector - jQuery selector to identify the HTML element used to display the
         *     success messages on the page, defaults to that used by Universal Theme ("#t_Alert_Success"). May be required by custom
         *     themes if you still want APEX to handle dismissing success messages automatically.
         */
        function setThemeHooks(pOptions: {
            beforeShow: (...params: any[]) => any;
            beforeHide: (...params: any[]) => any;
            closeNotificationSelector: string;
            pageErrorsContainerSelector: string;
            successMessageContainerSelector: string;
        }): void;
        /**
         * <p>Allows the theme or app to influence the auto-dismiss behavior of application success messages. Call this function
         * from page initialization code in the Function and Global Variable Declaration property or in a JavaScript file in
         * the application. If no dismiss preferences have been set using
         * <code class="prettyprint">setDismissPreferences</code> but the application auto-dismiss
         * setting is turned on, success messages will follow the default application setting.</p>
         *
         * <p>Note that it is important to take into consideration the accessibility impact auto-dismiss could have on users who
         * may use special technology to view their screen or need longer than the default 5 seconds to perceive the message.
         * Those users may not see or read a success message before it is dismissed from the page, and therefore could potentially
         * miss the information in the message. Consider providing users with preference settings that use the
         * <code class="prettyprint">dismissPageSuccess</code> and
         * <code class="prettyprint">dismissPageSuccessDuration</code> properties of
         * <code class="prettyprint">setDismissPreferences</code>, to be able to opt out of the auto-dismiss functionality,
         * and/or have control over dismiss duration.</p>
         * @example
         * <caption>The following example shows the <code class="prettyprint">dismissPageSuccess</code> and
         * <code class="prettyprint">dismissPageSuccessDuration</code> properties defined,
         * which determines the auto-dismiss behavior.</caption>
         * apex.message.setDismissPreferences( {
         *     dismissPageSuccess: true,
         *     dismissPageSuccessDuration: 10000  // 10 second duration
         * } );
         * @param pOptions - An object that contains the following properties:
         * @param pOptions.dismissPageSuccess - Use this boolean to allow app users to opt in or out of the auto-dismiss
         *     behavior. If set to false, success messages will not be dismissed automatically. If set to true, success messages
         *     will be dismissed automatically.
         * @param pOptions.dismissPageSuccessDuration - Set the amount of time to delay before dismissing the success message.
         *     The default duration is 5000 milliseconds. Duration is ignored if dismissPageSuccess is false.
         */
        function setDismissPreferences(pOptions: {
            dismissPageSuccess: boolean;
            dismissPageSuccessDuration: number;
        }): void;
        /**
         * <p>This function displays all errors on the apex.message error stack. If you do not want to add to the stack,
         * you must first call clearErrors(). Errors will display using the current app's theme's templates. For page level
         * messages (where location = "page"), error messages use markup from the page template's 'Subtemplate > Notification'
         * attribute. For item level messages (where location = "inline"), error messages use markup from the item's
         * label template's 'Error Display > Error Template' attribute. A side effect of calling this function is that
         * if there are page level errors, APEX will focus the errors container, please refer to {@link apex.message.setThemeHooks}
         * (specifically property pageErrorsContainerSelector), and if only displaying inline errors it will try to focus the first inline error
         * on the page following the display order.</p>
         * <p>Note Theme Developers should bear in mind the following:
         * <ul>
         *     <li>To display errors for a theme correctly, it must define both of the template attributes described above.
         *     In addition, for inline errors the label template must reference the #ERROR_TEMPLATE# substitution string in
         *     either the 'Before Item' or 'After Item' attributes of your label templates.</li>
         *     <li>As a theme developer, you can influence or override what happens when showing page level errors. For more
         *     information, please refer to {@link apex.message.setThemeHooks}, (specifically the beforeShow
         *     callback function, where you would need to check for 'pMsgType === apex.message.TYPE.ERROR' to isolate when
         *     showing page level errors).</li>
         * </ul>
         * @example
         * <caption>In this example, we have 2 new errors to display. We do not want to add to any existing errors
         * that may be displayed, so we first clear any errors. Because we are displaying 2 errors, we pass an array containing
         * 2 error objects. The first error states 'Name is required!', and will display at both 'page' level, and 'inline'
         * with the item 'P1_ENAME'. The message text is considered safe and therefore will not be escaped. The second error
         * states 'Page error has occurred!', and will just display at page level, and the message text is considered safe
         * and therefore will not be escaped.</caption>
         * // First clear the errors
         * apex.message.clearErrors();
         *
         * // Now show new errors
         * apex.message.showErrors( [
         *     {
         *         type:       "error",
         *         location:   [ "page", "inline" ],
         *         pageItem:   "P1_ENAME",
         *         message:    "Name is required!",
         *         unsafe:     false
         *     },
         *     {
         *         type:       "error",
         *         location:   "page",
         *         message:    "Page error has occurred!",
         *         unsafe:     false
         *     }
         * ] );
         * @param pErrors - An object, or array of objects with the following properties:
         * @param pErrors.type - Must pass "error". Other notification types are reserved for future use.
         * @param pErrors.location - Possible values are: "inline", "page" or [ "inline", "page" ].
         * @param pErrors.pageItem - Item reference where an 'inline' error should display.
         *     Required when location = "inline".
         * @param pErrors.message - The error message.
         * @param [pErrors.unsafe = true] - Pass true so that the message will be escaped by showErrors. Pass false if the
         *     message is already escaped and does not need to be escaped by showErrors.
         */
        function showErrors(pErrors: {
            type: string;
            location: string | string[];
            pageItem: string;
            message: string;
            unsafe?: boolean;
        }): void;
        /**
         * This function clears all the errors currently displayed on the page.
         * @example
         * <caption>The following example demonstrates clearing all the errors currently displayed on the page.</caption>
         * apex.message.clearErrors();
         */
        function clearErrors(): void;
        /**
         * <p>Displays a page-level success message. This will clear any previous success messages displayed, and also assumes
         * there are no errors, so will clear any errors previously displayed. Success messages will display using the
         * current app's theme's template. Specifically for page success messages, the markup from the page template's
         * 'Subtemplate > Success Message' attribute will be used.</p>
         *
         * <p>Tip: As a theme developer, you can influence or override what happens when showing a page-level success message.
         * For more information, please refer to the {@link apex.message.setThemeHooks} function (specifically the
         * <code class="prettyprint">beforeShow</code> callback function, where you would need to check for
         * <code class="prettyprint">pMsgType === apex.message.TYPE.SUCCESS</code> to isolate when
         * showing a page-level success message).</p>
         * @example
         * // Displays a page-level success message 'Changes saved!'.
         * apex.message.showPageSuccess( "Changes saved!" );
         * @param pMessage - The success message to display.
         */
        function showPageSuccess(pMessage: string): void;
        /**
         * Hides the page-level success message.
         *
         * Tip: As a theme developer, you can influence or override what happens when hiding a page-level success message.
         * For more information, please refer to the apex.message.setThemeHooks function (specifically the beforeHide
         * callback function, where you would need to check for 'pMsgType === apex.message.TYPE.SUCCESS' to isolate when
         * hiding a page-level success message).
         * @example
         * // Hides the page-level success message.
         * apex.message.hidePageSuccess();
         */
        function hidePageSuccess(): void;
        /**
         * <p>Displays a confirmation dialog with the given message and OK and Cancel buttons. The callback function passed as
         * the pCallback parameter is called when the dialog is closed, and passes true if OK was pressed and false
         * otherwise. The dialog displays using the jQuery UI 'Dialog' widget.</p>
         *
         * <p>There are some differences between this function and a browser's built-in confirm function:
         * <ul>
         *  <li>The dialog style will be consistent with the rest of the app.</li>
         *  <li>The dialog can be moved.</li>
         *  <li>The call to apex.message.confirm does not block, and does not return true or false. Any code defined following
         *   the call to apex.message.confirm will run before the user presses OK or Cancel. Therefore, acting on the user's
         *   choice must be done from within the callback, as shown in the example.</li>
         * </ul>
         * </p>
         * @example
         * // Displays a confirmation message 'Are you sure?'
         * // If OK is pressed executes the 'deleteIt()' function
         * apex.message.confirm( "Are you sure?", function( okPressed ) {
         *     if( okPressed ) {
         *         deleteIt();
         *     }
         * } );
         * @example
         * // Displays a confirmation dialog with extra options
         * apex.message.confirm( "Are you sure you wish to delete this record?", function( okPressed ) {
         *     if( okPressed ) {
         *         deleteIt();
         *     }
         * }, {
         *     title: "Warning!",
         *     style: "danger",
         *     iconClasses: "fa fa-trash fa-2x",
         *     cancelLabel: "No",
         *     confirmLabel: "I'm sure"
         * } );
         * @param pMessage - The message to display in the confirmation dialog
         * @param pCallback - Callback function called when dialog is closed. Function passes the following
         *                              parameter:
         *                              - okPressed: True if OK was pressed, False otherwise (if Cancel pressed, or the
         *                                           dialog was closed by some other means).
         * @param [pOptions] - Extra dialog options
         * @param [pOptions.title] - The dialog title. By default, no title will be shown.
         * @param [pOptions.style] - The dialog style. Options include: "information", "warning", "danger", or "success".
         *                                  The style will set a dialog icon and visual styling.
         *                                  By default, no special styling is applied.
         * @param [pOptions.dialogClasses] - CSS classes to be applied to the dialog container
         * @param [pOptions.iconClasses] - CSS classes which control the dialog icon.
         *                                        This icon will override the default icon set by <code class="prettyprint">pOptions.style</code>
         * @param [pOptions.cancelLabel] - Label of the cancel button.
         *                                        By default, the value of the <code class="prettyprint">APEX.DIALOG.CANCEL</code> text message is used
         * @param [pOptions.cancelLabelKey] - The message key to lookup the localized message to display for cancelLabel
         * @param [pOptions.confirmLabel] - Label of the confirm button.
         *                                         By default, the value of the <code class="prettyprint">APEX.DIALOG.OK</code> text message is used
         * @param [pOptions.confirmLabelKey] - The message key to lookup the localized message to display for confirmLabel
         */
        function confirm(pMessage: string, pCallback: (...params: any[]) => any, pOptions?: {
            title?: string;
            style?: string;
            dialogClasses?: string;
            iconClasses?: string;
            cancelLabel?: string;
            cancelLabelKey?: string;
            confirmLabel?: string;
            confirmLabelKey?: string;
        }): void;
        /**
         * <p>Displays an alert dialog with the given message and OK button. The callback function passed as the pCallback
         * parameter is called when the dialog is closed. The dialog displays using the jQuery UI 'Dialog' widget.</p>
         *
         * <p>There are some differences between this function and a browser's built-in alert function:
         * <ul>
         *  <li>The dialog style will be consistent with the rest of the app.</li>
         *  <li>The dialog can be moved.</li>
         *  <li>The call to apex.message.alert does not block. Any code defined following the call to apex.message.alert will
         *   run before the user presses OK. Therefore code to run after the user closes the dialog must be done from within
         *   the callback, as shown in the example.</li>
         * </ul>
         * </p>
         * @example
         * // Displays an alert 'Load complete.', then after the dialog closes executes the 'afterLoad()' function.
         * apex.message.alert( "Load complete.", function(){
         *     afterLoad();
         * });
         * @example
         * // Displays an alert 'Load complete.' with extra options
         * apex.message.alert( "Load complete.", function() {
         *     afterLoad();
         * }, {
         *     title: "Update",
         *     style: "information",
         *     iconClasses: "fa fa-info fa-2x",
         *     okLabel: "Okay"
         * } );
         * @param pMessage - The message to display in the alert dialog
         * @param pCallback - Callback function called when dialog is closed
         * @param [pOptions] - Extra dialog options
         * @param [pOptions.title] - The dialog title. By default, no title will be shown.
         * @param [pOptions.style] - The dialog style. Options include: "information", "warning", "danger", or "success".
         *                                  The style will set a dialog icon and visual styling.
         *                                  By default, no special styling is applied.
         * @param [pOptions.dialogClasses] - CSS classes to be applied to the dialog container
         * @param [pOptions.iconClasses] - CSS classes which control the dialog icon.
         *                                        This icon will override the default icon set by <code class="prettyprint">pOptions.style</code>
         * @param [pOptions.okLabel] - Label of the OK button.
         *                                         By default, the value of the <code class="prettyprint">APEX.DIALOG.OK</code> text message is used
         * @param [pOptions.okLabelKey] - The message key to look up the localized message to display for okLabel
         */
        function alert(pMessage: string, pCallback: (...params: any[]) => any, pOptions?: {
            title?: string;
            style?: string;
            dialogClasses?: string;
            iconClasses?: string;
            okLabel?: string;
            okLabelKey?: string;
        }): void;
        /**
         * <p>Emits ARIA live polite message for screen reader users. No visual changes rendered.</p>
         * <p>Use this function when meaningful dynamic changes to the UI are made that may not be
         * perceivable to users of assistive technologies. It is best to keep the messages short and relevant.
         * See also {@link apex.message.ariaAlertMessage}.</p>
         *
         * <p>When this function is called, assistive technologies will notify users of updates
         * but generally do not interrupt the current task (such as speech),
         * and updates take low priority.</p>
         * @example
         * <caption>The following example emits the message 'Loading' for screen reader users.</caption>
         * apex.message.ariaMessage( "Loading" );
         * @param pMessage - The message for assistive technologies to emit.
         */
        function ariaMessage(pMessage: string): void;
        /**
         * <p>Emits ARIA live assertive alert message for screen reader users. No visual changes rendered.</p>
         * <p>Use this function when meaningful dynamic changes to the UI are made that may not be
         * perceivable to users of assistive technologies. It is best to keep the messages short and relevant.
         * See also {@link apex.message.ariaMessage}.</p>
         *
         * <p>When this function is called, assistive technologies will immediately notify the user,
         * and could potentially clear the speech queue of previous updates emitted by
         * <code class="prettyprint">apex.message.ariaMessage</code>
         * and <code class="prettyprint">apex.message.ariaAlertMessage</code>.</p>
         * @example
         * <caption>The following example emits an alert message 'Load complete' for screen reader users.</caption>
         * apex.message.ariaAlertMessage( "Load complete" );
         * @param pMessage - The alert message for assistive technologies to emit.
         */
        function ariaAlertMessage(pMessage: string): void;
        /**
         * In order to navigate to items (page items or column items) that have an error (or anything else that can be in an
         * error state), the error item must be visible before it is focused. Any region type that can possibly hide its
         * contents should add a visibility check function using this method. Each function added is called for any region
         * or item that needs to be made visible. This function is for APEX region plug-in developers.
         * @example
         * // For example let's assume we have a Region plug-in type called 'Expander', that can show or hide its contents
         * // and can contain page items. For purposes of example, this plug-in adds an 't-Expander' class to its region
         * // element and also has an 'expand' method available, to expand its contents. This region should register a
         * // visibility check function as follows:
         * apex.message.addVisibilityCheck( function( id ) {
         *     var lExpander$ = $( "#" + id ).closest( ".t-Expander" );
         *
         *     // Check if parent element of the element passed is an 'expander' region
         *     if ( lExpander$.hasClass( "t-Expander" ) ) {
         *
         *         // If so, expander region must show its contents
         *         lExpander$.expander( "expand" );
         *     }
         * });
         * @param pFunction - A function that is called with an element ID. The function should ensure that the
         *                              element is visible if the element is managed or controlled by the region type that
         *                              added the function.
         */
        function addVisibilityCheck(pFunction: (...params: any[]) => any): void;
    }
    /**
     * <p>The apex.model namespace contains methods used to manage client side Oracle APEX data models. These models
     * store data for display by UI components. They correspond to the view-model in the Model-View-ViewModel (MVVM) pattern.
     * See {@link model} for details.</p>
     * <p>This namespace contains functions to manage the lifecycle of a model:</p>
     * <ul>
     * <li>Use {@link apex.model.create} to create a model.</li>
     * <li>Use {@link apex.model.list} to list all the existing models.</li>
     * <li>Use {@link apex.model.get} to return an existing model.</li>
     * <li>Use {@link apex.model.release} to release a model once you are done with it.</li>
     * </ul>
     * <p>Models are reference counted so for every call to <code class="prettyprint">get</code> or
     * <code class="prettyprint">create</code> you must call <code class="prettyprint">release</code>. Failure to do so can
     * result in unused models taking up memory. Typically, the APEX region associated with the model will manage
     * its life cycle.
     * </p>
     * <p>Models typically act as an intermediary between data persisted on the server and one or more views on the client.
     * The <code class="prettyprint">regionId</code> option associates the model with an APEX region for the purpose of
     * fetching and saving data. Models can be created without a <code class="prettyprint">regionId</code>. These are
     * known as local models and they cannot fetch data from or save data to the server.
     * </p>
     * <p>There are also methods such as {@link apex.model.save}, {@link apex.model.anyChanges}, and {@link apex.model.anyErrors}
     * that operate on multiple models.
     * </p>
     * <div class="hw">
     * <h3 id="master-detail">Master Detail</h3>
     * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Master Detail" href="#master-detail"></a>
     * </div>
     * <p>Models can be arranged in a master detail configuration. This is done by providing the
     * <code class="prettyprint">parentModel</code> and <code class="prettyprint">parentRecordId</code>
     * options when creating the detail models. A single master model can have multiple kinds of detail models. For example
     * projects can have tasks and members as details. Each kind of detail model has one or more model instances; each related
     * to a record in the master model. Detail instance models share the same name and field configuration but each
     * has a distinct instance id and different data. A model is uniquely identified by a {@link Model.ModelId}, which in the case
     * of a detail model contains the detail name and instance id. Detail models are cached so that data doesn't have to be
     * fetched from the server unnecessarily. The view layer typically shows a view of the detail instance model that is
     * associated with the current record of the master view. As the current record of the master changes the view layer
     * changes the detail model instance the detail view is showing. The view layer will get a cached instance model if
     * there is one and if not will create the instance model. The maximum number of detail instances to cache is controlled
     * with the {@link apex.model.getMaxCachedModels} and {@link apex.model.setMaxCachedModels} functions. It is the least
     * recently used model that is kicked out of the cache. Models that have changes are not destroyed unless
     * {@link apex.model.destroy} is called.</p>
     * <p>A detail model can be a master to its own set of sub-detail models. This relationship can be nested to any depth.</p>
     */
    namespace model {
        /**
         * <p>Create a model with the given identity, options and optionally initial data.
         * When you are done with the model you must call {@link apex.model.release}. Or if you are sure no one else is using it
         * you can call {@link apex.model.destroy}.</p>
         * @example
         * <caption>This example creates a very simple local table shape model called "people" that stores name and age.
         * The records are arrays and the model is given some initial data. The model is editable and the ID field
         * is the record identity.</caption>
         * var fields = {
         *         ID: {
         *             index: 0
         *         },
         *         NAME: {
         *             index: 1
         *         },
         *         AGE: {
         *             index: 2
         *         }
         *     },
         *     data = [
         *         ["00010", "Mark", "32"],
         *         ["00091", "Mary", "27"],
         *         ...
         *     ];
         * apex.model.create("people", {
         *     shape: "table",
         *     recordIsArray: true,
         *     fields: fields,
         *     identityField: "ID",
         *     editable: true,
         *     paginationType: "none"
         * }, data, data.length );
         * @example
         * <caption>This example creates a table shape model that gets data from a REST service called from the
         * browser by using the <code class="prettyprint">callServer</code> option. The records are objects.
         * The example code only handles the fetch request.</caption>
         * function myRESTCallServer( requestData, options ) {
         *     var deferred = apex.jQuery.Deferred(),
         *         region = requestData.regions[0], // assume there is just one region in the request
         *         offset = region.fetchData.firstRow - 1, // convert to zero-based if needed
         *         count = region.fetchData.maxRows;
         *
         *     // make an ajax request using XMLHttpRequest or fetch API. Use offset and count to specify the page of
         *     // data to fetch as part of the REST URL.
         *     fetch( "some/REST/URL" ).then( function( response ) {
         *         var responseData = response.json();
         *         // suppose the REST service response is an array of records and the records do not have any nested
         *         // structure that needs to be adjusted and the array is in a variable called responseData.
         *         var response = {
         *             regions: [ {
         *                 id: region.id,
         *                 ajaxIdentifier: region.ajaxIdentifier,
         *                 fetchedData: {
         *                     values: responseData,
         *                     firstRow: offset,
         *                     moreData: true
         *                 }
         *             } ]
         *         };
         *         deferred.resolve( response )
         *     } );
         *     return deferred.promise();
         * }
         * var fields = ...;// define model fields according to what the REST service returns.
         * apex.model.create( "people", {
         *     shape: "table",
         *     recordIsArray: false,
         *     fields: fields,
         *     identityField: "ID", // this assumes the REST service returns a field with name "ID" that is the primary key
         *     callServer: myRESTCallServer,
         *     paginationType: "progressive"
         * }, null );
         * @param pModelId - Model identifier. Must be unique for the page. Creating a model with an identifier
         *   that already exists will overwrite the existing model.
         * @param pOptions - Model options. All properties are optional unless specified otherwise.
         * @param pOptions.shape - The shape of data the model holds. One of "table", "tree", or "record". The default is "table".
         * @param pOptions.recordIsArray - If true record fields are stored in an array otherwise the record is an object.
         *   If recordIsArray is true then the field metadata must include the <code class="prettyprint">index</code> property. The default is false.
         * @param pOptions.hasTotalRecords - Only applies if <code class="prettyprint">shape</code> is "table".
         *   If true the sever will always provide the total number of records.
         *   The default is false unless paginationType is "none".
         * @param pOptions.genIdPrefix - A string prefix to use when generating ids for inserted records. The default is "t".
         * @param pOptions.fields - This required option defines the fields of each record.
         *   Each property is the name of a field. The value is a {@link Model.FieldMeta} object with metadata about the field that
         *   the model uses.
         * @param pOptions.regionId - Primary region ID that this model is associated with for the purpose of exchanging
         *   data with the APEX server. If there is no regionId then the model cannot use standard requests to fetch or save
         *   data and therefore is just a local model. The default is null.
         * @param pOptions.ajaxIdentifier - The Ajax Identifier used to identify the Ajax call to fetch or save data.
         *   The default is null.
         * @param pOptions.pageItemsToSubmit - An array of page item names to submit when fetching and saving data.
         *   The default is null.
         * @param pOptions.regionData - Additional data to send at the region level for all requests. The default is an empty object.
         * @param pOptions.fetchData - Additional data to send in fetch requests. The default is an empty object.
         * @param pOptions.saveData - Additional data to send in save requests. The default is an empty object.
         * @param pOptions.requestOptions - The properties of this object are included
         *   in the options object of {@link apex.server.plugin} for any ajax requests made by the model. Setting the
         *   <code class="prettyprint">loadingIndicator</code> property will be ignored. See the
         *   <code class="prettyprint">makeLoadingIndicator</code> property for how to control the loading indicator.
         * @param pOptions.version - This is the version (could be a hash) of the model definition. The value
         *   is opaque to the model. It is sent in all requests; fetch, save etc. If the server detects that the version is
         *   different than it expects then it returns an error. This is to ensure that the client and server agree on the
         *   general model and field definitions. The default is 1. This option currently has no effect and is reserved
         *   for future use.
         * @param pOptions.parentModel - Model identifier of parent (master) model or null if there is no parent.
         *   The default is null.
         * @param pOptions.parentRecordId - Only applies if parentModel is given. The record id of the record in the
         *   parent model that this model is associated with. Typically, this model's ModelId instance and the parentRecordId
         *   are the same. The default is null.
         * @param pOptions.editable - If true the model is editable and false otherwise. The default is false.
         * @param pOptions.trackChanges - If true changes to the model are tracked and can be saved. If false
         *   changes are not tracked and cannot be saved. Setting to false is useful for making optimistic UI updates. This
         *   is when changes are persisted in some other way and the model is updated to reflect the changes that
         *   were already saved. This only applies if editable is true. The default is true.
         * @param pOptions.onlyMarkForDelete - If false deleted records are removed from the collection.
         *   If true then deleted records are marked as deleted but remain in the collection. The default is true however
         *   if trackChanges is false then onlyMarkForDelete is also false.
         * @param pOptions.identityField - Name of identity field or an array of identity field names if the
         *   records have a multivalued primary key. Required if editable is true and shape is not "record".
         *   It is a best practice to specify the identityField even if the model is not editable as it can be useful for
         *   pagination, selection, and fetching additional data. The default is null.
         * @param pOptions.childrenField - This only applies for tree shape models. The name of the field that
         *   contains an array of node children. The default is null.
         * @param pOptions.parentIdentityField - This only applies for tree shape models. The name of parent node
         *   identity field. The default is null.
         * @param pOptions.metaField - The name of meta field. The meta field stores metadata about the record and
         *   possibly record fields The default is null.
         * @param pOptions.check - A function that is called to do additional permission checking.
         * @param pOptions.delayClearData - If false, data is cleared right way. If true, data is cleared after
         *   the next fetch completes. The default is false. Currently only applies to table shape models.
         *   See {@link model#clearData}.
         * @param pOptions.paginationType - One of "none", "one", "progressive".
         * <ul>
         * <li>none: No paging. The server has given all the data it has (it may be capped, but you can't get more)</li>
         * <li>one: The model contains just one page at a time. When it asks the server for a new page it
         *  replaces the previous one.</li>
         * <li>progressive: The model will keep adding to its collection as it gets additional pages from
         *   the server</li>
         * </ul>
         * <p>This only applies to table shape models. The default is "none".</p>
         * @param pOptions.pageSize - This is the number of table rows (records) to fetch from the server.
         *   This only applies to table shape models. The default is 100.
         * @param pOptions.makeLoadingIndicator - <code class="prettyprint">function(jQuery[] progressViews, Object[] progressOptions)</code>.
         *   This is a function that receives an array of progress views and a corresponding array of progress options and returns
         *   a function suitable for the {@link apex.server.plugin} <code class="prettyprint">loadingIndicator</code> option.
         *   It can also return null to disable showing any loading indicator.
         *   If not specified the default is to show the standard APEX progress spinner centered over any visible view(s)
         *   of the model. A view informs the model about its existence by subscribing to the model and passing in the
         *   <code class="prettyprint">progressView</code> and optional <code class="prettyprint">progressOptions</code>
         *   options. See also the {@link model#subscribe} method and {@link Model.Observer}.
         * @param pOptions.callServer - <code class="prettyprint">function(object requestData, object requestOptions) -> promise</code>.
         *   A function that is called in place of {@link apex.server.plugin} for all Ajax
         *   requests the model makes. This has the same signature as {@link apex.server.plugin} with the
         *   optional <code class="prettyprint">pAjaxIdentifier</code> parameter omitted. The jQuery promise returned must
         *   be resolved with the response data. This option allows hooking into the ajax requests to access the request
         *   and response data. In this case your <code class="prettyprint">callServer</code> function simply calls
         *   {@link apex.server.plugin}. This option can also be used to exchange data with something other than the APEX
         *   server for example by making a REST service ajax request. In this case the function must adapt the request and
         *   response data formats between what the model expects and what the REST service expects.
         *   See the {@link model} Ajax Messages section for details.
         * @param pOptions.visibilityFilter - <code class="prettyprint">function(model model, record record, object visibilityFilterContext) -> boolean</code>
         *   A function called by {@link model.updateVisibility} to determine which records are visible.
         *   This is also called when adding new records to the model. The function takes this model, the record,
         *   and the <code class="prettyprint">visibilityFilterContext</code> as arguments and returns true if the
         *   record is visible and false otherwise. See {@link model#updateVisibility} for an example.
         * @param pOptions.visibilityFilterContext - An object value to pass to the
         *   <code class="prettyprint">visibilityFilter</code>.
         * @param [pData] - Initial data to add to the model. For table shape data it is an array of
         *   {@link Model.Record}. For tree shape models it is a {@link Model.Node} for the root. For record shape data it
         *   is a single {@link Model.Record}. If null or not given there is no initial data.
         * @param [pTotal] - Total number of records in the server's collection. Only applies for table shape models.
         * @param [pMoreData] - If true there is more data available on the server for this model. If false
         *   <code class="prettyprint">pData</code> contains all the data. If omitted or null determine if there is more
         *   data based on <code class="prettyprint">pData</code> and <code class="prettyprint">pTotal</code>.
         *   If <code class="prettyprint">pTotal</code> is not given assume there is more data on server.
         *   Only applies for table shape models and only if <code class="prettyprint">paginationType</code> is not "none".
         *   For record shape models can be false when <code class="prettyprint">pData</code> is null to indicate
         *   that there is no data.
         * @param [pDataOverflow] - If true there is more than the sever configured maximum allowed records for
         *   this model. In other words the database has more records in the result set than it is willing to return.
         *   Putting a limit on the amount of data that can be returned is typically done so that both client and
         *   server resources are not overwhelmed. Only applies for table shape models.
         */
        function create(pModelId: Model.ModelId, pOptions: {
            shape: string;
            recordIsArray: boolean;
            hasTotalRecords: boolean;
            genIdPrefix: string;
            fields: {
                [key: string]: Model.FieldMeta;
            };
            regionId: string;
            ajaxIdentifier: string;
            pageItemsToSubmit: string[];
            regionData: any;
            fetchData: any;
            saveData: any;
            requestOptions: any;
            version: number | string;
            parentModel: Model.ModelId;
            parentRecordId: string;
            editable: boolean;
            trackChanges: boolean;
            onlyMarkForDelete: boolean;
            identityField: string | string[];
            childrenField: string;
            parentIdentityField: string;
            metaField: string;
            check: Model.CheckCallback;
            delayClearData: boolean;
            paginationType: string;
            pageSize: number;
            makeLoadingIndicator: (...params: any[]) => any;
            callServer: (...params: any[]) => any;
            visibilityFilter: (...params: any[]) => any;
            visibilityFilterContext: any;
        }, pData?: any[] | any, pTotal?: number, pMoreData?: boolean, pDataOverflow?: boolean): model;
        /**
         * <p>Returns an array of all the currently defined model identifiers in no particular order.
         * If <code class="prettyprint">pModelId</code> is null or not provided all models are listed.
         * If <code class="prettyprint">pModelId</code> contains just a model name then just that model if any and all
         * instances with the same model name if any are returned.
         * If <code class="prettyprint">pModelId</code> contains a model and an instance then just that model instance is included.
         * Specifying <code class="prettyprint">pModelId</code> is most useful when <code class="prettyprint">pIncludeRelated</code> is true.
         * @param [pIncludeLocal] - If true models that don't have a regionId will be included.
         * @param [pModelId] - Model identifier as given in call to {@link apex.model.create} or just a model name.
         * @param [pIncludeRelated] - If true then any dependents of any listed models are included.
         * @returns Array of model identifiers
         */
        function list(pIncludeLocal?: boolean, pModelId?: Model.ModelId, pIncludeRelated?: boolean): Model.ModelId[];
        /**
         * Returns true if any of the specified models have changes.
         * @example
         * <caption>This example displays an alert message if any (non-local) models on the page have unsaved changes.</caption>
         * if ( apex.model.anyChanges() ) {
         *     apex.message.alert("Save Changes");
         * }
         * @param [pIncludeLocal] - If true models that don't have a <code class="prettyprint">regionId</code>
         *   will be included in the check for changes.
         * @param [pModelId] - Model identifier as given in call to {@link apex.model.create} or just a model name.
         *  See {@link apex.model.list} for how this parameter is used to select which models to operate on.
         * @param [pIncludeRelated] - If true then any dependents of any selected models are included in check
         * @returns true if any of the specified models have changed.
         */
        function anyChanges(pIncludeLocal?: boolean, pModelId?: Model.ModelId, pIncludeRelated?: boolean): boolean;
        /**
         * Returns true if any of the specified models have errors.
         * @example
         * <caption>This example displays an alert message if any (non-local) models on the page have errors.</caption>
         * if ( apex.model.anyErrors() ) {
         *     apex.message.alert("Fix Errors");
         * }
         * @param [pIncludeLocal] - If true models that don't have a <code class="prettyprint">regionId</code>
         *   will be included in check for errors.
         * @param [pModelId] - Model identifier as given in call to {@link apex.model.create} or just a model name.
         *  See {@link apex.model.list} for how this parameter is used to select which models to operate on.
         * @param [pIncludeRelated] - If true then any dependents of any selected models are included in check.
         * @returns true if any of the specified models have errors.
         */
        function anyErrors(pIncludeLocal?: boolean, pModelId?: Model.ModelId, pIncludeRelated?: boolean): boolean;
        /**
         * <p>Low level function to add changes for any of the specified models to a request.
         * Changes are added to the provided request data. This doesn't actually send the request to the server.
         * In most cases {@link apex.model.save} should be used rather than this function.</p>
         * @param pRequestData - An initial request object that will have all changes for the specified models added to it.
         * @param [pModelId] - Model identifier as given in call to {@link apex.model.create} or just a model name.
         *  See {@link apex.model.list} for how this parameter is used to select which models to operate on.
         * @param [pIncludeRelated] - If true then any dependents of any selected models are included if they have changes.
         * @returns A function that must be called with the promise returned from the save request.
         */
        function addChangesToSaveRequest(pRequestData: any, pModelId?: Model.ModelId, pIncludeRelated?: boolean): (...params: any[]) => any;
        /**
         * <p>Save any of the specified models that have changes. This consolidates all the model data to save into a single
         * request.</p>
         * @example
         * <caption>This example saves all the models on the page that have changes.</caption>
         * apex.model.save();
         * @param [pRequestData] - An initial request object that will have all changes for the specified models added to it.
         * @param [pOptions] - Options to pass on to {@link apex.server.plugin} API.
         * @param [pModelId] - Model identifier as given in call to {@link apex.model.create} or just a model name.
         * @param [pIncludeRelated] - If true then any dependents of any selected models are included in check.
         * @param [pCallServer] - An optional function to call in place of {@link apex.server.plugin}. See
         *    the callServer option of {@link apex.model.create} for more information.
         * @returns The promise from {@link apex.server.plugin} if a save request is sent or null if there are no
         * changed models to save.
         */
        function save(pRequestData?: any, pOptions?: any, pModelId?: Model.ModelId, pIncludeRelated?: boolean, pCallServer?: (...params: any[]) => any): null | Promise<any>;
        /**
         * <p>Fetches data for multiple models in a single Ajax request. In most cases there is no need to process
         * the data of the promise because the models have already done so.</p>
         * @example
         * <caption>The following example will refresh two interactive grid regions, r1 and r2,
         * with a single ajax request.</caption>
         * // an array of the IG region views
         * let igViews = [
         *     apex.region( "r1" ).call( "getCurrentView" ),
         *     apex.region( "r2" ).call( "getCurrentView" )
         * ];
         * // an array of the IG region view model ids to fetch
         * let modelIds = igViews.map( v => v.model.modelId() );
         *
         * // for each of the views, clear the data without notifying the view
         * igViews.forEach( v => { v.model.clearData( false ) } );
         *
         * apex.model.multipleFetch( null, {
         *     loadingIndicatorPosition: "page"
         * }, modelIds ).done( () => {
         *     // this assumes the IG regions only have grid views
         *     igViews.forEach( v => { v.view$.grid( "refresh" ) } );
         * } );
         * // Compare with: apex.region( "r1" ).refresh(); apex.region( "r2" ).refresh();
         * // which results in 2 ajax requests. Simpler code but more network traffic.
         * @param [pRequestData] - An initial request object that will have fetch requests for the specified models added to it.
         * @param [pOptions] - Options to pass on to {@link apex.server.plugin} API.
         * @param pModelIds - An array of model ids to fetch data for.
         * @param [pCallServer] - An optional function to call in place of {@link apex.server.plugin}. See
         *    the callServer option of {@link apex.model.create} for more information.
         * @returns Returns the promise from {@link apex.server.plugin}, if there is at least one model to
         *   fetch data for. The promise is resolved with the ajax response data. Returns null if there are no valid model
         *   ids given or if all models are already busy fetching data.
         */
        function multipleFetch(pRequestData?: any, pOptions?: any, pModelIds: any[], pCallServer?: (...params: any[]) => any): null | Promise<any>;
        /**
         * Get a model by its model identifier.
         * @example
         * <caption>Get access to a model with model id MyModel and release it when done.</caption>
         * var myModel = apex.model.get("MyModel");
         * // ... do something with myModel
         * apex.model.release("MyModel");  // release it when done
         * @param pModelId - Model identifier as given in call to {@link apex.model.create}.
         * @returns The model identified by pModelId.
         */
        function get(pModelId: Model.ModelId): model;
        /**
         * <p>Release a model if it is not being used but may be used again in the future. This allows the model
         * to be destroyed if needed to conserve memory.</p>
         * <p>Models are reference counted. For every call to {@link apex.model.get} or {@link apex.model.create}
         * a call to {@link apex.model.release} with the same model id is required.
         * When the reference count is zero the model is destroyed unless it is changed or if it has a
         * parent model, in which case it is cached.</p>
         * @example
         * <caption>Get access to a model with model id MyModel and release it when done.</caption>
         * var myModel = apex.model.get("MyModel");
         * // ... do something with myModel
         * apex.model.release("MyModel");  // release it when done
         * @param pModelId - Model identifier as given in call to {@link apex.model.create}.
         */
        function release(pModelId: Model.ModelId): void;
        /**
         * <p>Destroy and remove a model by its identifier. This bypasses reference counting and caching. This method should
         * not be used unless you are sure that no one else is using the model.</p>
         * <p>If <code class="prettyprint">pModelId</code> is a string model name and there are one or more instances
         * they will all be destroyed.</p>
         * @example
         * <caption>Destroy the model with model id MyModel.</caption>
         * apex.model.destroy("MyModel");
         * @param pModelId - Model identifier as given in call to {@link apex.model.create} or just a model name.
         */
        function destroy(pModelId: Model.ModelId): void;
        /**
         * Get the max number of cached detail instance models.
         * @returns Max cached detail instance models.
         */
        function getMaxCachedModels(): number;
        /**
         * Set the max number of cached unreferenced, unchanged detail instance models that will be kept.
         * @param n - Number of unreferenced, unchanged detail instance models that will be kept.
         */
        function setMaxCachedModels(n: number): void;
    }
    /**
     * This namespace contains functions related to dialog, popup, and redirect functionality of Oracle APEX.
     */
    namespace navigation {
        /**
         * <p>Opens the specified page (pWhere) in the current window.</p>
         * @example
         * <caption>This example demonstrates a call to redirect to page 3 within the current application,
         * in the current session, with debugging set to <code class="prettyprint">NO</code> and
         * setting <code class="prettyprint">RP</code> to reset pagination for an Interactive Report on page 3.
         * The substitution string, <code class="prettyprint">APP_SESSION</code> is substituted on the server with the current session ID.</caption>
         * apex.navigation.redirect ( "f?p=&APP_ID.:3:&APP_SESSION.::NO:RP::" );
         * @example
         * <caption>This example demonstrates a very simple call to redirect to page 1 in application ID 102, in the current session.
         * The substitution string, <code class="prettyprint">APP_SESSION</code> is substituted on the server with the current session ID.</caption>
         * apex.navigation.redirect ( "f?p=102:1:&APP_SESSION.:::::" );
         * @example
         * <caption>This example demonstrates a call to redirect to page 3 within the current application, <code class="prettyprint">apex.env.APP_ID</code>
         * in the current session, <code class="prettyprint">apex.env.APP_SESSION</code>, which is processed on the client.
         * This example demonstrates calling this function from within a JavaScript file.</caption>
         * apex.navigation.redirect( "f?p=" + apex.env.APP_ID + ":3:" + apex.env.APP_SESSION );
         * @example
         * <caption>This example demonstrates a call to redirect to a URL defined in a page item, <code class="prettyprint">P1_URL"</code>.</caption>
         * apex.navigation.redirect( apex.item("P1_URL").getValue() );
         * @param pWhere - The URL of the page to open.
         * @param pIgnoreUnsavedChanges - Whether to ignore the checks for unsaved changes. The default is false.
         */
        function redirect(pWhere: string, pIgnoreUnsavedChanges: boolean): void;
        /**
         * <p>This namespace contains functions related to a popup window opened with {@link apex.navigation.popup|apex.navigation.popup}.</p>
         */
        namespace popup {
            /**
             * <p>Sets the value of the item in the parent window (pItem) with (pValue), and then closes the popup window.
             * This function should only be called from an Oracle APEX page that has been opened as a popup window,
             * via a call to {@link apex.navigation.popup|apex.navigation.popup}, where the call to {@link apex.navigation.popup|apex.navigation.popup}
             * is originating from another Oracle APEX page.</p>
             * @example
             * <caption>This example demonstrates a call to close a popup window,
             * setting the page item P3_STATUS to the string "Action Processed".</caption>
             *
             * apex.navigation.popup.close ( "P3_STATUS", "Action Processed." );
             * @param pItem - The DOM Element or string id (item name) of the page item to be set with the value of <code class="prettyprint">pValue</code>.
             * @param pValue - The value to be save to the page item referenced in <code class="prettyprint">pItem</code>.
             */
            function close(pItem: Element | string, pValue: string): void;
        }
        /**
         * <p>Opens the given URL in a new typically named popup window. If a window with that name already exists, it is reused.
         * If no name is given or the name is "_blank" then a new unnamed popup window is opened. The names "_self", "_parent"
         * and "_top" should not be used. The window name is made unique so that it cannot be shared with other apps.</p>
         *
         * <p>Every effort is made to focus the window. The intention is that the window will be a popup window
         * and not a tab. The default window features are such that most browsers should open a new window.</p>
         *
         * <p class="important">Note: To avoid being suppressed by a popup blocker, call this from a click event handler on a link or a button.</p>
         * @example
         * <caption>This example demonstrates a very simple call to open an unnamed popup window.
         * The new window can be accessed from variable <code class="prettyprint">myPopupWindow</code>.
         * It is best to supply the url, name and possibly the height and width; all other parameters will have their default value.</caption>
         * var myPopupWindow = apex.navigation.popup (
         *     {
         *         url:    "about:blank",
         *         name:   "_blank",
         *         width:  400,
         *         height: 400
         *     }
         *     );
         * @example
         * <caption>This example demonstrates a call to open the url in a named popup window, "Information".
         * The new window can be accessed from variable <code class="prettyprint">myPopupWindow</code>.
         * Some additional parameters are also set in the call, to control scrolling, resizing and the visibility of a toolbar.
         * The variable <code class="prettyprint">myTriggeringElement</code> is used to define the triggering element of the popup,
         * a button named <code class="prettyprint">myButton</code>. Using a call to {@link apex.navigation.dialog.registerCloseHandler},
         * a new handler can be defined, to associate the close action of the dialog with the button.</caption>
         *
         * var myTriggeringElement,
         *     myPopupWindow;
         *
         * myTriggeringElement = apex.jQuery( '#myButton' );
         *
         * myPopupWindow = apex.navigation.popup ( {
         *     url:       "f?p=102:2:&APP_SESSION.:::2::",
         *     name:      "Information",
         *     scroll:    "no",
         *     resizable: "no",
         *     toolbar:   "yes"
         * } );
         *
         * navigation.dialog.registerCloseHandler( {
         *     handler$:           myTriggeringElement,
         *     dialog:             myPopupWindow,
         *     triggeringElement$: myTriggeringElement,
         *     closeFunction:      function() {
         *         myPopupWindow.close();
         *     }
         * });
         * @param pOptions - An object with the following optional properties:
         * @param [pOptions.url] - The page URL to open in the window. The default is "about:blank".
         * @param [pOptions.name] - The name of the window. The default is "_blank", which opens a new unnamed window.
         * @param [pOptions.height] - The height of window content area in pixels. The default is 600.
         * @param [pOptions.width] - The width of window content area in pixels. The default is 600.
         * @param [pOptions.scroll] - "yes" or "no". The default is "no".
         * @param [pOptions.resizeable] - "yes" or "no". The default is "yes".
         * @param [pOptions.toolbar] - "yes" or "no". The default is "no".
         * @param [pOptions.location] - "yes" or "no". The default is "no".
         * @param [pOptions.statusbar] - "yes" or "no". The default is "no". This controls the status feature.
         * @param [pOptions.menubar] - "yes" or "no". The default is "no".
         * @returns The window object of named window or null, if window was not opened.
         */
        function popup(pOptions: {
            url?: string;
            name?: string;
            height?: number;
            width?: number;
            scroll?: string;
            resizeable?: string;
            toolbar?: string;
            location?: string;
            statusbar?: string;
            menubar?: string;
        }): any | null;
        /**
         * <p>Opens the given URL in a new named window or tab (the browser / browser user preference settings may control
         * if a window or tab is used). If a window with that name already exists it is reused. The names "_self", "_parent"
         * and "_top" should not be used. The window name is made unique so that it cannot be shared with other apps.
         * Every effort is made to then focus the new window.</p>
         *
         * <p>Unlike a popup, the new window is intended to be fully functional. This is intended to be as close
         * as you can get to a normal anchor with a target (<code class="prettyprint">&lt;a target="name" href="..."&gt;</code>)
         * behavior from JavaScript but with the feature of focusing the window in all browsers by default.</p>
         *
         * <p>If option <code class="prettyprint">favorTabbedBrowsing</code> is true:
         * For IE, Edge, and Firefox, the user may need to manually focus the
         * tab (assuming the browser is configured to open pages in tabs).</p>
         *
         * <p>If option <code class="prettyprint">favorTabbedBrowsing</code> is not true (the default):
         * For IE and Firefox, the page will be opened in a new browser window
         * (unless explicitly overridden by a browser setting). But it will very likely be able to focus
         * the new page.</p>
         *
         * <p>Once the named window is open the <code class="prettyprint">favorTabbedBrowsing</code> setting doesn't apply to that window.</p>
         *
         * <p class="important">Note: Firefox, Edge, and IE will not focus a tab if that tab isn't the currently active tab in its browser window.</p>
         *
         * <p class="important">Note: For Opera the Advanced/content > JavaScript  Options: "Allow raising of windows" must be checked in order for
         * focus to work.</p>
         *
         * <p class="important">Note: To avoid being suppressed by a popup blocker call this from a click event handler on a link or button.</p>
         * @example
         * <caption>This example opens the URL in variable <code class="prettyprint">url</code> in a new window.
         * The new window can be accessed from variable <code class="prettyprint">myWindow</code>.</caption>
         * var myWindow = apex.navigation.openInNewWindow( url, "MyWindow" );
         * @param pURL - The URL of the page to load.
         * @param [pWindowName] - The name of the window. The default is "_blank".
         * @param [pOptions] - Options object with these properties:
         * @param [pOptions.altSuffix] - An Alternative suffix to append to <code class="prettyprint">pWindowName</code> to make it unique.
         * @param [pOptions.favorTabbedBrowsing] - If true, don't try to force a new window for the benefit of being able to focus it.
         * @param [pOptions.noopener] - If true the new opened window does not have access to this window via its
         *   <code class="prettyprint">window.opener</code> property.
         *   The default is true if the new window name is "_blank" and false otherwise.
         * @returns The window object of named window or null if window was not opened. Note that if
         *   option <code class="prettyprint">noopener</code> is true then the return value is always null.
         */
        function openInNewWindow(pURL: string, pWindowName?: string, pOptions?: {
            altSuffix?: string;
            favorTabbedBrowsing?: boolean;
            noopener?: boolean;
        }): any | null;
        /**
         * <p>This namespace contains functions related to a dialog opened with {@link apex.navigation.dialog|apex.navigation.dialog}.
         * All of the functions in the {@link apex.navigation.dialog|apex.navigation.dialog} namespace need to be run in the context of the specified dialog page.</p>
         */
        namespace dialog {
            /**
             * <p>Executes an action and then closes the dialog window.</p>
             * @example
             * <caption>This example demonstrates chaining from one modal dialog page to another, where the <code class="prettyprint">pAction</code> parameter is
             * a function that redirects to a different modal dialog page, specified in the URL:</caption>
             * apex.navigation.dialog.close( true, function( pDialog ) {
             *     apex.navigation.dialog(
             *         url,
             *         {
             *             title: "About",
             *             height: "480",
             *             width: "800",
             *             maxWidth: "1200",
             *             modal: true,
             *             dialog: pDialog,
             *             resizable: false
             *         },
             *         "a-Dialog--uiDialog",
             *         $( "#mybutton_static_id" ) );
             * } );
             * @example
             * <caption>This example demonstrates closing a modal dialog page, and returning an array of page items,
             * <code class="prettyprint">P3_EMPNO</code> and <code class="prettyprint">P3_ENAME</code>.  The values from the page items can then be used by the
             * page that launched the modal dialog, via a <code class="prettyprint">Dialog Closed</code> Dynamic Action event.</caption>
             * apex.navigation.dialog.close( true, ["P3_EMPNO","P3_ENAME"] );
             * @example
             * <caption>This example demonstrates closing a modal dialog page, and returning an object of page item,
             * <code class="prettyprint">dialogPageId</code> and its value of <code class="prettyprint">3</code>.  The returned value can be used by the
             * page that launched the modal dialog, via a <code class="prettyprint">Dialog Closed</code> Dynamic Action event, to identify the
             * page ID of the modal dialog that triggered the event.</caption>
             * apex.navigation.dialog.close( true, { dialogPageId: 3 } );
             * @param pIsModal - If true, then the dialog is identified as being modal. If false, then the dialog is identified as being non-modal.
             * @param [pAction] - The action can be one of the following:
             *    <ul>
             *        <li>a URL which will trigger a redirect in the parent page</li>
             *        <li>a function to redirect to a different dialog page</li>
             *        <li>false to cancel the dialog</li>
             *        <li>an object of page items and values which will be exposed in the apexafterclosedialog or apexafterclosecanceldialog event</li>
             *        <li>an array of page item names, the values will be gathered from the page items to create
             *         an object of page item values to be exposed in the apexafterclosedialog or apexafterclosecanceldialog event</li>
             *    </ul>
             */
            function close(pIsModal: boolean, pAction?: string | ((...params: any[]) => any) | any): void;
            /**
             * <p>Closes the dialog window.</p>
             * @example
             * <caption>This example demonstrates closing a modal dialog page</caption>
             * apex.navigation.dialog.cancel( true );
             * @param pIsModal - If true, then the dialog is identified as being modal. If false, then the dialog is identified as being non-modal.
             */
            function cancel(pIsModal: boolean): void;
            /**
             * <p>Registers the internal "close" event of a dialog. The event will be triggered by fireCloseEvent and depending on
             * the passed in <code class="prettyprint">pAction</code> will:</p>
             *
             * <ul>
             *     <li>Re-use the existing dialog and navigate to a different dialog page</li>
             *     <li>Navigate to a different page in the caller</li>
             *     <li>Cancel the dialog</li>
             *     <li>Close the dialog and trigger the "apexafterclosedialog" or "apexafterclosecanceldialog" event</li>
             * </ul>
             * @example
             * <caption>This example demonstrates a call to open the url in a named popup window, "Information".
             * The new window can be accessed from variable <code class="prettyprint">myPopupWindow</code>.
             * Some additional parameters are also set in the call, to control scrolling, resizing and the visibility of a toolbar.
             * The variable <code class="prettyprint">myTriggeringElement</code> is used to define the triggering element of the popup,
             * a button named <code class="prettyprint">myButton</code>. Using a call to {@link apex.navigation.dialog.registerCloseHandler},
             * a new handler can be defined, to associate the close action of the dialog with the button.</caption>
             *
             * var myTriggeringElement,
             *     myPopupWindow;
             *
             * myTriggeringElement = apex.jQuery( '#myButton' );
             *
             * myPopupWindow = apex.navigation.popup ( {
             *     url:       "f?p=102:2:&APP_SESSION.:::2::",
             *     name:      "Information",
             *     scroll:    "no",
             *     resizable: "no",
             *     toolbar:   "yes"
             * } );
             *
             * apex.navigation.dialog.registerCloseHandler( {
             *     handler$:           myTriggeringElement,
             *     dialog:             myPopupWindow,
             *     triggeringElement$: myTriggeringElement,
             *     closeFunction:      function() {
             *         myPopupWindow.close();
             *     }
             * });
             * @param pOptions - Has to contain the following attributes:
             * @param [pOptions.handler$] - jQuery object where the event will be registered for.
             * @param [pOptions.dialog] - DOM Element/jQuery/... object of the current dialog instance which will be passed into the open dialog call if the existing dialog should be re-used.
             * @param [pOptions.closeFunction] - Function which is used to close the dialog.
             */
            function registerCloseHandler(pOptions: {
                handler$?: any;
                dialog?: Element | any;
                closeFunction?: (...params: any[]) => any;
            }): void;
        }
        /**
         * <p>Opens the specified page ( pUrl ) in a dialog.  The <code class="prettyprint">modal</code> option determines if the page is
         * a modal page or a non-modal page.</p>
         *
         * <p>A modal page is loaded in an iframe using jQuery UI dialog widget.  It is an overlay window positioned within the same browser window.
         * When a modal dialog is active, the user is unable to interact with the rest of the page, until the dialog is closed.</p>
         *
         * <p>A non-modal page is loaded in a new window using the {@link apex.navigation.popup|apex.navigation.popup} function.  A user can interact
         * with a non-modal dialog and content on the page.</p>
         *
         * <p class="important">Note: Typically this API call is generated by the server when the page target is a modal page or by using APEX_UTIL.PREPARE_URL.
         * At a minimum the url of the dialog page must be generated on the server so that the correct dialog checksum can be generated.</p>
         * @example
         * <caption>This example demonstrates a call to open a URL in a resizable modal dialog, with a defined height and width.
         * A button with static ID <code class="prettyprint">mybutton_static_id</code> is used to launch the modal dialog. Using an associated Dynamic Action,
         * the click of the button invokes the execution of the following JavaScript code:</caption>
         *
         *     apex.navigation.dialog(
         *         url,
         *         {
         *             title:'Orders',
         *             height:'480',
         *             width:'800',
         *             modal:true,
         *             resizable:true
         *         },
         *         'a-Dialog--uiDialog',
         *         $('#mybutton_static_id') );
         * @param pUrl - The URL of the page to load as a dialog.
         * @param pOptions - Identifies the attributes of the dialog, such as height, width, maxWidth, title, modal.
         * @param [pOptions.title] - The title of the dialog. The default is the name of the page. This option only applies to a modal dialog.
         * @param [pOptions.height] - The height of dialog content area, in pixels. The default is 500. This option only applies to a non-modal dialog.
         * @param [pOptions.width] - The width of window content area, in pixels. The default is 500. This option only applies to a non-modal dialog.
         * @param [pOptions.maxWidth] - The maximum width of window content area, in pixels. The default is 1500.
         * @param [pOptions.modal] - If true (the default), the url will be opened in a modal dialog.  If false, the url will be opened in a non-modal popup.
         * @param [pOptions.*] - Additional options supported by the underlying dialog implementation.
         * For example, to define jQuery UI Dialog attribute <code class="prettyprint">resizable</code>, set to<p>
         * <p> <code class="prettyprint">resizable:true</code></p>
         * See Also : See jQuery UI documentation of Dialog widget for all other available options for a modal dialog. {@link http://api.jqueryui.com/dialog/ }
         * @param pCssClasses - Identifies the CSS classes, if any, to be applied to the dialog, and appended on to the dialogClass attribute.
         * @param pTriggeringElement - jQuery selector to identify the APEX page element opening the dialog.
         * The <code class="prettyprint">apexafterclosedialog</code> or <code class="prettyprint">apexafterclosecanceldialog</code> event is triggered on this page element.
         */
        function dialog(pUrl: string, pOptions: {
            title?: string;
            height?: number;
            width?: number;
            maxWidth?: number;
            modal?: boolean;

        }, pCssClasses: string, pTriggeringElement: string): void;
    }
    /**
     * <p>This namespace is used for all client-side page related functions of Oracle APEX.</p>
     */
    namespace page {
        /**
         * <p>This function submits the page. The shorter alias for this function {@link apex.submit} with the same parameters
         * can also be used. Depending on the value of the page's Reload on Submit attribute, the page is submitted using
         * Ajax or with a normal form submission post request.</p>
         *
         * <p>This function triggers a {@link apex.event:apexbeforepagesubmit} event on the {@link apex.gPageContext$} which can be canceled
         * by an event handler. If canceled, the page is not submitted. Just before the page is submitted, this function
         * triggers a {@link apex.event:apexpagesubmit} event on the {@link apex.gPageContext$}, which cannot be canceled.</p>
         * @example
         * <caption>Submits the current page with a REQUEST value of 'DELETE'.</caption>
         * apex.page.submit( "DELETE" );
         * @example
         * <caption>This example is the same as the previous one but uses the shorter alias.</caption>
         * apex.submit( "DELETE" );
         * @example
         * <caption>This example submits the page with a REQUEST value of 'DELETE' and two page item values are set,
         *   P1_DEPTNO to 10 and P1_EMPNO to 5433 . During submit, a wait icon is displayed as a visual indicator for the user.</caption>
         * apex.page.submit( {
         *     request: "DELETE",
         *     set: {
         *        "P1_DEPTNO": 10,
         *        "P1_EMPNO": 5433
         *     },
         *     showWait: true,
         * } );
         * @example
         * <caption>This example is the same as the previous one but uses the shorter alias.</caption>
         * apex.submit( {
         *     request: "DELETE",
         *     set: {
         *        "P1_DEPTNO": 10,
         *        "P1_EMPNO": 5433
         *     },
         *     showWait: true,
         * } );
         * @example
         * <caption>This example shows how to submit the page when the ENTER key is pressed on a text input.</caption>
         * apex.jQuery("#P1_TEXT").on( "keydown", function( event ) {
         *   apex.page.submit({
         *       submitIfEnter: event
         *   });
         * });
         * @param [pOptions] - If this is a string, it will be used to set the REQUEST value.
         *   If this is null, the page will be submitted with no REQUEST value.
         *   If this is an object, you can define the following properties:
         * @param [pOptions.request] - The REQUEST value. For a submit function the default is null.
         * @param [pOptions.set] - An object containing name/value pairs of items to set on the page prior to submission.
         *   The object properties are page item names and the item value is set to the property value.
         *   The default is to not set any page items.
         * @param [pOptions.showWait] - If true, a 'Wait Indicator' spinner is displayed, which can be useful when
         *   running long page operations. The wait indicator is created using {@link apex.widget.waitPopup}.
         *   The default is false. Note: When the page is submitted with ajax (controlled with
         *   the page attribute Reload on Submit = Only for Success) a progress spinner may still be shown as part of
         *   the ajax request even if showWait is false.
         * @param [pOptions.submitIfEnter] - If you only want to submit when the ENTER key has been pressed,
         *   call apex.page.submit in the keydown or keypress event handler and pass the event object in this parameter.
         * @param [pOptions.reloadOnSubmit] - Override the reload on submit setting of the page.
         *   Set to one of the following: "A" (always) or "S" (success)
         * @param [pOptions.ignoreChange] - If true (the default) and the warnOnUnsavedChanges feature is enabled, no
         *   warning will be given if there are changes. If false and the warnOnUnsavedChanges feature is enabled and there
         *   are changes there will be a warning. If warnOnUnsavedChanges feature is disabled there is never a warning.
         *   Set this to false if the submit will not actually save the data.
         * @param [pOptions.validate] - If true, check the validity of page items and models before submitting the page.
         *   If anything is not valid then show an alert dialog and don't submit the page. The default is false.
         * @returns If the submitIfEnter option is specified, a Boolean value is returned.
         *   If the ENTER key is not pressed, true is returned and if the ENTER key is pressed, false is returned.
         *   If submitIfEnter is not specified, undefined is returned.
         */
        function submit(pOptions?: {
            request?: string;
            set?: any;
            showWait?: boolean;
            submitIfEnter?: Event;
            reloadOnSubmit?: string;
            ignoreChange?: boolean;
            validate?: boolean;
        }): boolean | undefined;
        /**
         * <p>Displays a confirmation dialog showing a message, pMessage, and depending on the user's choice, submits the page or
         * cancels submitting. Depending on the value of the page's Reload on Submit attribute, the page is submitted using
         * Ajax or with a normal form submission post request.</p>
         *
         * <p>Once the user chooses to submit the page, the behavior is the same as for the {@link apex.page.submit} function.
         * The shorter alias for this function {@link apex.confirm} with the same parameters can also be used.</p>
         * @example
         * <caption>Shows a confirmation dialog with the text 'Delete Department'.
         *   If the user chooses to proceed with the delete, the current page
         *   is submitted with a REQUEST value of 'DELETE'.</caption>
         * apex.page.confirm( "Delete Department", 'DELETE' );
         * @example
         * <caption>This example is the same as the previous one but uses the shorter alias.</caption>
         * apex.confirm( "Delete Department", 'DELETE' );
         * @example
         * <caption>This example shows a confirmation message with the 'Save Department?' text.
         *   If the user chooses to proceed with the save, the page is submitted with a REQUEST value of 'SAVE' and 2 page
         *   item values are set, P1_DEPTNO to 10 and P1_EMPNO to 5433.</caption>
         * apex.page.confirm( "Save Department?", {
         *     request: "SAVE",
         *     set: {
         *         "P1_DEPTNO": 10,
         *         "P1_EMPNO": 5433
         *     }
         * } );
         * @example
         * <caption>This example is the same as the previous one but uses the shorter alias.</caption>
         * apex.confirm( "Save Department?", {
         *     request: "SAVE",
         *     set: {
         *         "P1_DEPTNO": 10,
         *         "P1_EMPNO": 5433
         *     }
         * } );
         * @param [pMessage] - The confirmation message to display. The default is
         *   "Would you like to perform this delete action?". It is best to supply your own message because the default
         *   message is not localized.
         *   <p class="important">Note: The default message is deprecated. In the future this argument will be required.</p>
         * @param [pOptions] - If this is a string, it will be used to set the REQUEST value.
         *   If this is null or omitted, the page will be submitted with no REQUEST value.
         *   If this is an object, you can define the following properties:
         * @param [pOptions.request] - The REQUEST value. For the confirm function the default is "Delete".
         * @param [pOptions.set] - An object containing name/value pairs of items to set on the page prior to submission.
         *   The object properties are page item names and the item value is set to the property value.
         *   The default is to not set any page items.
         * @param [pOptions.showWait] - If true, a 'Wait Indicator' spinner is displayed, which can be useful when
         *   running long page operations. The default is false.
         * @param [pOptions.submitIfEnter] - This option is not useful for the confirm function.
         * @param [pOptions.reloadOnSubmit] - Override the reload on submit setting of the page.
         *   Set to one of the following: "A" (always) or "S" (success)
         * @param [pOptions.ignoreChange] - If true (the default) and the warnOnUnsavedChanges feature is enabled, no
         *   warning will be given if there are changes. If false and the warnOnUnsavedChanges feature is enabled and there
         *   are changes, a warning will be given. If warnOnUnsavedChanges feature is disabled, there is never a warning.
         *   Set this to false if the submit will not actually save the data.
         * @param [pOptions.validate] - If true, check the validity of page items and models before submitting the page.
         *   If anything is not valid then show an alert dialog and don't submit the page. The default is false.
         */
        function confirm(pMessage?: string, pOptions?: {
            request?: string;
            set?: any;
            showWait?: boolean;
            submitIfEnter?: Event;
            reloadOnSubmit?: string;
            ignoreChange?: boolean;
            validate?: boolean;
        }): void;
        /**
         * <p>Check if any page items or submittable APEX {@link models} on the page are invalid.
         * Any errors are shown using the {@link apex.message.showErrors} function.</p>
         *
         * <p class="important">Note: This function does not actually perform any validation. Use HTML 5 validation attributes
         * or API to validate items.</p>
         * @example
         * <caption>The following example checks if the page is valid when a button with id checkButton is pressed.</caption>
         * apex.jQuery( "#checkButton" ).click( function() {
         *     if ( !apex.page.validate() ) {
         *         alert("Please correct errors");
         *     }
         * } );
         * @param [pLocation] - Optional location of where to display messages. See {@link apex.message.showErrors}
         *   <code class="prettyprint">location</code> option for details. Default is ["inline", "page"]
         * @returns true if page is valid, otherwise false.
         */
        function validate(pLocation?: string | string[]): boolean;
        /**
         * <p>Return true if any page items or APEX models on this page have changed since last being
         * sent to the server. Items that are disabled or are configured to ignore changes are not included in the check.
         * This will call the <code class="prettyprint">pExtraIsChanged</code> function set in
         * {@link apex.page.warnOnUnsavedChanges} if one was supplied and only if no other changes are found first.</p>
         * <p>Tip: Put the page in debug mode to see debug info messages in the browser console reporting any changed models
         * or the first changed page item found.</p>
         * <p>See also {@link item#isChanged}, {@link apex.model.anyChanges}.</p>
         * @example
         * <caption>The following example checks if the page is changed before performing some action.</caption>
         * if ( apex.page.isChanged() ) {
         *     // do something when the page has changed
         * }
         * @returns true if there are any changes, otherwise false.
         */
        function isChanged(): boolean;
        /**
         * <p>Initialize a handler that checks for unsaved changes anytime the page is about to unload.
         * This is safe to call multiple times. The pMessage and pExtraIsChanged parameters override any previous values.
         * This function is called automatically when the page attribute Warn on Unsaved Changes is set to yes.
         * The main reason to call this manually is to customize the parameters.</p>
         * <p>The actual checking for changes is done by {@link apex.page.isChanged}.</p>
         * @example
         * <caption>The following example enables the 'Warn on unsaved changes' feature with a custom message.</caption>
         * apex.page.warnOnUnsavedChanges( "The employee record has been changed" );
         * @param [pMessage] - Message to display when there are unsaved changes. If the message is not given,
         *   a default message is used. <p class="important">Note: Most browsers do not show this message.</p>
         * @param [pExtraIsChanged] - Optional additional function to be called, checking if there are any unsaved changes.
         *   It should return true if there are unsaved changes, and false otherwise.
         *   It is only called if there are no changes to any models or page items.
         *   This is useful if there are non-standard state-full inputs on the page that are not APEX items
         *   and do not keep their state in an APEX model. It allows writing a custom function to detect
         *   if those non-standard inputs have changed.
         */
        function warnOnUnsavedChanges(pMessage?: string, pExtraIsChanged?: (...params: any[]) => any): void;
        /**
         * <p>Call to remove the handler that checks for unsaved changes. This is useful to do before any kind of cancel
         * operation where the user is intentionally choosing to lose the changes. It is not normally necessary to call
         * this function because the declarative attribute Warn on Unsaved Changes with value Do Not Check will do it
         * automatically. Adding the class <code class="prettyprint">js-ignoreChange</code> to a link (anchor element)
         * or button will cause this function to be called before the link or button action.</p>
         * @example
         * <caption>The following sets up a handler on a custom cancel button, to leave the page without
         *   checking for changes.</caption>
         * apex.jQuery( "#custom-cancel-button" ).click( function() {
         *     apex.page.cancelWarnOnUnsavedChanges();
         *     apex.navigation.redirect( someUrl );
         * } );
         */
        function cancelWarnOnUnsavedChanges(): void;
    }
    /**
     * This function is an alias for {@link apex.page.submit}.
     */
    function submit(): void;
    /**
     * This function is an alias for {@link apex.page.confirm}.
     */
    function confirm(): void;
    /**
     * <p>The apex.pwa namespace contains Oracle APEX functions related to Progressive Web App features.</p>
     * <p>These functions are useful only when an APEX application has enabled Progressive Web App.</p>
     */
    namespace pwa {
        /**
         * <p>Get the current display mode for the PWA.</p>
         * <p>Possible values are: fullscreen, standalone, minimal-ui, browser.</p>
         * <p>The display mode is set by the developer in the application definition.</p>
         * <p>This function is used to determine if the application is currently accessed through the PWA application
         * (eg. in fullscreen) or through the browser normally.</p>
         * @example
         * <caption>Returns the PWA current display mode.
         * Possible values are: fullscreen, standalone, minimal-ui, browser.</caption>
         *
         * const displayMode = apex.pwa.getDisplayMode();
         * @returns Current display mode for the PWA
         */
        function getDisplayMode(): string;
        /**
         * <p>Determines if the current session is eligible for installation of the PWA.</p>
         * <p>This function will detect:</p>
         * <ul>
         * <li>the user's browser install prompt is available.</li>
         * <li>the PWA is already installed on the user's device.</li>
         * <li>the user session is currently in PWA mode.</li>
         * <li>the user is on iOS/iPadOS on Safari.</li>
         * </ul>
         * <p>Given the user's current device and browser, this function will determine if installing the
         * PWA is possible.</p>
         * @example
         * <caption>Returns if the APEX application is installable as a PWA.</caption>
         *
         * const isInstallable = await apex.pwa.isInstallable();
         * @returns A Promise that resolves a boolean, based on installation eligibility
         */
        function isInstallable(): Promise<any>;
        /**
         * @returns A Promise that resolves the PWA dialog installation text
         */
        function getInstallText(): Promise<any>;
        /**
         * <p>For browsers with automatic PWA installation, this function triggers the installation process.</p>
         * <p>For browsers without automatic PWA installation, this function opens a dialog with the instruction
         * text.</p>
         * <p>This function is automatically invoked when clicking on any DOM element with the following class:
         * <code class="prettyprint">.a-pwaInstall</code>.
         * <p>This function is also invoked on <code class="prettyprint">apex.actions</code> with action name
         * <code class="prettyprint">a-pwa-install</code>.
         * <p>For example when creating a new APEX application with PWA enabled, a navigation bar entry is added with the
         * <code class="prettyprint">.a-pwaInstall</code> class and
         * <code class="prettyprint">href="#action$a-pwa-install"</code>.
         * Developers can add custom buttons to their application and use the
         * <code class="prettyprint">.a-pwaInstall</code> class or
         * <code class="prettyprint">href="#action$a-pwa-install"</code>
         * to trigger the PWA installation process.</p>
         * <p>Alternatively, developers can run this function to trigger the PWA installation process
         * programatically for a custom experience.</p>
         * @example
         * <caption>Opens the installation dialog for installing the PWA.</caption>
         *
         * apex.pwa.openInstallDialog();
         */
        function openInstallDialog(): void;
        /**
         * <p>This function returns the current user push subscription object.</p>
         * @example
         * <caption>Returns a PushSubscription object containing details of an existing subscription.</caption>
         *
         * const subscription = await apex.pwa.getPushSubscription();
         * @returns A Promise that resolves to a PushSubscription object containing details of an existing subscription
         */
        function getPushSubscription(): Promise<any>;
        /**
         * <p>This function is used to verify if the current user is subscribed to push notifications.</p>
         * @example
         * <caption>Returns if the current user is subscribed to push notifications.</caption>
         *
         * const hasPushSubscription = await apex.pwa.hasPushSubscription();
         * @returns A Promise that resolves a boolean, based on the if the user is subscribed to push notifications.
         */
        function hasPushSubscription(): Promise<any>;
        /**
         * <p>This function is used to subscribe the current user to push notifications.</p>
         * @example
         * <caption>Subscribe the current user to push notifications.</caption>
         *
         * await apex.pwa.subscribePushNotifications();
         */
        function subscribePushNotifications(): void;
        /**
         * <p>This function is used to unsubscribe the current user to push notifications.</p>
         * @example
         * <caption>Unsubscribe the current user to push notifications.</caption>
         *
         * await apex.pwa.unsubscribePushNotifications();
         */
        function unsubscribePushNotifications(): void;
    }
    /**
     * <p>The apex.region namespace contains global functions related to Oracle APEX regions.
     * The {@link apex.region|apex.region} function provides access to a {@link region} interface for a specific region.</p>
     */
    namespace region {
        /**
         * <p>This function is only used by region plug-in developers. It provides a plug-in specific implementation for the region.</p>
         *
         * <p>Use this function to give a region plug-in a set of behaviors defined by <code class="prettyprint">pRegionImpl</code>.
         * The <code class="prettyprint">pRegionImpl</code> parameter can provide its own implementation for standard
         * methods (such as refresh or focus) or omit them to get the default implementation.
         * It can add its own methods or properties as well.
         * It should include a <code class="prettyprint">type</code> string property that specifies the type of region.</p>
         * <p>If the region is implemented with a jQuery UI style widget (using widget factory) then it should provide an
         * implementation for the {@link region#widget} method and define the {@link region#widgetName} property so that the
         * {@link region#call} method works. Note: jQuery UI is deprecated but the <code class="prettyprint">call</code>
         * method and <code class="prettyprint">widgetName</code> property remain for backward compatibility.</p>
         * @example
         * <caption>The following is region initialization code for a hypothetical region plug-in.
         * It provides implementations for the standard focus and refresh methods and adds a custom method
         * to filter the list.</caption>
         * function initFancyList( pRegionId, ... ) {
         *     ...
         *     apex.region.create( pRegionId, {
         *         type: "FancyList",
         *         focus: function() {
         *             // code to focus region
         *         },
         *         refresh: function() {
         *             // code to refresh region, e.g:
         *             // const result = apex.server.plugin( ... );
         *             // result
         *             //   .done( ... )
         *             //   .fail( ... )
         *             //   .always( ... );
         *             // return result;
         *         },
         *         filter: function() {
         *             // code to filter the list
         *         }
         *     } );
         * }
         *
         * // later the custom function can be used as follows
         * apex.region( regionId ).filter( ... );
         * @example
         * <caption>The following example shows the same hypothetical region plug-in but using
         * the function callback for pRegionImpl.</caption>
         * function initFancyList( pRegionId, ... ) {
         *     ...
         *     apex.region.create( pRegionId, function( baseRegion ) {
         *         baseRegion.type = "FancyList";
         *         baseRegion.focus = function() {
         *             // code to focus region
         *         };
         *         baseRegion.refresh = function() {
         *             // code to refresh region
         *         };
         *         baseRegion.filter = function() {
         *             // code to filter the list
         *         };
         *     } );
         * }
         *
         * // later the custom function can be used as follows
         * apex.region( regionId ).filter( ... );
         * @param pRegionId - Region id or region static id. This comes from the PL/SQL plug-in
         *   parameter <code class="prettyprint">p_region.static_id</code>.
         * @param pRegionImpl - An object that provides the methods and properties for the region interface.
         *   All the properties of this object are copied to the region interface.
         *   It should provide a string <code class="prettyprint">type</code> property.
         *   It can provide any additional methods that would be useful to developers.
         *   A default implementation is provided for any standard methods or properties omitted. See {@link region} for
         *   the properties and methods supported by the interface.
         *   <p>This parameter can also be a function that is called during creation with a single object argument that
         *   is the base region interface. The function should add any needed functions or properties to the region interface.</p>
         */
        function create(pRegionId: string, pRegionImpl: any | ((...params: any[]) => any)): void;
        /**
         * <p>This function is only for region plug-in developers. It will destroy and remove the behaviors associated with a
         * region element. It does not remove the region element from the DOM. It is not necessary to call this function
         * if the region will exist for the lifetime of the page. If the region is implemented by a widget that has a
         * destroy method then this function can be called when the widget is destroyed.</p>
         * @example
         * <caption>The following destroys the region interface but the region element remains on the page.</caption>
         * apex.region.destroy( someRegionId );
         * @param pRegionId - Region id or region static id. It is a best practice to give a region a Static ID
         *   if it is going to be used from JavaScript otherwise an internally generated id is used. The region id is
         *   substituted in the region template using the #REGION_STATIC_ID# string.
         *   The region id can be found by viewing the page source in the browser.
         */
        function destroy(pRegionId: string): void;
        /**
         * <p>This function returns true if and only if there is a DOM element with id equal to pRegionId that has had
         * a {@link region} interface created for it with {@link apex.region.create}.</p>
         *
         * <p>To support older regions that
         * don't implement a region interface (by calling apex.region.create) the default implementation of
         * apex.region will attempt to treat any DOM element with an id as if it were an APEX region.
         * This function allows you to distinguish true APEX regions from arbitrary DOM elements.</p>
         * @example
         * <caption>The following will only focus the region if it is an APEX region.</caption>
         * if ( apex.region.isRegion( someId ) ) {
         *     apex.region( someId ).focus();
         * }
         * @param pRegionId - Region id or region static id. It is a best practice to give a region a Static ID
         *   if it is going to be used from JavaScript otherwise an internally generated id is used. The region id is
         *   substituted in the region template using the #REGION_STATIC_ID# string.
         *   The region id can be found by viewing the page source in the browser.
         * @returns true if there is an element with the given id that supports the region interface.
         */
        function isRegion(pRegionId: string): boolean;
        /**
         * <p>Returns the region that contains the <code class="prettyprint">pTarget</code> element.
         * Returns null if there is no <code class="prettyprint">pTarget</code> element or if it is
         * not in a region that has been initialized with a call to {@link apex.region.create}.</p>
         * @example
         * <caption>The following will refresh the region that contains a button with class <code class="prettyprint">refresh-button</code>
         *     when it is clicked.</caption>
         * apex.jQuery( ".refresh-button" ).click( function( event ) {
         *     var region = apex.region.findClosest( event.target );
         *     if ( region ) {
         *         region.refresh();
         *     }
         * });
         * @param pTarget - A DOM element or CSS selector suitable as the first argument to the jQuery function.
         * @returns A region interface or null if the element corresponding to
         *     <code class="prettyprint">pTarget</code> is not inside a region.
         */
        function findClosest(pTarget: Element | string): region | null;
    }
    /**
     * <p>Return a {@link region} interface for the given region id. The returned region interface object can then be
     * used to access region related functions and properties.</p>
     *
     * <p>Region plug-in developers can define the behavior of their region by calling {@link apex.region.create}.</p>
     *
     * <p>For regions that are created with <code class="prettyprint">apex.region.create</code> (which is most
     * native or plug-in regions that have significant dynamic behavior), the region interface can also be accessed
     * from the {@link apex.regions} collection by <code class="prettyprint">pRegionId</code>.
     * So for a region with id "myRegion" the following are equivalent:<br>
     * <pre>
     * <code class="prettyprint">let myRegion = apex.regions.myRegion;</code>
     * <code class="prettyprint">let myRegion = apex.region( "myRegion" );</code>
     * </pre>
     * </p>
     * @example
     * <caption>This function is not used by itself. See the examples for methods of the {@link region}
     *   interface.</caption>
     * @param pRegionId - Region id or region static id. It is a best practice to give a region a Static ID
     *   if it is going to be used from JavaScript otherwise an internally generated id is used. The region id is
     *   substituted in the region template using the #REGION_STATIC_ID# string.
     *   The region id can be found by viewing the page source in the browser.
     * @returns The region interface or null if there is no element with the given
     * <code class="prettyprint">pRegionId</code>.
     */
    function region(pRegionId: string): region | null;
    /**
     * The apex.server namespace contains all Ajax functions to communicate with the Oracle APEX server.
     */
    namespace server {
        /**
         * <p>This function calls the PL/SQL ajax function that has been defined for a plug-in. This function is a
         * wrapper around the jQuery.ajax function and supports a subset of the jQuery.ajax options plus additional
         * Oracle APEX specific options.</p>
         *
         * <p>The plug-in PL/SQL Ajax function is identified using the value returned by the PL/SQL package
         * apex_plugin.get_ajax_identifier. There are two ways to provide the plug-in Ajax identifier:</p>
         * <ul>
         * <li>Provide the pAjaxIdentifier as the first argument</li>
         * <li>Provide information about the region(s) including the ajaxIdentifier in the
         *   pData object structure. See pData description for details.</li>
         * </ul>
         * @example
         * <caption>This example demonstrates a call to apex.server.plugin, sets the scalar value x01 to test
         *     (which can be accessed from PL/SQL using apex_application.g_x01) and sets the page item's P1_DEPTNO and P1_EMPNO
         *     values in session state (using jQuery selector syntax). The P1_MY_LIST item is used as the element for which
         *     the apexbeforerefresh and apexafterrefresh events are fired. P1_MY_LIST is used as the element for which to
         *     display the loading indicator next to. The success callback is stubbed out and is used for developers to add
         *     their own code that fires when the call successfully returns. The value for lAjaxIdentifier must be set to the
         *     value returned by the server PL/SQL API apex_plugin.get_ajax_identifier.</caption>
         * apex.server.plugin ( lAjaxIdentifier, {
         *     x01: "test",
         *     pageItems: "#P1_DEPTNO,#P1_EMPNO"
         * }, {
         *     refreshObject: "#P1_MY_LIST",
         *     loadingIndicator: "#P1_MY_LIST",
         *     success: function( data ) {
         *         // do something here
         *     }
         * } );
         * @example
         * <caption>See also the examples for {@link apex.server.process} because handling the response
         * is the same for both the callback function and promise cases.</caption>
         * @param [pAjaxIdentifier] - The plug-in Ajax identifier. If not given then pData must include a regions
         *                                   array that includes a region with property ajaxIdentifier.
         * @param [pData] - Object containing data to send to the server in the ajax request.
         *     The object is serialized as JSON and sent to the server in parameter p_json.
         *     Data for specific regions can be sent in the following format:
         * <pre class="prettyprint"><code>{
         *     "regions": [ {
         *        "id": &lt;region-id-or-static-id>,
         *        "ajaxIdentifier": &lt;ajaxIdentifier>,
         *        &lt;any other data specific to the region plug-in>
         *     }, ...]
         * }
         * </code></pre>
         *     <p>The following properties are treated as special:</p>
         * @param [pData.pageItems] - Identifies the page or column items that will be
         *     included in the request. It can be a jQuery selector, jQuery object, Element, or an array of item names.
         *     These items will be made available in session state on the server. If pageItems contains column items then
         *     pOptions should include the target property, so that the region session state context can be determined.
         * @param [pData.xnn] - Represents properties with names x01 to x20. These properties are moved out of the p_json object
         *     and sent as x01 - x20 scalar parameters.
         * @param [pData.fnn] - Represents properties with names f01 to f20. These properties are moved out of the p_json object
         *     and sent as f01 - f20 array parameters.
         * @param [pOptions] - <p>An object that is used to set additional options to control the Ajax call
         *     including before and after processing. See jQuery documentation of jQuery.ajax for these supported
         *     options: accepts, dataType, beforeSend, contents, converters, dataFilter, headers, complete, statusCode, error,
         *     success. The dataType option defaults to json. The async option is deprecated and will be removed in a
         *     future release. See {@link https://docs.jquery.com/}</p>
         *     <p>The following Oracle APEX specific options are supported:</p>
         * @param [pOptions.refreshObject] - A jQuery selector string, jQuery object, or Element
         *     that identifies the DOM element that the {@link apex.event:apexbeforerefresh} and {@link apex.event:apexafterrefresh}
         *     events are triggered on. If this option is not supplied these events are not triggered.
         * @param [pOptions.refreshObjectData] - Only applies if the refreshObject option is given.
         *     Specifies extra data that is passed in the {@link apex.event:apexbeforerefresh}
         *     and {@link apex.event:apexafterrefresh} events so that any handlers
         *     defined for these events can access this data. In Dynamic Actions defined for the Before Refresh or
         *     After Refresh events, this can be accessed from JavaScript using the <code class="prettyprint">this.data</code> property.
         *     For custom jQuery event handlers, this can be accessed through the <code class="prettyprint">pData</code> parameter of the event handler.
         * @param [pOptions.clear] - A no argument function that is called after the
         *     {@link apex.event:apexbeforerefresh} event has fired and before the actual Ajax call is made.
         *     This function can be used to clear the DOM or any other state maintained
         *     by the Element or component for which this Ajax request is being made.
         * @param [pOptions.loadingIndicator] - Identifies the element(s) that will
         *     have a loading indicator (progress spinner) displayed next to it during the Ajax call. The element can be
         *     specified with a jQuery selector, jQuery object or Element. The loadingIndicator can also be a function that
         *     receives the loading indicator as a jQuery object, which it can use as is or modify or replace and attach to the
         *     DOM where appropriate. The function must return a reference to the jQuery loading indicator or return a no
         *     argument function that is called to stop and/or remove the progress indicator. For example:
         *     <pre class="prettyprint"><code>function( pLoadingIndicator ) {
         *     return pLoadingIndicator.prependTo(
         *         apex.jQuery( "td.shuttleControl", gShuttle) );
         * }
         * </code></pre>
         * @param [pOptions.loadingIndicatorPosition] - One of the following six options to define the position of the
         *     loading indicator displayed. Only considered if the value passed to loadingIndicator is not a function.
         *     <ul>
         *     <li>before: Displays before the DOM element(s) defined by loadingIndicator.</li>
         *     <li>after: Displays after the DOM element(s) defined by loadingIndicator.</li>
         *     <li>prepend: Displays inside at the beginning of the DOM element(s) defined by loadingIndicator.</li>
         *     <li>append: Displays inside at the end of the DOM element(s) defined by loadingIndicator.</li>
         *     <li>centered: Displays in the center of the DOM element defined by loadingIndicator.</li>
         *     <li>page: Displays in the center of the page.</li>
         *     </ul>
         * @param [pOptions.queue] - An object specifying the name of a queue and queue action. For example:
         * <pre class="prettyprint"><code>{
         *     name: "updateList",
         *     action: "replace"
         * }
         * </code></pre>
         *     <p>If no queue option is given, the request is made right away without regard to any previous requests.</p>
         *     <p>The name property specifies the name of the queue to add this request to.</p>
         *     <p>The action property can be one of "wait" (the default), "replace", "lazyWrite".</p>
         *     <ul>
         *     <li>wait: This action is the default and is used to send requests one after the other.
         *     When the action is wait, the request is added to the named queue. If there are no other requests in that
         *     queue, in progress or waiting, then this request is executed. Otherwise it waits on the named queue until
         *     the ones before it are complete.</li>
         *     <li>replace: This action is used when this current request makes any previous requests on the named queue,
         *     in progress or waiting, obsolete or invalid. This current request aborts any in progress request and clears
         *     out any waiting requests on the named queue and then is executed.
         *     Waiting requests are rejected with status "superseded".</li>
         *     <li>lazyWrite: This action is used to throttle requests to the server to persist data. This should only be used
         *     to persist non-critical data such as user interface settings or state. Use when the data may change
         *     frequently and only the last data values need to be saved. For example this is useful for persisting
         *     splitter position, or tree expansion and focus state etc. The queue name is unique for each data unit.
         *     For example if you were saving the position of two different splitters use a unique name for each one so that
         *     latest update to one doesn't overwrite a previous lazy write of the other. When using lazyWrite Queue the
         *     refreshObject, clear, loadingIndicator, and loadingIndicatorPosition are most likely not useful because
         *     nothing is being loaded or refreshed.</li>
         *     </ul>
         *     <p>It is possible to mix requests with wait and replace actions on the same queue. The lazyWrite action
         *     should not be used with a queue name that is also used with wait and replace actions.</p>
         * @param [pOptions.target] - The target element (DOM element or jQuery Selector) that this request pertains to.
         *     This is used to get session state context from the enclosing region. This option must be provided if pageItems
         *     property of pData contains any column items.
         * @returns A promise object. The promise <code class="prettyprint">done</code> method is called
         *     if the Ajax request completes successfully. This is called in the same cases and with the same arguments as
         *     the <code class="prettyprint">success</code> callback function in <code class="prettyprint">pOptions</code>.
         *     The promise <code class="prettyprint">fail</code> method is called if the Ajax request completes with an error
         *     including internally detected Oracle APEX errors.
         *     This is called in the same cases and with the same arguments as the <code class="prettyprint">error</code>
         *     callback function in <code class="prettyprint">pOptions</code>.
         *     The promise also has an <code class="prettyprint">always</code> method that is called after
         *     <code class="prettyprint">done</code> and <code class="prettyprint">error</code>. The promise is returned
         *     even when queue options are used. The promise is not a <code class="prettyprint">jqXHR</code> object
         *     but does have an <code class="prettyprint">abort</code> method.
         *     The <code class="prettyprint">abort</code> method does not work for requests that use any queue options.
         *     In addition the promise <code class="prettyprint">fail</code> method can be be called
         *     with <code class="prettyprint">textStatus</code> of "superseded" or "abort" depending on
         *     queuing options. If the {@link apex.event:apexbeforerefresh} event cancels the request
         *     the <code class="prettyprint">textStatus</code> is "cancel".
         *     For an error response from the APEX server the <code class="prettyprint">textStatus</code> is "APEX"
         *     and there may be more info in the <code class="prettyprint">errorThrown</code> argument.
         */
        function plugin(pAjaxIdentifier?: string, pData?: {
            pageItems?: string | jQuery | Element | string[];
            xnn?: string;
            fnn?: string | any[];
        }, pOptions?: {
            refreshObject?: jQuery | Element | string;
            refreshObjectData?: any | any[];
            clear?: (...params: any[]) => any;
            loadingIndicator?: string | jQuery | Element | ((...params: any[]) => any);
            loadingIndicatorPosition?: string;
            queue?: any;
            target?: jQuery | Element;
        }): Promise<any>;
        /**
         * <p>Returns the URL to issue a GET request to the PL/SQL Ajax function which has been defined for a plug-in.</p>
         * @example
         * <caption>This example returns a URL to issue a GET request to the PL/SQL Ajax function which has been
         *     defined for a plug-in, where the URL sets the scalar value x01 to test (which can be accessed from PL/SQL
         *     using apex_application.g_x01) and will also set the page item's P1_DEPTNO and P1_EMPNO values in session
         *     state (using jQuery selector syntax). The value for lAjaxIdentifier must be set to the value returned
         *     by the server PL/SQL API apex_plugin.get_ajax_identifier.</caption>
         *
         * var lUrl = apex.server.pluginUrl ( lAjaxIdentifier, {
         *     x01: "test",
         *     pageItems: "#P1_DEPTNO,#P1_EMPNO"
         * } );
         * @param pAjaxIdentifier - Use the value returned by the PL/SQL package apex_plugin.get_ajax_identifier to identify your plug-in.
         * @param [pData] - Optional object that is used to set additional values which are included into the URL.
         *     The special property, pageItems, which can be of type jQuery selector, jQuery or DOM object or array of item
         *     names, identifies the page items which are included in the URL. You can also set additional parameters that
         *     the apex.show procedure provides (for example you can set the scalar parameters x01 - x10 and the
         *     arrays f01 - f20).
         * @returns The URL to issue a GET request.
         */
        function pluginUrl(pAjaxIdentifier: string, pData?: any): string;
        /**
         * <p>This function returns a URL to issue a GET request to the current page or page specified in pPage.</p>
         * @example
         * <caption>This example gets a URL to issue a GET request to the DELETE function which has been defined
         *     for this page, where the URL sets the scalar value x01 to test (which can be accessed from PL/SQL using
         *     apex_application.g_x01) and will also set the page item's P1_DEPTNO and P1_EMPNO values in session
         *     state (using jQuery selector syntax).</caption>
         * apex.server.url( {
         *     p_request: "DELETE",
         *     x01: "test",
         *     pageItems: "#P1_DEPTNO,#P1_EMPNO"
         * } );
         * @param [pData] - Optional object that is used to set additional values which are included into the URL.
         *     The special property, pageItems, which can be of type jQuery selector, jQuery or DOM object or array of item
         *     names, identifies the page items which are included in the URL. You can also set additional parameters that
         *     the apex.show procedure provides (for example you can set the scalar parameters x01 - x10 and the
         *     arrays f01 - f20).
         * @param [pPage] - The ID of the page to issue a GET request for. The default is the current page.
         * @returns The URL to issue a GET request.
         */
        function url(pData?: any, pPage?: string): string;
        /**
         * <p>This function calls a PL/SQL on-demand (Ajax Callback) process defined on page or application level.
         * This function is a wrapper around the jQuery.ajax function and supports a subset of the jQuery.ajax options
         * plus additional Oracle APEX specific options.</p>
         * @example
         * <caption>This example demonstrates an Ajax call to an on-demand process called MY_PROCESS and sets the
         *     scalar value x01 to test (which can be accessed from PL/SQL using apex_application.g_x01) and sets the page
         *     item's P1_DEPTNO and P1_EMPNO values in session state (using jQuery selector syntax). The success callback is
         *     stubbed out so that developers can add their own code that fires when the call successfully returns.
         *     The <code class="prettyprint">data</code> parameter to the success callback contains the response returned
         *     from on-demand process.</caption>
         * apex.server.process( "MY_PROCESS", {
         *     x01: "test",
         *     pageItems: "#P1_DEPTNO,#P1_EMPNO"
         * }, {
         *     success: function( data )  {
         *         // do something here
         *     },
         *     error: function( jqXHR, textStatus, errorThrown ) {
         *         // handle error
         *     }
         * } );
         * @example
         * <caption>This example is similar to the previous one except that the response is handled using the returned
         * promise and the page items are given as an array.</caption>
         * var result = apex.server.process( "MY_PROCESS", {
         *     x01: "test",
         *     pageItems: ["P1_DEPTNO","P1_EMPNO"]
         * } );
         * result.done( function( data ) {
         *     // do something here
         * } ).fail(function( jqXHR, textStatus, errorThrown ) {
         *     // handle error
         * } ).always( function() {
         *     // code that needs to run for both success and failure cases
         * } );
         * @param pName - The name of the PL/SQL on-demand page or application process to call.
         * @param [pData] - Object containing data to send to the server in the ajax request.
         *     The Object is serialized as JSON and sent to the server in parameter p_json.
         *     Data for specific regions can be sent in the following format:
         * <pre class="prettyprint"><code>{
         *     "regions": [ {
         *        "id": &lt;region-id-or-static-id>,
         *        &lt;any other data specific to the region plug-in>
         *     }, ...]
         * }
         * </code></pre>
         *     <p>The following properties are treated special:</p>
         * @param [pData.pageItems] - Identifies the page or column items that will be
         *     included in the request. It can be a jQuery selector, jQuery object, Element, or array of item names.
         *     These items will be made available in session state on the server. If pageItems contains column items then
         *     pOptions should include the target property so that the region session state context can be determined.
         * @param [pData.xnn] - Represents properties with names x01 to x20. These properties are moved out of the p_json object
         *     and sent as x01 - x20 scalar parameters.
         * @param [pData.fnn] - Represents properties with names f01 to f20. These properties are moved out of the p_json object
         *     and sent as f01 - f20 array parameters.
         * @param [pOptions] - <p>An object that is used to set additional options to control the Ajax call
         *     including before and after processing. See jQuery documentation of jQuery.ajax for these supported
         *     options: accepts, dataType, beforeSend, contents, converters, dataFilter, headers, complete, statusCode, error,
         *     success. The dataType option defaults to json. The async option is deprecated and will be removed in a
         *     future release. See {@link https://docs.jquery.com/}</p>
         *     <p>The following Oracle APEX specific options are supported:</p>
         * @param [pOptions.refreshObject] - A jQuery selector string, jQuery object, or Element
         *     that identifies the DOM element that the {@link apex.event:apexbeforerefresh} and {@link apex.event:apexafterrefresh}
         *     events are triggered on. If this option is not supplied these events are not triggered.
         * @param [pOptions.refreshObjectData] - Only applies if the refreshObject option is given.
         *     Specifies extra data that is passed in the {@link apex.event:apexbeforerefresh}
         *     and {@link apex.event:apexafterrefresh} events so that any handlers
         *     defined for these events can access this data. In Dynamic Actions defined for the Before Refresh or
         *     After Refresh events, this can be accessed from JavaScript using the <code class="prettyprint">this.data</code> property.
         *     For custom jQuery event handlers, this can be accessed through the <code class="prettyprint">pData</code> parameter of the event handler.
         * @param [pOptions.clear] - A no argument function that is called after the
         *     {@link apex.event:apexbeforerefresh} event has fired and before the actual Ajax call is made.
         *     This function can be used to clear the DOM or any other state maintained
         *     by the Element or component for which this Ajax request is being made.
         * @param [pOptions.loadingIndicator] - Identifies the element(s) that will
         *     have a loading indicator (progress spinner) displayed next to it during the Ajax call. The element can be
         *     specified with a jQuery selector, jQuery object or Element. The loadingIndicator can also be a function that
         *     receives the loading indicator as a jQuery object, which it can use as is or modify or replace and attach to the
         *     DOM where appropriate. The function must return a reference to the jQuery loading indicator or return a no
         *     argument function that is called to stop and/or remove the progress indicator. For example:
         *     <pre class="prettyprint"><code>function( pLoadingIndicator ) {
         *     return pLoadingIndicator.prependTo(
         *         apex.jQuery( "td.shuttleControl", gShuttle) );
         * }
         * </code></pre>
         * @param [pOptions.loadingIndicatorPosition] - One of the following six options to define the position of the
         *     loading indicator displayed. Only considered if the value passed to loadingIndicator is not a function.
         *     <ul>
         *     <li>before: Displays before the DOM element(s) defined by loadingIndicator.</li>
         *     <li>after: Displays after the DOM element(s) defined by loadingIndicator.</li>
         *     <li>prepend: Displays inside at the beginning of the DOM element(s) defined by loadingIndicator.</li>
         *     <li>append: Displays inside at the end of the DOM element(s) defined by loadingIndicator.</li>
         *     <li>centered: Displays in the center of the DOM element defined by loadingIndicator.</li>
         *     <li>page: Displays in the center of the page.</li>
         *     </ul>
         * @param [pOptions.queue] - An object specifying the name of a queue and queue action. For example:
         * <pre class="prettyprint"><code>{
         *     name: "updateList",
         *     action: "replace"
         * }
         * </code></pre>
         *     <p>If no queue option is given, the request is made right away without regard to any previous requests.</p>
         *     <p>The name property specifies the name of the queue to add this request to.</p>
         *     <p>The action property can be one of "wait" (the default), "replace", "lazyWrite".</p>
         *     <ul>
         *     <li>wait: This action is the default and is used to send requests one after the other.
         *     When the action is wait, the request is added to the named queue. If there are no other requests in that
         *     queue in progress or waiting, then this request is executed. Otherwise it waits on the named queue until
         *     the ones before it are complete.</li>
         *     <li>replace: This action is used when this current request makes any previous requests on the named queue
         *     in progress or waiting obsolete or invalid. This current request aborts any in progress request and clears
         *     out any waiting requests on the named queue and then is executed.
         *     Waiting requests are rejected with status "superseded".</li>
         *     <li>lazyWrite: This action is used to throttle requests to the server to persist data. This should only be used
         *     to persist non-critical data such as user interface settings or state. Use when the data may change
         *     frequently and only the last data values need to be saved. For example this is useful for persisting
         *     splitter position, or tree expansion and focus state etc. The queue name is unique for each data unit.
         *     For example if you were saving the position of two different splitters use a unique name for each one so that
         *     latest update to one doesn't overwrite a previous lazy write of the other. When using lazyWrite Queue the
         *     refreshObject, clear, loadingIndicator, and loadingIndicatorPosition are most likely not useful because
         *     nothing is being loaded or refreshed.</li>
         *     </ul>
         *     <p>It is possible to mix requests with wait and replace actions on the same queue. The lazyWrite action
         *     should not be used with a queue name that is also used with wait and replace actions.</p>
         * @param [pOptions.target] - The target element (DOM element or jQuery Selector) that this request pertains to.
         *     This is used to get session state context from the enclosing region. This option must be provided if pageItems
         *     property of pData contains any column items.
         * @returns A promise object. The promise <code class="prettyprint">done</code> method is called
         *     if the Ajax request completes successfully. This is called in the same cases and with the same arguments as
         *     the <code class="prettyprint">success</code> callback function in <code class="prettyprint">pOptions</code>.
         *     The promise <code class="prettyprint">fail</code> method is called if the Ajax request completes with an error
         *     including internally detected Oracle APEX errors.
         *     This is called in the same cases and with the same arguments as the <code class="prettyprint">error</code>
         *     callback function in <code class="prettyprint">pOptions</code>.
         *     The promise also has an <code class="prettyprint">always</code> method that is called after
         *     <code class="prettyprint">done</code> and <code class="prettyprint">error</code>. The promise is returned
         *     even when queue options are used. The promise is not a <code class="prettyprint">jqXHR</code> object
         *     but does have an <code class="prettyprint">abort</code> method.
         *     The <code class="prettyprint">abort</code> method does not work for requests that use any queue options.
         *     In addition the promise <code class="prettyprint">fail</code> method can be be called
         *     with <code class="prettyprint">textStatus</code> of "superseded" or "abort" depending on
         *     queuing options. If the {@link apex.event:apexbeforerefresh} event cancels the request
         *     the <code class="prettyprint">textStatus</code> is "cancel".
         *     For an error response from the APEX server the <code class="prettyprint">textStatus</code> is "APEX"
         *     and there may be more info in the <code class="prettyprint">errorThrown</code> argument.
         */
        function process(pName: string, pData?: {
            pageItems?: string | jQuery | Element | string[];
            xnn?: string;
            fnn?: string | any[];
        }, pOptions?: {
            refreshObject?: jQuery | Element | string;
            refreshObjectData?: any | any[];
            clear?: (...params: any[]) => any;
            loadingIndicator?: string | jQuery | Element | ((...params: any[]) => any);
            loadingIndicatorPosition?: string;
            queue?: any;
            target?: jQuery | Element;
        }): Promise<any>;
        /**
         * Given a text string, break it up in to an array of strings no greater than 8000 chars each if needed.
         * If the original text is less than 8000 chars, return it.
         * @example
         * <caption>This example gets around the 32k size limit by sending text from text area item P1_TEXTAREA as
         * the F01 array. A server process needs to loop over the apex_application.g_f01 array.</caption>
         * apex.gPageContext$.on( "apexpagesubmit", function() {
         *     var $ = apex.jQuery,
         *         form$ = $( "#wwvFlowForm" ),
         *         f1 = apex.server.chunk( $v( "P1_TEXT" ) );
         *
         *     if ( !Array.isArray( f1 ) ) {
         *         f1 = [f1];
         *     }
         *     f1.forEach( function( v ) {
         *         form$.append( "<input type='hidden' name='f01' value='" + v + "'>" );
         *     });
         *     $s( "P1_TEXT", " " );
         * } );
         * @param Text - string to split into an array of chunks no bigger than 8000 chars.
         * @returns The input text string, if less than 8000 chars, or an array of the split up input text.
         */
        function chunk(Text: string): string | string[];
        /**
         * <p>Load JavaScript files asynchronously using RequireJS require or jQuery getScript.
         * It is rare that an APEX app needs to dynamically load JavaScript but if it does it should use this rather than
         * getScript.
         * The reason is that RequreJS may or may not be on a page. If it is and libraries that are RequireJS aware are loaded
         * they will give an error because they expect to be loaded by a call to require. If RequireJS is not on the page then
         * require cannot be used.</p>
         * @example
         * <caption>The following example loads a regular library that does not need RequireJS.</caption>
         * apex.server.loadScript( {
         *    path: "./library_1.js"
         * }, function() {
         *    console.log( "library_1 is ready." );
         * } );
         * @example
         * <caption>The following example loads a library that requires RequireJS and creates its own
         *     namespace "myModule".</caption>
         * apex.server.loadScript( {
         *    path: "./library_2.js",
         *    requirejs: true,
         *    global: "myModule"
         * }, function() {
         *    console.log( "library 2 loaded ", myModule );
         * } );
         * @example
         * <caption>The following example loads a concatenated libraries file generated by RequireJS Optimizer,
         *     assuming requireJS is already on the page.</caption>
         * apex.server.loadScript( {
         *    path: "./library_all.js",
         *    requirejs: true
         * }, function() {
         *    console.log( myModule_1, myModule_2 ... );
         * } );
         * @param pOptions - An object that contains the following attributes:
         * @param pOptions.path - The location of the JavaScript file to load.
         * @param [pOptions.requirejs] - Whether to use RequireJS to load this file. The default is false.
         * @param [pOptions.global] - The global name introduced by this file. The existing
         *     one is overwritten. Leave this option empty if the file is generated by RequireJS optimizer.
         * @param [callback] - A no argument function to be executed once script is loaded.
         * @returns If getScript is used then the return value is a jqXHR style promise. Otherwise there is no return value.
         */
        function loadScript(pOptions: {
            path: string;
            requirejs?: boolean;
            global?: string;
        }, callback?: (...params: any[]) => any): any;
    }
    /**
     * <p>The {@link apex}.storage namespace contains all functions related browser storage features such as cookies and session storage.</p>
     *
     * <div class="hw">
     *     <h3 class="name" id="about-section">
     *         About local and session storage
     *         <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark About local and session storage" href="#about-section"></a>
     *     </h3>
     * </div>
     * <p>Local storage and session storage, collectively known as web storage, are a browser feature that securely stores key value pairs
     * associated with an origin (website). The keys and values are strings. The amount of storage space for web storage is greater than
     * that of cookies but it is not unlimited. Another advantage over cookies is that the key value pars are not transmitted with each request.</p>
     *
     * <p>Both local storage and session storage use the same API to set, get, and remove name value pairs. The difference is that
     * session storage goes away when the browser session ends and local storage is available even when the browser restarts.
     * Keep in mind that the browser is free to limit or delete data stored in local storage at the user's request. Unlike data
     * stored on the server local storage is not shared between browsers on different machines or even different browsers on the same machine.</p>
     *
     * <p>Because APEX supports multiple applications, multiple workspaces and even instances of the same application running in multiple
     * workspaces there can arise conflicts with using web storage because all the apps from a single APEX instance (which is a single
     * origin or website) share the same web storage space. The {@link apex.storage.getScopedLocalStorage} and {@link apex.storage.getScopedSessionStorage}
     * solve this problem by partitioning the storage into a scope based on application id an optionally additional information such as
     * page id and region id. The scope is crated by using a prefix on all the storage keys. This avoids conflicts when different apps or
     * different instances of the same app use the same keys but it is not a secure partition. Consider this carefully before storing
     * sensitive information in web storage.</p>
     */
    namespace storage {
        /**
         * <p>Returns the value of the specified cookie.</p>
         * @example
         * <caption>Returns the value of the cookie TEST</caption>
         *
         * var value = apex.storage.getCookie( "TEST" );
         * @param pName - The name of the cookie.
         * @returns The string value of the cookie.
         */
        function getCookie(pName: string): string;
        /**
         * <p>Sets a cookie to the specified value.</p>
         * @example
         * <caption>Sets the value APEX for the cookie TEST</caption>
         *
         * apex.storage.setCookie( "TEST", "APEX" );
         * @param pName - The name of the cookie.
         * @param pValue - The value to set the cookie to.
         */
        function setCookie(pName: string, pValue: string): void;
        /**
         * <p>Returns <code class="prettyprint">true</code> if the browser supports the local storage API and <code class="prettyprint">false</code> otherwise. Most modern browsers support this feature but some allow the user to turn it off.</p>
         * @example
         * <caption>Sets the local storage <code class="prettyprint">"setting1"</code> to on if local storage is supported by the browser.</caption>
         *
         * var myStorage;
         * if ( apex.storage.hasLocalStorageSupport() ) {
         *   myStorage = apex.storage.getScopedLocalStorage({ prefix: "Acme" });
         *   myStorage.setItem( "setting1", "on" );
         * }
         * @returns <code class="prettyprint">true</code> if the browser supports the local storage API and <code class="prettyprint">false</code> otherwise.
         */
        function hasLocalStorageSupport(): boolean;
        /**
         * <p>Returns <code class="prettyprint">true</code> if the browser supports the session storage API and <code class="prettyprint">false</code> otherwise. Most modern browsers support this feature but some allow the user to turn it off.</p>
         * @example
         * <caption>Sets the session storage <code class="prettyprint">"setting1"</code> to on if session storage is supported by the browser.</caption>
         *
         * var myStorage;
         * if ( apex.storage.hasSessionStorageSupport() ) {
         *   myStorage = apex.storage.getScopedSessionStorage({ prefix: "Acme" });
         *   myStorage.setItem( "setting1", "on" );
         * }
         * @returns <code class="prettyprint">true</code> if the browser supports the session storage API and <code class="prettyprint">false</code> otherwise.
         */
        function hasSessionStorageSupport(): boolean;
        /**
         * <p>A storage wrapper object. This object has the same properties and functions as the native browser Storage interface.</p>
         * @property prefix - APEX specific property. The prefix for this scoped storage object.
         * @property length - The number of items in the scoped storage object.
         * @property key - The <code class="prettyprint">key( n )</code> function returns the nth key in the scoped storage object.
         * @property getItem - The <code class="prettyprint">getItem( key )</code> function returns the value for the given key.
         * @property setItem - The <code class="prettyprint">setItem( key, data )</code> function sets the value of the given key to data.
         * @property removeItem - The <code class="prettyprint">removeItem( key )</code> function removes the given key.
         * @property clear - The <code class="prettyprint">clear</code> function removes all keys from the scoped storage object.
         * @property sync - The APEX specific <code class="prettyprint">sync</code> function.
         *   Use to ensure the length property is correct if keys may have been added or removed by means external to this object.
         */
        type storageWrapper = {
            prefix: string;
            length: number;
            key: (...params: any[]) => any;
            getItem: (...params: any[]) => any;
            setItem: (...params: any[]) => any;
            removeItem: (...params: any[]) => any;
            clear: (...params: any[]) => any;
            sync: (...params: any[]) => any;
        };
        /**
         * <p>Returns a thin wrapper around the <code class="prettyprint">sessionStorage</code> object that scopes all keys
         * to a prefix defined by the <code class="prettyprint">options</code> parameter.
         * If sessionStorage is not supported, the returned object can be used but has no effect,
         * so it is not necessary to test for support using {@link apex.storage.hasSessionStorageSupport}
         * before calling this function.</p>
         * @example
         * <caption>Creates a session storage object that scopes all the keys using a prefix
         * <code class="prettyprint">"Acme"</code> and the application id.
         * It then sets and gets an item called <code class="prettyprint">"setting1"</code>.</caption>
         *
         * var myStorage,
         *     setting1;
         * if ( apex.storage.hasSessionStorageSupport() ) {
         *   myStorage = apex.storage.getScopedSessionStorage({ prefix: "Acme" });
         *   myStorage.setItem( "setting1", "on" );
         *   setting1 = myStorage.getItem( "setting1" );
         * }
         * @param options - An object used to define the scope of the session storage.
         *   This defines the storage key prefix used by the <code class="prettyprint">sessionStorage</code> wrapper object.
         * @param [options.prefix] - A static prefix string to add to all keys. The default is an empty string.
         * @param [options.useAppId] - Whether the application id will be included in the key. The default is true.
         * @param [options.usePageId] - Whether the application page id will be included in the key.
         *   The default is false.
         * @param [options.regionId] - An additional string to identify a region or other part of a page.
         *   The default is an empty string.
         * @returns A {@link apex.storage.storageWrapper|sessionStorage} wrapper object.
         */
        function getScopedSessionStorage(options: {
            prefix?: string;
            useAppId?: boolean;
            usePageId?: boolean;
            regionId?: string;
        }): storageWrapper;
        /**
         * <p>Returns a thin wrapper around the <code class="prettyprint">localStorage</code> object that scopes all keys
         * to a prefix defined by the <code class="prettyprint">options</code> parameter.
         * If localStorage is not supported, the returned object can be used but has no effect,
         * so it is not necessary to test for support using {@link apex.storage.hasLocalStorageSupport}
         * before calling this function.</p>
         * @example
         * <caption>Creates a local storage object that scopes all the keys using a prefix
         * <code class="prettyprint">"Acme"</code> and the application id.
         * It then sets and gets an item called <code class="prettyprint">"setting1"</code>.</caption>
         *
         * var myStorage,
         *     setting1;
         * if ( apex.storage.hasLocalStorageSupport() ) {
         *   myStorage = apex.storage.getScopedLocalStorage({ prefix: "Acme" });
         *   myStorage.setItem( "setting1", "on" );
         *   setting1 = myStorage.getItem( "setting1" );
         * }
         * @param options - An object used to define the scope of the local storage.
         *   This defines the storage key prefix used by the <code class="prettyprint">localStorage</code> wrapper object.
         * @param [options.prefix] - A static prefix string to add to all keys. The default is an empty string.
         * @param [options.useAppId] - Whether the application id will be included in the key. The default is true.
         * @param [options.usePageId] - Whether the application page id will be included in the key.
         *   The default is false.
         * @param [options.regionId] - An additional string to identify a region or other part of a page.
         *   The default is an empty string.
         * @returns A {@link apex.storage.storageWrapper|localStorage} wrapper object.
         */
        function getScopedLocalStorage(options: {
            prefix?: string;
            useAppId?: boolean;
            usePageId?: boolean;
            regionId?: string;
        }): storageWrapper;
    }
    /**
     * The apex.theme namespace contains functions useful for theme developers or that work closely with theme
     * related functionality. The functionality in this namespace may not be fully supported by all themes particularly
     * legacy, custom, or third party themes.
     */
    namespace theme {
        /**
         * <p>Display a standard item help dialog. This function may be useful for theme developers.
         * Theme requirements for the label Help Template:</p>
         * <ul>
         * <li>A click handler or javascript <code class="prettyprint">href</code> can invoke this function directly. For example:
         *     <code class="prettyprint"><pre>
         *         &lt;button ... onclick="apex.theme.popupFieldHelp('#CURRENT_ITEM_ID#','&SESSION.');" ...>Help&lt;/button></pre></code>
         * </li>
         * <li>The preferred way is to use the built-in delegated click event handler. For this give the
         *   clickable help element a class of <code class="prettyprint">js-itemHelp</code> and add a
         *   <code class="prettyprint">data-itemhelp</code> attribute with the current item id.
         *   For example:
         *   <code class="prettyprint"><pre>
         *     &lt;button class="... js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" ...>Help&lt;/button></pre></code>
         * </li>
         * </ul>
         *
         * <p>The second method is preferred because you get Alt-F1 keyboard accessibility. For Alt+F1 to work the
         * label template Before Label and Item template attribute must include:
         *     <code class="prettyprint"><pre>
         *         id="#CURRENT_ITEM_CONTAINER_ID#"</pre></code>
         * With the first method you could add your own inline keydown handler.</p>
         * @example
         * <caption>The following example shows how a custom help message that looks like standard page item help
         * can be displayed.</caption>
         * apex.theme.popupFieldHelp( {title: "Custom Help", helpText: "Some helpful text"} );
         * @param pItemId - item id to display help for or an object with properties <code class="prettyprint">helpText</code>,
         *     and <code class="prettyprint">title</code>. When an object is given the other parameters are ignored.
         * @param [pSessionId] - Current session id
         * @param [pUrl] - Override to specify the URL to use to fetch the help content. It should not include
         *          the <code class="prettyprint">p_output_format</code> param. This is an advanced parameter that is normally not needed.
         */
        function popupFieldHelp(pItemId: string | any, pSessionId?: string, pUrl?: string): void;
        /**
         * <p>Open a region that supports being opened such as an inline dialog, inline popup, or collapsible region.
         * For a region to support this function, it must be implemented with a jQuery UI widget
         * that supports either open and close methods or expand and collapse methods.</p>
         * @example
         * <caption>The following example opens an inline dialog region with static id <code class="prettyprint">myDialog</code>.</caption>
         * apex.theme.openRegion( "myDialog" );
         * @param pRegion - The region to open. Either the region static id string or a jQuery object.
         * @returns The jQuery object of the region.
         */
        function openRegion(pRegion: string | jQuery): jQuery;
        /**
         * <p>Close a region that supports being opened such as an inline dialog, inline popup, or collapsible region.
         * For a region to support this function, it must be implemented with a jQuery UI widget
         * that supports either open and close methods or expand and collapse methods.</p>
         * @example
         * <caption>The following example closes an inline dialog region with static id <code class="prettyprint">myDialog</code>.</caption>
         * apex.theme.closeRegion( "myDialog" );
         * @param pRegion - The region to close. Either the region static id string or a jQuery object.
         * @returns The jQuery object of the region.
         */
        function closeRegion(pRegion: string | jQuery): jQuery;
        /**
         * <p>Test a media query. Return true if the document matches the given media query string and false otherwise.
         * This is a wrapper around <code>window.matchMedia</code>.</p>
         * @example
         * <caption>After each time the window is resized check and log a message if the viewport is at least 640 pixels wide.</caption>
         * apex.jQuery( window ).on( "apexwindowresized", function() {
         *     if ( apex.theme.mq( "(min-width: 640px)" ) ) {
         *         console.log( "Window resized, and viewport is at least 640px wide" );
         *     }
         * } );
         * @param pMediaQuery - The media query to test. For example: <code>(min-width: 400px)</code>
         * @returns true if the media query matches.
         */
        function mq(pMediaQuery: string): boolean;
    }
    /**
     * <p>The apex.util namespace contains general utility functions of Oracle APEX.</p>
     */
    namespace util {
        /**
         * <p>Returns a new function that calls <code class="prettyprint">pFunction</code> but not until
         * <code class="prettyprint">pDelay</code> milliseconds after the last time the returned function is
         * called when <code class="prettyprint">pImmediate</code> is false.
         * If <code class="prettyprint">pImmediate</code> is true then <code class="prettyprint">pFunction</code>
         * will be called first and will not be called again until <code class="prettyprint">pDelay</code> milliseconds
         * after the last time the returned function is called.</p>
         * @example
         * <caption>This example calls the function formatValue in response to the user typing characters but only
         * after the user pauses typing. In a case like this formatValue would also be called from the blur event on the same item.</caption>
         * function formatValue() {
         *     var value = $v( "P1_PHONE_NUMBER" );
         *     // code to format value as a phone number
         *     $s( "P1_PHONE_NUMBER_DISPLAY", value );
         * }
         * apex.jQuery( "#P1_PHONE_NUMBER" ).on( "keypress", apex.util.debounce( formatValue, 100 ) );
         * @param pFunction - The function to call.
         * @param pDelay - The time to wait before or after calling the function in milliseconds.
         * @param [pImmediate] - The boolean that determines whether to call the function before or after the delay. Defaults to false.
         * @returns The debounced version of <code class="prettyprint">pFunction</code>.
         */
        function debounce(pFunction: (...params: any[]) => any, pDelay: number, pImmediate?: boolean): (...params: any[]) => any;
        /**
         * <p>Returns a new function that calls <code class="prettyprint">pFunction</code> then waits
         * <code class="prettyprint">pWait</code> milliseconds from the initial function call before
         * executing again when <code class="prettyprint">pImmediate</code> is true.</p>
         * If <code class="prettyprint">pImmediate</code> is false then the call to <code class="prettyprint">pFunction</code>
         * will not happen until <code class="prettyprint">pWait</code> milliseconds after the initial
         * function call.
         * Functions are executed at timed intervals, so if the throttle action is fired during
         * <code class="prettyprint">pWait</code>, the most recent call is stored and called after
         * <code class="prettyprint">pWait</code> is done. This is different from {@link apex.util.debounce},
         * which only calls a function once at the end of a single or series of events.
         * @example
         * <caption>This example calls the function updatePosition in response to the user scrolling but only
         * calls the function once every 2 seconds if the scroll event is fired multiple times.</caption>
         * function updatePosition() {
         *     // code to calculate page position
         *     $s( "P1_PAGE_POSITION", position );
         * }
         * $( document ).on( "scroll", apex.util.throttle( updatePosition, 1000, true ) );
         * @param pFunction - The function to call.
         * @param pWait - The time to wait before or after calling the function in milliseconds.
         * @param [pImmediate] - The boolean that determines whether to call the function before or after the delay. Defaults to true.
         * @returns The throttled version of <code class="prettyprint">pFunction</code>.
         */
        function throttle(pFunction: (...params: any[]) => any, pWait: number, pImmediate?: boolean): (...params: any[]) => any;
        /**
         * <p>Function that returns an array based on the value passed in <code class="prettyprint">pValue</code>.</p>
         * @example
         * <caption>This example splits the string into an array with 3 items:
         * <code class="prettyprint">["Bags","Shoes","Shirts"]</code>.</caption>
         * lProducts = apex.util.toArray( "Bags:Shoes:Shirts" );
         * @example
         * <caption>This example splits the string into an array just like in the previous example. The only
         * difference is the separator character is ",".</caption>
         * lProducts = apex.util.toArray( "Bags,Shoes,Shirts", "," );
         * @example
         * <caption>This example splits the string into an array just like in the previous example. The only
         * difference is that storage type "json-array" is used.</caption>
         * lAnimals = apex.util.toArray( "[\"Dog\",\"Capybara\"]", { type: "json-array" } );
         * @example
         * <caption>This example splits the string into an array just like in the previous example. The only
         * difference is that the separator character is "~" and pSeparator is an object.</caption>
         * lAnimals = apex.util.toArray( "Dog~Capybara", { type: "separated", separator: "~" } );
         * @example
         * <caption>This example returns the jQuery object as an array.</caption>
         * lTextFields = apex.util.toArray( jQuery( "input[type=text]" ) );
         * @example
         * <caption>This example splits a string value into an array. The difference is
         * the {@link item#getMultiValueStorage} function is used to get the separator from an item.</caption>
         * lP1Item = apex.item( "P1_ITEM" ); // assume this item is configured with "~" for the separator
         * lAnimals = apex.util.toArray( "Dog~Capybara", lP1Item.getMultiValueStorage() );
         * @example
         * <caption>This example splits a comma separated string value into an array allowing extra space
         * characters after each comma.</caption>
         * lAnimals = apex.util.toArray( "Dog, Cat,Capybara", new RegExp( ", *", "g" ) );
         * @param pValue - If this is a string, then the string will be split into an array using the
         *                          <code class="prettyprint">pSeparator</code> parameter.
         *                          If it's not a string, then we try to convert the value with
         *                          <code class="prettyprint">apex.jQuery.makeArray</code> to an array.
         *                          If pValue is null, undefined or an empty string, then we return an empty array.
         *                          When pValue is an array then we return it.
         * @param [pSeparator = ":"] - Separator used to split a string passed in <code class="prettyprint">pValue</code>,
         *   defaults to colon if not specified. Only needed when <code class="prettyprint">pValue</code> is a string.
         *   When passing an object then this must include the following properties:
         *   <ul>
         *      <li>type {string}: The type or format of the <code class="prettyprint">pValue</code> string.
         *      One of "separated" or "json-array"</li>
         *      <li>separator {string} (optional): when <code class="prettyprint">type</code> is "separated"
         *      then this separator is used to split the passed in string. It is ignored otherwise.</li>
         *   </ul>
         *   You can also use {@link item#getMultiValueStorage}, because it returns this object.
         *
         *   This can also be a regular expression suitable for the <code class="prettyprint">String split</code> function.
         */
        function toArray(pValue: string | any, pSeparator?: string | any | RegExp): any[];
        /**
         * <p>Compare two arrays and return true if they have the same number of elements and
         * each element of the arrays is strictly equal to each other. Returns false otherwise.
         * This is a shallow comparison.</p>
         * @example
         * <caption>This example returns true.</caption>
         * apex.util.arrayEqual( [1,"two",3], [1, "two", 3] );
         * @example
         * <caption>This example returns false.</caption>
         * apex.util.arrayEqual( [1,"two",3], [1, "two", "3"] );
         * @param pArray1 - The first array.
         * @param pArray2 - The second array.
         * @returns true if a shallow comparison of the array items are equal
         */
        function arrayEqual(pArray1: any[], pArray2: any[]): boolean;
        /**
         * <p>Returns string <code class="prettyprint">pValue</code> with any special HTML characters in element content
         * context escaped to prevent cross site scripting (XSS) attacks. It escapes the characters: ampersand,
         * double quote, quote, less than, greater than, and forward slash.
         * It provides the same functionality as <code class="prettyprint">APEX_ESCAPE.HTML</code> (in extended mode) in PL/SQL.</p>
         *
         * <p>This function should always be used when inserting untrusted data into the DOM in element content context.</p>
         * @example
         * <caption>This example appends text to a DOM element where the text comes from a page item called
         *     P1_UNTRUSTED_NAME. Data entered by the user cannot be trusted to not contain malicious markup.</caption>
         * apex.jQuery( "#show_user" ).append( apex.util.escapeHTML( $v("P1_UNTRUSTED_NAME") ) );
         * @param pValue - The string that may contain special HTML characters to be escaped. Null is converted to empty string.
         * @returns The escaped string.
         */
        function escapeHTML(pValue: string): string;
        /**
         * <p>Returns string <code class="prettyprint">pValue</code> with any special HTML characters in attribute value
         * context escaped to prevent cross site scripting (XSS) attacks. It hex escapes everything that is not
         * alphanumeric or one of the following characters: comma, period, dash, underscore.
         * It provides the same functionality as <code class="prettyprint">APEX_ESCAPE.HTML_ATTRIBUTE</code> in PL/SQL.</p>
         *
         * <p>This function should always be used when inserting untrusted data into the DOM in attribute value context.</p>
         * @example
         * <caption>This example sets the title of a DOM element where the text comes from a page item called
         *     P1_UNTRUSTED_NAME. Data entered by the user cannot be trusted to not contain malicious markup.</caption>
         * apex.jQuery( "#show_user" ).attr( "title", apex.util.escapeHTMLAttr( $v("P1_UNTRUSTED_NAME") ) );
         * @param pValue - The string that may contain special HTML characters to be escaped.
         * @returns The escaped string.
         */
        function escapeHTMLAttr(pValue: string): string;
        /**
         * <p>Returns string <code class="prettyprint">pValue</code> with any CSS meta-characters escaped.
         * Use this function when the value is used in a CSS selector.
         * Whenever possible if a value is going to be used as a selector, constrain the value so
         * that it cannot contain CSS meta-characters making it unnecessary to use this function.</p>
         * @example
         * <caption>This example escapes an element id that contains a (.) period character so that it finds the
         *     element with id = "my.id". Without using this function the selector would have a completely
         *     different meaning.</caption>
         * apex.jQuery( "#" + apex.util.escapeCSS( "my.id" ) );
         * @param pValue - The string that may contain CSS meta-characters to be escaped.
         * @returns The escaped string, or an empty string if pValue is null or undefined.
         */
        function escapeCSS(pValue: string): string;
        /**
         * <p>Return an {@link htmlBuilder} interface.</p>
         */
        function htmlBuilder(): htmlBuilder;
        /**
         * <p>Function that renders a spinning alert to show the user that processing is taking place. Note that the alert is
         * defined as an ARIA alert so that assistive technologies such as screen readers are alerted to the processing status.</p>
         * <p>The spinner can be used with {@link apex.util.delayLinger} for better control over if, when, and for how long
         * it is shown.</p>
         * @example
         * <caption>To show the spinner when processing starts.</caption>
         * var lSpinner$ = apex.util.showSpinner( $( "#container_id" ) );
         * @example
         * <caption>To remove the spinner when processing ends.</caption>
         * lSpinner$.remove();
         * @param [pContainer] - Optional jQuery selector, jQuery, or DOM element identifying the
         *     container within which you want to center the spinner. If not passed, the spinner will be centered on
         *     the whole page. The default is $("body").
         * @param [pOptions] - Optional object with the following properties:
         * @param [pOptions.alert] - Alert text visually hidden, but available to Assistive Technologies.
         *     Defaults to "Processing".
         * @param [pOptions.spinnerClass] - Adds a custom class to the outer SPAN for custom styling.
         * @param [pOptions.fixed] - If true the spinner will be fixed and will not scroll. When fixed is true
         *     the pContainer parameter is ignored and the spinner is always appended to the body.
         * @returns A jQuery object for the spinner. Use the jQuery remove method when processing is complete.
         */
        function showSpinner(pContainer?: string | jQuery | Element, pOptions?: {
            alert?: string;
            spinnerClass?: string;
            fixed?: boolean;
        }): jQuery;
        /**
         * <p>The delayLinger namespace solves the problem of flashing progress indicators (such as spinners).</p>
         *
         * <p>For processes such as an Ajax request (and subsequent user interface updates) that may take a while
         * it is important to let the user know that something is happening.
         * The problem is that if an async process is quick there is no need for a progress indicator. The user
         * experiences the UI update as instantaneous. Showing and hiding a progress indicator around an async
         * process that lasts a very short time causes a flash of content that the user may not have time to fully perceive.
         * At best this can be a distraction and at worse the user wonders if something is wrong or if they missed something
         * important. Simply delaying the progress indicator doesn't solve the problem because the process
         * could finish a short time after the indicator is shown. The indicator must be shown for at least a short but
         * perceivable amount of time even if the request is already finished.</p>
         *
         * <p>You can use this namespace to help manage the duration of a progress indication such as
         * {@link apex.util.showSpinner} or with any other progress implementation. Many of the Oracle
         * APEX asynchronous functions such as the ones in the {@link apex.server} namespace
         * already use delayLinger internally so you only need this API for your own custom long-running
         * asynchronous processing.</p>
         * @example
         * <caption>This example shows using {@link apex.util.delayLinger.start} and
         *     {@link apex.util.delayLinger.finish} along with {@link apex.util.showSpinner} to show a
         *     progress spinner, only when needed and for long enough to be seen, around a long-running asynchronous process
         *     started in function doLongProcess.</caption>
         * var lSpinner$, lPromise;
         * lPromise = doLongProcess();
         * apex.util.delayLinger.start( "main", function() {
         *     lSpinner$ = apex.util.showSpinner( $( "#container_id" ) );
         * } );
         * lPromise.always( function() {
         *     apex.util.delayLinger.finish( "main", function() {
         *         lSpinner$.remove();
         *     } );
         * } );
         */
        namespace delayLinger {
            /**
             * <p>Call this function when a potentially long-running async process starts. For each call to start with
             * a given <code class="prettyprint">pScopeName</code>, a corresponding call to finish
             * with the same <code class="prettyprint">pScopeName</code> must be made.
             * Calls with different <code class="prettyprint">pScopeName</code> arguments will not interfere with each other.</p>
             *
             * <p>Multiple calls to start for the same <code class="prettyprint">pScopeName</code> before any calls to
             * finish is allowed but only the <code class="prettyprint">pAction</code> from the first call is called at most once.</p>
             * @param pScopeName - A unique name for each unique progress indicator.
             * @param pAction - A no argument function to call to display the progress indicator.
             *     This function may or may not be called depending on how quickly finish is called.
             */
            function start(pScopeName: string, pAction: (...params: any[]) => any): void;
            /**
             * <p>Call this function when the potentially long-running async process finishes. For each call to start with
             * a given <code class="prettyprint">pScopeName</code>, a corresponding call to finish with
             * the same <code class="prettyprint">pScopeName</code> must be made.
             * The <code class="prettyprint">pAction</code> is called exactly once if and only if the corresponding
             * start <code class="prettyprint">pAction</code> was called.
             * If there are multiple calls to finish the <code class="prettyprint">pAction</code> from the last one is called.</p>
             * @param pScopeName - A unique name for each unique progress indicator.
             * @param pAction - A no argument function to call to hide and/or remove the progress indicator.
             *     This function is only called if the action passed to start was called.
             */
            function finish(pScopeName: string, pAction: (...params: any[]) => any): void;
        }
        /**
         * Get a JavaScript Date object corresponding to the input date string which must be in simplified ISO 8601 format.
         * In the future Date.parse could be used but currently there are browsers we support that don't yet support the ISO 8601 format.
         * This implementation is a little stricter about what parts of the date and time can be defaulted. The year, month, and day are
         * always required. The whole time including the T can be omitted but if there is a time it must contain at least the hours
         * and minutes. The only supported time zone is "Z".
         *
         * This function is useful for turning the date strings returned by the
         * <code class="prettyprint">APEX_JSON.STRINGIFY</code> and <code class="prettyprint">APEX_JSON.WRITE</code>
         * procedures that take a DATE value into Date objects that the client can use.
         * @example
         * <caption>This example returns a date object from the date string in result.dateString. For example
         * "1987-01-23T13:05:09.040Z"</caption>
         * var date1 getDateFromISO8601String( result.dateString );
         * @param pDateStr - String representation of a date in simplified ISO 8601 format
         * @returns Date object corresponding to the input date string.
         */
        function getDateFromISO8601String(pDateStr: string): Date;
        /**
         * <p>Gets the system scrollbar size for cases in which the addition or subtraction of a scrollbar
         * height or width would affect the layout of elements on the page. The page need not have a scrollbar on it
         * at the time of this call.</p>
         * @example
         * <caption>The following example returns an object such as <code class="prettyprint">{ width: 17, height: 17 }</code>. Note
         * the actual height and width depends on the Operating System and its various display settings.</caption>
         * var size = apex.util.getScrollbarSize();
         * @returns An object with height and width properties that describe any scrollbar on the page.
         */
        function getScrollbarSize(): any;
        /**
         * <p>Wrapper around requestAnimationFrame that can fallback to <code class="prettyprint">setTimeout</code>.
         * Calls the given function before next browser paint. See also {@link apex.util.cancelInvokeAfterPaint}.</p>
         * <p>See HTML documentation for <code class="prettyprint">window.requestAnimationFrame</code> for details.</p>
         * @example
         * <caption>This example will call the function myAnimationFunction before the next browser repaint.</caption>
         * var id = apex.util.invokeAfterPaint( myAnimationFunction );
         * // ... if needed it can be canceled
         * apex.util.cancelInvokeAfterPaint( id );
         * @param pFunction - function to call after paint
         * @returns id An id that can be passed to {@link apex.util.cancelInvokeAfterPaint}
         */
        function invokeAfterPaint(pFunction: (...params: any[]) => any): any;
        /**
         * <p>Wrapper around cancelAnimationFrame that can fallback to <code class="prettyprint">clearTimeout</code>.
         * Cancels the callback using the id returned from {@link apex.util.invokeAfterPaint}.</p>
         * @example
         * <caption>See example for function {@link apex.util.invokeAfterPaint}</caption>
         * @param pId - The id returned from {@link apex.util.invokeAfterPaint}.
         */
        function cancelInvokeAfterPaint(pId: any): void;
        /**
         * <p>Returns string <code class="prettyprint">pText</code> with all HTML tags removed.</p>
         * @example
         * <caption>This example removes HTML tags from a text string.</caption>
         * apex.util.stripHTML( "Please <a href='www.example.com/ad'>click here</a>" );
         * // result: "Please click here"
         * @param pText - The string that may contain HTML markup that you want removed.
         * @returns The input string with all HTML tags removed.
         */
        function stripHTML(pText: string): string;
        /**
         * <p>Returns the nested object at the given path <code class="prettyprint">pPath</code> within the nested object structure in
         * <code class="prettyprint">pRootObject</code> creating any missing objects along the path as needed.
         * This function is useful when you want to set the value of a property in a deeply
         * nested object structure and one or more of the nested objects may or may not exist.
         * </p>
         * @example
         * <caption>This example sets the value of <code class="prettyprint">options.views.grid.features.cellRangeActions</code>
         * to <code class="prettyprint">false</code>.
         * It works even when the options object does not contain a views.grid.features object or a views.grid object
         * or even a views object.</caption>
         * var o = apex.util.getNestedObject( options, "views.grid.features" );
         * o.cellRangeActions = false; // now options.views.grid.features.cellRangeActions === false
         * @param pRootObject - The root object of a nested object structure.
         * @param pPath - A dot (".") separated list of properties leading from the root object to the desired object
         *   to return.
         */
        function getNestedObject(pRootObject: any, pPath: string): any;
        /**
         * <p>This function applies data to a template. It processes the template string given in
         * <code class="prettyprint">pTemplate</code> by substituting
         * values according to the options in <code class="prettyprint">pOptions</code>.
         * The template supports APEX server style placeholder and item substitution syntax.</p>
         *
         * <p>This function is intended to process APEX style templates in the browser.
         * However, it doesn't have access to all the data that the server has. When substituting page items and column
         * items it uses the current value stored in the browser not what is in session state on the server.
         * It does not support the old non-exact substitutions (with no trailing dot e.g. &ITEM). It does not support
         * the old column reference syntax that uses #COLUMN_NAME#. It cannot call
         * <code class="prettyprint">PREPARE_URL</code> (this must be done on the server).
         * Using a template to insert JavaScript into the DOM is not supported.
         * After processing the template all script tags are removed.</p>
         *
         * <p>The format of a template string is any text intermixed with any number of replacement tokens
         * or directives. Two kinds of replacement tokens are supported: placeholders and data substitutions.
         * Directives control the processing of the template. Directives are processed first, then placeholders and finally
         * data substitutions.</p>
         *
         * <div class="hw">
         * <h3 id="placeholders-section">Placeholders</h3>
         * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Placeholders" href="#placeholders-section"></a>
         * </div>
         * <p>This is also known as a hash substitution.</p>
         * <p>Placeholder syntax is:</p>
         * <pre class="prettyprint"><code>#&lt;placeholder-name>#
         * </code></pre>
         * <p>The &lt;placeholder-name> is an uppercase alpha numeric plus "_", and "$" string that must be a property
         * name in option object <code class="prettyprint">placeholders</code> that gets replaced with the property value.
         * Any placeholder tokens that don't match anything in the placeholders object are left as is (searching for the
         * next placeholder begins with the trailing # character).</p>
         *
         * <div class="hw">
         * <h3 id="substitutions-section">Data substitutions</h3>
         * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Data substitutions" href="#substitutions-section"></a>
         * </div>
         * <p>Substitution syntax is any of the following:</p>
         * <pre class="prettyprint"><code>&&lt;item-name>.
         * &&lt;item-name>!&lt;escape-filter>.
         * &"&lt;quoted-item-name>".
         * &"&lt;quoted-item-name>"!&lt;escape-filter>.
         * &APP_TEXT$&lt;message-key>.
         * &APP_TEXT$&lt;message-key>!&lt;escape-filter>.
         * &"APP_TEXT$&lt;message-key>".
         * &"APP_TEXT$&lt;message-key>"!&lt;escape-filter>.
         * &{message-key &lt;parameters>}.
         * &{"message-key" &lt;parameters>}.
         * &{message-key &lt;parameters>}!&lt;escape-filter>.
         * &{"message-key" &lt;parameters>}!&lt;escape-filter>.
         * </code></pre>
         *
         * <p>The &lt;item-name> is an uppercase alpha numeric plus "_", "$", and "#" string. The &lt;quoted-item-name>
         * is a string of any characters except carriage return, line feed, and double quote.
         * In both cases the item name is the name of a page item (unless option <code class="prettyprint">includePageItems</code> is false),
         * a column item (if <code class="prettyprint">model</code> and <code class="prettyprint">record</code> options are given
         * or when looping over a model), a built-in substitution (unless option
         * <code class="prettyprint">includeBuiltinSubstitutions</code> is false),
         * or an extra substitution (if option <code class="prettyprint">extraSubstitutions</code> is given or within a
         * loop directive).</p>
         * <p>Note: While a quoted item name can contain almost any characters it cannot contain a placeholder or directive.
         * So for example <code class="prettyprint">&"X#Y#Z".</code> will not work if there is a placeholder named
         * <code class="prettyprint">Y</code> and <code class="prettyprint">&"X{if Y/}Z".</code> will not work
         * because <code class="prettyprint">if</code> is a directive.</p>
         *
         * <p>The &lt;item-name> can include a property reference. A "%" character separates the item-name from the property name.
         * For example <code class="prettyprint">&P1_NAME%LABEL.</code> will return the label of the P1_NAME item.
         * The property name is case-insensitive for the following item and column properties. If the item value
         * is an object the property name is case-sensitive and accesses the value of the object property with that name.</p>
         *
         * <p>The properties and the values they return for a page item are:</p>
         * <ul>
         *     <li><strong>LABEL</strong> - The item label.</li>
         *     <li><strong>DISPLAY</strong> - The display value of the item's current value.</li>
         *     <li><strong>CHANGED</strong> - "Y" if the item has been changed and "N" otherwise.</li>
         *     <li><strong>DISABLED</strong> - "Y" if the item is disabled and "N" otherwise.</li>
         * </ul>
         *
         * <p>The properties for a column item are:</p>
         * <ul>
         *     <li><strong>HEADING</strong> - The column heading text. The heading may include markup. If there is no heading
         *        the label will be used if there is one.</li>
         *     <li><strong>LABEL</strong> - The column label. If there is no label the heading will be used with markup removed.</li>
         *     <li><strong>DISPLAY</strong> - The display value of the column value for the current row/record.</li>
         *     <li><strong>HEADING_CLASS</strong> - Any CSS classes defined for the column heading.</li>
         *     <li><strong>COLUMN_CLASS</strong> - Any CSS classes defined for the column.</li>
         *     <li><strong>REQUIRED</strong> - "Y" if the column is required and "N" otherwise.</li>
         * </ul>
         *
         * <p>The &lt;message-key> is a message key suitable for use in {@link apex.lang.getMessage} and
         * is replaced with the localized message text for the given key. The message must already be loaded on the
         * client by setting the Text Message attribute <em>Used in JavaScript</em> to On or otherwise adding it such as with
         * {@link apex.lang.addMessages}.
         * If no replacement for a substitution can be found it is replaced with the message key. The language specifier
         * that is supported for server side message substitutions is not supported by the client and will be ignored
         * if present.</p>
         * <p>The short Text Messages substitution syntax also support parameters. Before the closing brace, add name=value pairs, separated by white space. Names can contain any character except white space and "=".
         * Values can be one of the following:
         * <ul>
         * <li>Unquoted substitution, HTML-escaped by default. For example:
         * <br/>&P1_NAME.</li>
         * <li>Quoted substitution, HTML-escaped by default. For example:
         * <br/>&"X-1".</li>
         * <li>Unquoted literal value. Anything except double quotes. White space and closing curly brace is supported. For example:
         * <br/>he&she+it?</li>
         * <li>Quoted literal value. The value is enclosed in double quotes. To insert a double quote, type it twice. For example:
         * <br/>"Hello ""APEX"" world"</li>
         * </ul>
         * The following is an example for a complex text message with parameters:
         * <pre class="prettyprint"><code>&{TEXT->MSG
         * Unquoted_Substitution=&P1_NAME!RAW.
         * Quoted_Substitution=&"Quoted name"!RAW.
         * Unquoted_Literal=how/do.you!do?
         * Quoted_Literal="Jerry Garcia
         * Ron ""Pigpen"" McKerhan"}!HTML.
         * </code></pre></p>
         * <p>Note: The short Text Messages substitution syntax requires the Compatibility Mode of the application to be 24.2 or higher.</p>
         *
         * <p>When substituting a column item the given record of the given model is used to find a matching column name.
         * If not found and if the model has a parent model then the parent model's columns are checked.
         * This continues as long as there is a parent model. The order to resolve a data substitution is: message key,
         * column item, column item from ancestor models, page item, built-in substitutions, and finally extra substitutions.
         * For backward compatibility column items support the "_LABEL" suffix to access the defined column label.
         * For example if there is a column item named <code class="prettyprint">NOTE</code> the substitution
         * <code class="prettyprint">&NOTE_LABEL.</code> will return the label string for column <code class="prettyprint">NOTE</code>.
         * It is better to use the label property in this case, for example: <code class="prettyprint">&NOTE%label.</code>.</p>
         *
         * <p>The built-in substitution names are:</p>
         * <ul>
         * <li>&APP_USER.</li>
         * <li>&APP_ID.</li>
         * <li>&APP_PAGE_ID.</li>
         * <li>&APP_SESSION.</li>
         * <li>&APP_FILES.</li>
         * <li>&WORKSPACE_FILES.</li>
         * <li>&REQUEST.</li>
         * <li>&DEBUG.</li>
         * <li>&APEX_FILES.</li>
         * <li>&IMAGE_PREFIX. (legacy- use &APEX_FILES. instead)</li>
         * <li>&APEX_VERSION.</li>
         * <li>&APEX_BASE_VERSION.</li>
         * </ul>
         *
         * <p>See {@link apex.env} for the meaning of these substitutions.</p>
         *
         * <p>The escape-filter controls how the replacement value is escaped or filtered. It can be one of the following
         * values:</p>
         * <ul>
         * <li>HTML the value will have HTML characters escaped using {@link apex.util.escapeHTML}.</li>
         * <li>ATTR the value will be escaped for an HTML attribute value context using {@link apex.util.escapeHTMLAttr}.</li>
         * <li>RAW does not change the value at all.</li>
         * <li>STRIPHTML the value will have HTML tags removed and HTML characters escaped.</li>
         * </ul>
         * <p>This will override any default escape filter set with option <code class="prettyprint">defaultEscapeFilter</code>
         * or from the column definition <code class="prettyprint">escape</code> property.</p>
         *
         * <div class="hw">
         * <h3 id="directives-section">Directives</h3>
         * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Directives" href="#directives-section"></a>
         * </div>
         * <p>Directive syntax is:</p>
         * <pre class="prettyprint"><code>{&lt;directive-name>[ &lt;directive-arguments>]/}
         * </code></pre>
         * <p>The directive name determines what it does as described below. Directive names are case-insensitive.
         * There can be no whitespace between the open bracket "{" and the directive name.
         * Directives often come in sets that work together. A directive may have additional arguments.</p>
         *
         * <h4>If condition directives</h4>
         * <p>Syntax:</p>
         * <pre class="prettyprint"><code>{if [!][?|=]NAME/}
         * TRUE_TEMPLATE_TEXT
         * {elseif [!][?|=]NAME2/}
         * ELSE_TRUE_TEMPLATE_TEXT
         * {else/}
         * FALSE_TEMPLATE_TEXT
         * {endif/}
         * </code></pre>
         *
         * <p>The entire text from the <strong>if</strong> directive to the matching <strong>endif</strong> directive is
         * replaced with the processed template text following the first <strong>if</strong> or <strong>elseif</strong>
         * directive that evaluates to true or the template text following the <strong>else</strong>
         * directive if none are true. There must be an <strong>if</strong> and <strong>endif</strong> directive.
         * The <strong>elseif</strong> and <strong>else</strong> directives are optional.
         * There can be any number of <strong>elseif</strong> directives. The directives must go in the order shown.
         * <strong>If</strong> directives can be nested.
         * That means any of the template texts can contain another <strong>if</strong> directive.</p>
         *
         * <p>The <strong>if</strong> and <strong>elseif</strong> directives test the value of NAME
         * and if it is true process the following template text.
         * The NAME can be an item-name, quoted-item-name, or placeholder-name. The value of an item-name or quoted-item-name
         * is the value of that page item or column item. The value of a placeholder-name is the text of the placeholder.
         * If no data substitution or placeholder with that name exists then the value is empty string.</p>
         *
         * <p>A value is false if after trimming leading and trailing spaces it is an empty string,
         * or for a page item the item {@link item#isEmpty} method returns true,
         * or if the value is equal to any of the values in the <code class="prettyprint">falseValues</code> option.
         * Any value that is not false is true. If the name is prefixed with exclamation mark (!) operator then the logic is
         * negated and the following template text is processed if the value is false.</p>
         *
         * <p>The if condition directive handles both empty (or not empty) tests and Boolean true/false tests (using the
         * convention of character true/false values such as 'Y'/'N') at the same time. This results in confusion for
         * rare case where the intention is to test for not empty but the actual value is 'N', which is not empty but
         * still considered false. The optional '?' prefix operator can be used to explicitly test if the value is empty.
         * The optional '=' prefix operator can be used to explicitly test if the value is true or false.</p>
         *
         * <p>Example:<br>
         * The page contains items P1_TITLE, P_ICON, P1_DESCRIPTION, and P1_DETAILS and all have optional values.
         * The template outputs a default title if P1_TITLE is empty. An optional icon is shown only if there is a title.
         * The template output includes markup for the description if it is not empty or details if it is not empty and
         * nothing otherwise.</p>
         *
         * <pre class="prettyprint"><code>&lt;h3>{if ?P1_TITLE/}&P1_TITLE. {if P1_ICON/}&lt;span class="fa &P1_ICON.">&lt;/span>{endif/}
         * {else/}Untitled{endif/}&lt;/h3>
         * {if P1_DESCRIPTION/}
         *   &lt;p class="description">&P1_DESCRIPTION.&lt;/p>
         * {elseif P1_DETAILS/}
         *   &lt;p class="details">&P1_DETAILS.&lt;/p>
         * {endif/}
         * </code></pre>
         *
         * <h4>Case condition directives</h4>
         * <p>Syntax:</p>
         * <pre class="prettyprint"><code>{case NAME/}
         * {when string1/}
         * TEMPLATE_TEXT1
         * {when string2/}
         * TEMPLATE_TEXT2
         * {otherwise/}
         * TEMPLATE_TEXT
         * {endcase/}
         * </code></pre>
         *
         * <p>The entire text from the <strong>case</strong> directive to the matching <strong>endcase</strong> directive
         * is replaced with the processed template text after the <strong>when</strong> directive that matches the NAME value.
         * The value of NAME is compared with each of the strings in the <strong>when</strong> directive and if it is equal the following
         * template (TEMPLATE_TEXTn) is processed. If no <strong>when</strong> directive matches then the template after
         * the <strong>otherwise</strong> directive is processed if there is one. The <strong>otherwise</strong> directive is optional
         * but it must come at the end and there can only be one. <strong>Case</strong> directives can be nested.
         * That means any of the template texts can contain another <strong>case</strong> directive.</p>
         *
         * <p>The NAME can be an item-name, quoted-item-name, or placeholder-name. The value of an item-name or quoted-item-name
         * is the value of that page item or column item. The value of a placeholder-name is the text of the placeholder.
         * If no data substitution or placeholder with that name exists then the value is empty string. The NAME value and each string
         * is trimmed of leading and trailing spaces before comparison. The comparison is case-sensitive.</p>
         *
         * <p>Example:<br>
         * The page contains items P1_NAME and P1_DETAILS, and P1_DETAIL_STYLE that can have a value of "FULL" or "BRIEF".
         * The intention is to control the markup according to the detail style.</p>
         * <pre class="prettyprint"><code>{case P1_DETAIL_STYLE/}
         * {when FULL/}
         *     &lt;div class="full">
         *         &lt;span>&P1_NAME!HTML.&lt;/span>
         *         &lt;p class="description">&P1_DETAILS!HTML.&lt;/p>
         *     &lt;/div>
         * {when BRIEF/}
         *   &lt;div class="brief">
         *       &lt;span>&P1_NAME!HTML.&lt;/span>
         *   &lt;/div>
         * {endcase/}
         * </code></pre>
         *
         * <h4>Loop directives</h4>
         * <p>Syntax:</p>
         * <pre class="prettyprint"><code>{loop ["SEP"] NAME/}
         * TEMPLATE_TEXT
         * {endloop/}</code></pre>
         * or
         * <pre class="prettyprint"><code>{loop MODEL_ID/}
         * TEMPLATE_TEXT
         * {endloop/}
         * </code></pre>
         *
         * <p>The entire text from the <strong>loop</strong> directive to the matching <strong>endloop</strong> directive is
         * replaced with the template text evaluated once for each item in the NAME value or each record in the
         * {@link model} with id MODEL_ID.</p>
         *
         * <p>In the first syntax, the NAME can be an item-name, quoted-item-name, or placeholder-name.
         * The value of an item-name or quoted-item-name is the value of that page item or column item.
         * The value of a placeholder-name is the text of the placeholder.
         * If no data substitution or placeholder with that name exists then the value is empty string. The NAME value should
         * be a separator delimited string that contains a list of items. The optional SEP argument defines the separator
         * character. If no SEP is given and NAME is an item, then the item's {@link item#getMultiValueStorage} method is used
         * to determine the separator, otherwise the default separator ":" is used. If SEP is more than one character it is
         * treated as a regular expression.</p>
         *
         * <p>Within the loop there are two extra data substitutions available:</p>
         * <ul>
         *     <li><strong>APEX$ITEM</strong> - This is the value of the current item in the list.</li>
         *     <li><strong>APEX$I</strong> - This is 1 based index of the current item in the list.</li>
         * </ul>
         *
         * <p>In the second syntax, the MODEL_ID identifies a model created with {@link apex.model.create} (this
         * includes models created by regions such as Interactive Grid and Cards).
         * If the MODEL_ID is omitted then the model passed in the <code class="prettyprint">pOptions.model</code>
         * property is used. A model name can either be a string or, for detail models, an array of this
         * form: <code class="prettyprint">["name", "instance"]</code> (see {@link Model.ModelId}).
         * The MODEL_ID allows data substitutions as shown in the nested loop example below.</p>
         *
         * <p>Within the loop there are three extra data substitutions available:</p>
         * <ul>
         *     <li><strong>APEX$ID</strong> - This is the identity of the record. See {@link model#getRecordId}.</li>
         *     <li><strong>APEX$I</strong> - This is 1 based index of the current record.</li>
         *     <li><strong>APEX$META</strong> - This is an object with metadata about the current record. The metadata
         *     comes from {@link Model.RecordMetadata} but in a form that is easier to use from templates.
         *     The object has these properties (case is significant):
         *     <ul>
         *     <li><strong>valid</strong> - This is "Y" (true) unless the record is deleted, an aggregate record
         *       or has an error or warning.</li>
         *     <li><strong>state</strong> - This is "O" for original, "D" for deleted, "I" for inserted,
         *       "U" for updated and empty string for non-data records.</li>
         *     <li><strong>allowedOperations</strong> - This is one of "" for no editing, "U" update only,
         *       "D" for delete only, "UD" for update and delete.</li>
         *     <li><strong>selected</strong> - This is "Y" (true) if the record is selected and "N" otherwise.
         *       This only applies if the view widget is keeping the selected state in the model.</li>
         *     <li><strong>agg</strong> - This is the aggregate name of an aggregate record (example: "SUM")
         *       or empty string otherwise.</li>
         *     <li><strong>highlight</strong> - This is the highlight name.</li>
         *     <li><strong>endControlBreak</strong> - This is "Y" (true) if this record marks the end of a control break.</li>
         *     <li><strong>grandTotal</strong> - This is "Y" (true) if this is an aggregate record and it is
         *       the grand total (overall value) for the aggregate.</li>
         *     <li><strong>errorMessage</strong> - This is the error message for the record if there is one.</li>
         *     <li><strong>warningMessage</strong> - This is the warning message for the record if there is one.</li>
         *     </ul></li>
         * </ul>
         *
         * <p>Example:<br>
         * The following example takes a page item, <code class="prettyprint">P1_TAGS</code> that contains a bar "|"
         * separated list of tags such as "apples|cherries|pears" and turns it into an HTML list that can be nicely styled.</p>
         * <pre class="prettyprint"><code>&lt;ul class="tags">{loop "|" P1_TAGS/}
         *   &lt;li class="tag-item">&APEX$ITEM.&lt;/li>
         * {endloop/}&lt;/ul>
         * </code></pre>
         *
         * <p>Example:<br>
         * The following example loops over a model with id "emp_grid" and turns it into a list of names.
         * The model includes EMPNO and ENAME columns. Aggregate and deleted records are not included.</p>
         * <pre class="prettyprint"><code>&lt;ul>{loop emp_grid/}{if APEX$META%valid/}
         * &lt;li id="list_&EMPNO!ATTR.">&ENAME.&lt;/li>
         * {endif/}{endloop/}&lt;/ul>
         * </code></pre>
         *
         * <p>Example:<br>
         * The following example shows a nested loop over master and detail models. This uses the sample DEPT and EMP
         * tables. It produces nested UL list elements.</p>
         * <p>Note the inner loop uses &DEPTNO. from the outer loop to form the model id of the detail model.</p>
         * <p>Note loops over models only include records that have already been fetched from the server and
         * detail models that have been created.</p>
         * For brevity the {if APEX$META%valid/} is omitted from the inner loop.</p>
         * <pre class="prettyprint"><code>&lt;ul>{loop dept_grid/}{if APEX$META%valid/}
         * &lt;li>&DNAME. - &LOC.:&lt;ul>{loop ["emp_grid", "&DEPTNO."]/}
         *   &lt;li>&ENAME.&lt;/li>
         *   {endloop/}&lt;/ul>&lt;/li>
         * {endif/}{endloop/}&lt;/ul>
         * </code></pre>
         *
         * <h4>Comments</h4>
         * <p>Syntax:</p>
         * <pre class="prettyprint"><code>{!&lt;comment-text>/}
         * </code></pre>
         *
         * <p>This directive is substituted with nothing. It allows adding comments to templates.
         * The comment-text can be any characters except new line and the "/}" sequence.</p>
         *
         * <p>Example:<br>
         * This example includes a comment reminding the developer to complete something. In this case
         * replace a hard coded English string with a localizable text message.</p>
         * <pre class="prettyprint"><code>&lt;span>Name: &P1_NAME.&lt;/span> {!to do replace Name: with text message/}
         * </code></pre>
         *
         * <h4>Escape open bracket "{"</h4>
         * <p>Syntax:</p>
         * <pre class="prettyprint"><code>{{/}
         * </code></pre>
         *
         * <p>In rare cases a lone open bracket "{" can be confused for the start of a directive if another directive
         * follows it on the same line.</p>
         *
         * <p>Example:<br>
         * This is an example where the open bracket "{" has to be escaped. </p>
         * <pre class="prettyprint"><code>&lt;span>The coordinates {{/}c, d} = {if VAL/}&VAL.{else/}unknown{endif/}&lt;/span>
         * </code></pre>
         * <p>Here are similar cases that don't require an escape.</p>
         * <pre class="prettyprint"><code>&lt;span>The coordinates { c, d } = {if VAL/}&VAL.{else/}unknown{endif/}&lt;/span>
         * </code></pre>
         * <pre class="prettyprint"><code>&lt;span>The coordinates {c, d} =
         * {if VAL/}&VAL.{else/}unknown{endif/}&lt;/span>
         * </code></pre>
         * @example
         * <caption>This example inserts an image tag where the path to the image comes from the built-in
         * APEX_FILES substitution and a page item called P1_PROFILE_IMAGE_FILE.</caption>
         * apex.jQuery( "#photo" ).html(
         *     apex.util.applyTemplate(
         *         "<img src='&APEX_FILES.people/&P1_PROFILE_IMAGE_FILE.'>" ) );
         * @example
         * <caption>This example inserts a div with a message where the message text comes from a
         *     placeholder called MESSAGE.</caption>
         * var options = { placeholders: { MESSAGE: "All is well." } };
         * apex.jQuery( "#notification" ).html( apex.util.applyTemplate( "<div>#MESSAGE#</div>", options ) );
         * @param pTemplate - A template string with any number of replacement tokens as described above.
         * @param [pOptions] - An options object with the following properties that specifies how the template
         *     is to be processed:
         * @param [pOptions.placeholders] - An object map of placeholder names to values.  The default is null.
         * @param [pOptions.directives] - Specify if directives are processed. If true directives are processed.
         *    If false directives are ignored and remain part of the text. The default is true.
         * @param [pOptions.defaultEscapeFilter] - One of the above escape-filter values or false. The default is HTML.
         *    This is the escaping/filtering that is done if the substitution token doesn't specify an escape-filter.
         *    If a model column definition has an <code class="prettyprint">escape</code> property
         *    then it will override the default escaping.
         *    This can also be false to turn off escaping (even when the substitution token includes an escape-filter)
         *    for the case where the return value of <code class="prettyprint">applyTemplate</code> is going to be escaped.
         *    Setting <code class="prettyprint">defaultEscapeFilter</code> to false avoids double escaping when the
         *    template result is going to be passed to an API that does its own escaping.
         *    Note: when false the STRIPHTML escape-filter will still strip HTML tags, but it will not HTML escape
         *    the result.
         * @param [pOptions.includePageItems] - If true the current value of page items are substituted.
         *     The default is true.
         * @param [pOptions.model] - The model interface used to get column item values. The default is null.
         * @param [pOptions.record] - The record in the model to get column item values from.
         *     Option <code class="prettyprint">model</code> must also be provided. The default is null.
         * @param [pOptions.extraSubstitutions] - An object map of extra substitutions. The default is an empty object.
         * @param [pOptions.includeBuiltinSubstitutions] - If true built-in substitutions such as APP_ID are done.
         *     The default is true.
         * @param [pOptions.falseValues] - An array of values that are considered false in if directive tests.
         *     Empty string and an item that doesn't exist are always considered false.
         *     The default is ["F", "f", "N", "n", "0"]
         * @param [pOptions.iterationCallback] - A function called during loop directive iteration before each
         *     item or record and just once before processing a template when options <code class="prettyprint">model</code>
         *     and <code class="prettyprint">record</code> are provided. The function signature is: <br>
         *     <code class="prettyprint">callback(loopArg, model, record, index, placeholders, extraSubstitutions)</code>.
         *     The <code class="prettyprint">index</code> parameter is the 0 based index of the item or record in the
         *     collection being iterated over. The <code class="prettyprint">extraSubstitutions</code> parameter is an
         *     object that contains the properties in the extraSubstitutions option passed to applyTemplate
         *     as well as any extra data substitutions defined by the loop directive.
         *     This allows making additional substitutions available to the template by assigning a value to a property
         *     of <code class="prettyprint">extraSubstitutions</code>. When looping over an item value the model and record
         *     parameters will be null. When called once before template processing (when options
         *     <code class="prettyprint">model</code> and <code class="prettyprint">record</code> are provided) the loopArg
         *     and index parameters will be null.
         * @returns The template string with replacement tokens substituted with data values.
         */
        function applyTemplate(pTemplate: string, pOptions?: {
            placeholders?: any;
            directives?: boolean;
            defaultEscapeFilter?: string | false;
            includePageItems?: boolean;
            model?: model;
            record?: Model.Record;
            extraSubstitutions?: any;
            includeBuiltinSubstitutions?: boolean;
            falseValues?: string[];
            iterationCallback?: (...params: any[]) => any;
        }): string;
    }
    /**
     * <p>The apex.widget namespace stores all the general purpose widget related functions of Oracle APEX.</p>
     */
    namespace widget {
        /**
         * <p>Shows a wait popup. A wait popup consists of an overlay div that keeps the user from clicking on any part of the page
         * along with a visual "spinner" animation of some kind. It does not keep the user from interacting with the
         * page using the keyboard.</p>
         *
         * <p>This is intended to be used just prior to submitting the page such that the page (and hence this popup) will soon be
         * replaced with a new page. If you do need to close the popup, use the "remove" function of the returned object.
         * See {@link apex.util.showSpinner} and {@link apex.util.delayLinger} for a low level solution more suitable for ajax requests or
         * other long-running processes.</p>
         *
         * <p>This function is rarely needed because it is automatically called in {@link apex.page.submit} based on the
         * showWait option. Also typically ajax operations don't require an overlay to disable clicking.</p>
         * @example
         * <caption>The following example shows a wait spinner and disables clicking on the page while some
         * long-running ajax action takes place and then removes the spinner when it is done.</caption>
         * var popup = apex.widget.waitPopup();
         * var promise = apex.server.process(...);
         * promise.always(function() {
         *     popup.remove();
         * });
         * @param [pContent] - HTML code for a wait indicator. If it is not provided, the default CSS animation
         *                            wait indicator will be displayed.
         * @returns Object with a no argument function "remove" that closes the popup.
         */
        function waitPopup(pContent?: string): any;
        /**
         * This function is a wrapper around {@link apex.item.create}. It is for backward compatibility.
         * See {@link apex.item.create} for details.
         */
        function initPageItem(): void;
    }
}

/**
 * <p>The item interface is used to access methods and properties of an Oracle APEX item including item plug-ins.
 * You get access to the item interface for a page or column item with the {@link apex.item|apex.item} function.</p>
 *
 * <p>An item interface can apply to either a page item or column item.
 * Page items are items on the page backed by session state in any region.
 * Column items are created by region types such as Interactive Grid that support editable columns.
 * The state of a column item, including its value, changes according to the editing context (active record)
 * of the region and is typically backed by data in an Oracle APEX {@link model}.</p>
 *
 * <p>Plug-in developers can define the behavior of their item by calling {@link apex.item.create}.</p>
 */
declare interface item {
    /**
     * <p>The DOM element that best represents the value of the Oracle APEX item. If the item doesn't exist
     * then the value is false.</p>
     * @example
     * <caption>The following code checks if the Oracle APEX item
     * P1_OPTIONAL_ITEM exists before setting its value. Use code similar to this
     * if there is a possibility of the item not existing.</caption>
     * var item = apex.item( "P1_OPTIONAL_ITEM" );
     * if ( item.node ) {
     *     item.setValue( newValue );
     * }
     */
    node: Element | false;
    /**
     * <P>The jQuery object for this item element. If the item doesn't exist then it is the empty jQuery object $().
     * This is primarily for plug-in developers.</p>
     */
    element: jQuery;
    /**
     * <p>A string that identifies the type of the item.</p>
     */
    item_type: string;
    /**
     * <p>The id of the DOM element of the item. If the item doesn't exist then the value is false.</p>
     */
    id: string | false;
    /**
     * <p>A shorthand for getting and setting page item values. This autogenerated property
     * is based on {@link item#getValue} and {@link item#setValue}.</p>
     * <p>Note that you can pass other parameters using {@link item#setValue} such as
     * <code class="prettyprint">pDisplayValue</code> and <code class="prettyprint">pSuppressChange</code>,
     * which is not possible via <code class="prettyprint">.value</code>.</p>
     * @example
     * <caption>Getting a page item value:</caption>
     * var empno = apex.item( "P1_EMPNO" ).getValue();
     * // is equivalent to:
     * var empno = apex.item( "P1_EMPNO" ).value;
     * // is equivalent to:
     * var empno = apex.items.P1_EMPNO.value;
     * @example
     * <caption>Setting a page item value:</caption>
     * apex.item( "P1_EMPNO" ).setValue( "100" );
     * // is equivalent to:
     * apex.item( "P1_EMPNO" ).value = "100";
     * // is equivalent to:
     * apex.items.P1_EMPNO.value = "100";
     */
    value: string | any[];
    /**
     * <p>Returns true if the item is fully ready to use and false otherwise.
     * This function is only applicable to items that take extra time to load.
     * For example items that are implemented by libraries that load asynchronously including JET or other
     * libraries that use RequireJS. For most items this will always return true.
     * In addition, it is only useful for code that runs as, or soon after, the page loads. It is not needed
     * in code called from dynamic actions because all dynamic action page load processing waits until
     * after all items are loaded.</p>
     * <p>See also {@link item#whenReady} and the <code class="prettyprint">delayLoading</code> property of
     * {@link apex.item.create}.</p>
     * @example
     * <caption>This example checks that a delayLoading item is ready before getting its value
     * and uses a default string if it is not ready.</caption>
     * var value = "waiting...",
     *     theItem = apex.item( "P1_DATE1" );
     * if ( theItem.isReady() ) {
     *     value = theItem.getValue();
     * }
     */
    isReady(): boolean;
    /**
     * <p>Returns the current value of an Oracle APEX item. The initial value of a page item comes from
     * session state when the server renders the page. The initial value of a column item comes from the
     * corresponding field value of the active record of the Oracle APEX {@link model}. This function
     * always returns the current value of the item, which may have been changed by the user or with the
     * {@link item#setValue} method since it was initialized.</p>
     *
     * <p>There are two shorthand functions related to <code class="prettyprint">getValue</code>.
     * The {@link $v} function that returns an item's value as a string.
     * This will either be a single value, or if the item supports multiple values, will
     * be a ':' colon separated list of values. Note this does not make use of the configurable separator or
     * storage type for multivalued items.
     * The {@link $v2} function, which is just a shortcut
     * to getValue and returns either a single value, or an array of values. See also {@link item#setValue}.</p>
     * @example
     * <caption>In this example, the current value of the page item called P1_ITEM will be shown in an
     * alert.</caption>
     * apex.message.alert( "P1_ITEM value = " + apex.item( "P1_ITEM" ).getValue() );
     * @returns Returns either a single string value or array of string values if the item
     * supports multiple values (for example the 'Select List' with attribute
     * 'Multiple Values : Type' not equal to 'No' or 'Shuttle' native item types).
     */
    getValue(): string | any[];
    /**
     * <p>Sets the Oracle APEX item value. This function sets the current value of the
     * item. For page items the session state is not affected until the page is submitted (or the item
     * is explicitly saved to the server using ajax or a dynamic action). For column items the region
     * such as Interactive Grid takes care of writing the value back to the Oracle APEX {@link model}
     * when appropriate.</p>
     *
     * <p>Normally a change event is explicitly triggered on the item node when the value is set. This allows
     * cascading LOV functionality and dynamic action change events to work.
     * The caller may suppress the change event for the item being set, if needed. The change event should be
     * suppressed when the value is set while processing a change event triggered on the same item, to prevent
     * an infinite loop. The {@link grid} widget relies on the change event to update the model. If you suppress
     * the change event on a column item you may need to call the {@link grid#setActiveRecordValue} method.</p>
     *
     * <p>There is a shorthand function for setValue {@link $s}. See also {@link item#getValue}.</p>
     * @example
     * <caption>In this example, the value of the page item called P1_ITEM will be set to 10.
     * As <code class="prettyprint">pSuppressChangeEvent</code> has not been passed, the default behavior of the
     * <code class="prettyprint">change</code> event triggering for P1_ITEM will occur.</caption>
     * apex.item( "P1_ITEM" ).setValue( "10" );
     * @example
     * <caption>In this example, P1_ITEM is a Popup LOV page item with distinct display and return values.
     * The display value of P1_ITEM will be set to SALES, and the hidden return value will be set to 10.
     * Because true has been passed for the <code class="prettyprint">pSuppressChangeEvent</code> parameter,
     * the <code class="prettyprint">change</code> event will not trigger for the P1_ITEM item.</caption>
     * apex.item( "P1_ITEM" ).setValue( "10", "SALES", true );
     * @example
     * <caption>This example shows how to suppress the change event when there is no display value.</caption>
     * apex.item( "P1_ITEM" ).setValue( "10", null, true );
     * @param pValue - The value to set. For items that support multiple values (for example a
     * 'Shuttle'), an array of string values can be passed to set multiple values at once.
     * @param [pDisplayValue] - The display value, only if different from pValue and can't be determined by the item itself.
     *   For example, for the item type Popup LOV when the display value and return value are different,
     *   this parameter sets the display value while the <code class="prettyprint">pValue</code> parameter sets the hidden return value.
     * @param [pSuppressChangeEvent] - Pass true to prevent the change event from being triggered
     *   for the item being set. The default is false.
     */
    setValue(pValue: string | string[], pDisplayValue?: string, pSuppressChangeEvent?: boolean): void;
    /**
     * <p>Enables the Oracle APEX item value that has been disabled, making it available for editing.
     * Not all items support being disabled. This only applies to items that can be edited.
     * See also {@link item#disable}.</p>
     * @example
     * <caption>In this example, the page item called P1_ITEM will be enabled and available for edit.</caption>
     * apex.item( "P1_ITEM" ).enable();
     */
    enable(): void;
    /**
     * <p>Disables the Oracle APEX item, making it unavailable for editing.
     * Not all items support being disabled. This only applies to items that can be edited. See also {@link item#enable}.</p>
     * @example
     * <caption>In this example, the page item named P1_ITEM will be disabled and unavailable for editing.</caption>
     * apex.item( "P1_ITEM" ).disable();
     */
    disable(): void;
    /**
     * Returns the disabled state of an item.
     * @example
     * <caption>This example gets the value of an item, but only if it is not disabled.</caption>
     * var value = null;
     * if ( !apex.item( "P1_ITEM" ).isDisabled() ) {
     *     value = apex.item( "P1_ITEM" ).getValue();
     * }
     * @returns true if the item is disabled and false otherwise.
     */
    isDisabled(): boolean;
    /**
     * <p>Shows the Oracle APEX item. When using the show function, it is important to understand the following:</p>
     * <ul>
     * <li>If the item being shown is rendered on a page using table layout (meaning the page references a page
     * template with Grid Layout Type set to 'HTML Table'), and the call to show has specified to show the entire
     * table row (<code class="prettyprint">pShowRow</code> = true), then it is assumed that everything pertaining to the item is contained in that
     * row, and the entire row will be shown.</li>
     * <li>If the item being shown is rendered on a page using table layout, and the call to show has specified
     * not to show the entire table row (<code class="prettyprint">pShowRow</code> = false, or not passed), then the function will attempt to show
     * the item's label, where the <code class="prettyprint">for</code> attribute matches the <code class="prettyprint">id</code> of the item.</li>
     * <li>If the item being shown is rendered on a page using grid layout (meaning the page references a page
     * template with Grid Layout Type set to either 'Fixed Number of Columns', or 'Variable Number of Columns'),
     * and the item references a Label template that includes a Field Container element with a known <code class="prettyprint">id</code>
     * (so where the Field Container > Before Label and Item attribute includes an HTML element with
     * id="#CURRENT_ITEM_CONTAINER_ID#"), then it is assumed that everything pertaining to the item is contained
     * in the Field Container, and this will be shown.</li>
     * <li>If the item is a column item then just the column value is shown. The exact behavior depends on the
     * type of region. For example, in Interactive Grid just the cell content is shown not the whole column.</li>
     * </ul>
     * <p>See also {@link item#hide}.</p>
     * @example
     * <caption>In this example, the page item called P1_ITEM will be shown.
     * If P1_ITEM is on a page using grid layout and the item references a Label template that includes a Field
     * Container element with a known ID (as detailed above), then that container element will be shown.
     * Otherwise just the item and its corresponding label will be shown.</caption>
     * apex.item( "P1_ITEM" ).show();
     * @param [pShowRow] - This parameter is deprecated.
     * This parameter is optional. The default if not specified is false. If true,
     * shows the nearest containing table row (TR). This parameter is not supported for column items.
     * Its behavior is undefined. Only applicable when item is on a page using table layout
     * (meaning the page references a page template with Grid Layout Type set to 'HTML Table').
     */
    show(pShowRow?: boolean): void;
    /**
     * <p>Hides the Oracle APEX item. When using the hide function, it is important to understand the following:</p>
     * <ul>
     * <li>If the item being hidden is rendered on a page using table layout (meaning the page references a page
     * template with Grid Layout Type set to 'HTML Table'), and the call to hide has specified to hide the entire
     * table row (<code class="prettyprint">pHideRow</code> = true), then it is assumed that everything pertaining to the item is contained in that
     * row, and the entire row will be hidden.</li>
     * <li>If the item being hidden is rendered on a page using table layout, and the call to hide has specified
     * not to hide the entire table row (<code class="prettyprint">pHideRow</code> = false, or not passed), then the function will attempt to hide
     * the item's label, where the <code class="prettyprint">for</code> attribute matches the <code class="prettyprint">id</code> of the item.</li>
     * <li>If the item being hidden is rendered on a page using grid layout (meaning the page references a page
     * template with Grid Layout Type set to either 'Fixed Number of Columns', or 'Variable Number of Columns'),
     * and the item references a Label template that includes a Field Container element with a known <code class="prettyprint">id</code>
     * (so where the Field Container > Before Label and Item attribute includes an HTML element with id="#CURRENT_ITEM_CONTAINER_ID#"),
     * then it is assumed that everything pertaining to the item is contained in the Field Container, and this
     * will be hidden.</li>
     * <li>If the item is a column item then just the column value is hidden. The exact behavior depends on the
     * type of region. For example in Interactive Grid just the cell content is hidden not the whole column.</li>
     * </ul>
     * <p>See also {@link item#show}.</p>
     * @example
     * <caption>In this example, the page item called P1_ITEM will be hidden.
     * If P1_ITEM is on a page using grid layout and the item references a Label template that includes a
     * Field Container element with a known ID (as detailed above), then that container element will be hidden.
     * Otherwise just the item and its corresponding label will be hidden.</caption>
     * apex.item( "P1_ITEM" ).hide();
     * @param [pHideRow] - This parameter is deprecated.
     * This parameter is optional. The default value is false. If true, hides the
     * nearest containing table row (TR). This parameter is not supported for column items.
     * Its behavior is undefined. Only applicable when item is on a page using table layout (meaning the
     * page references a page template with Grid Layout Type set to 'HTML Table').
     */
    hide(pHideRow?: boolean): void;
    /**
     * Returns true or false if an Oracle APEX item is empty and considers any item value consisting of
     * only whitespace including space, tab, or form-feed, as empty.
     * This also respects if the item type uses a List of Values, and a 'Null Return Value' has been defined in the
     * List of Values. In that case, the 'Null Return Value' is used to assert if the item is empty.
     * If you really want to know if something is displayed inside the item, you should use hasDisplayValue().
     * @example
     * <caption>In this example, the call to .isEmpty() determines if the page item called
     * P1_ITEM is empty, and if so displays an alert.</caption>
     * if ( apex.item( "P1_ITEM" ).isEmpty() ) {
     *     apex.message.alert( "P1_ITEM empty!" );
     * }
     * @returns true if the Oracle APEX item is empty and false otherwise.
     */
    isEmpty(): boolean;
    /**
     * Returns true or false if an Oracle APEX item has any currently displayed value e.g. the placeholder is shown.
     * Note: This is not concerned with the true item value (that is the job of isEmpty()),
     * this is more about whether there is currently anything displayed within the item.
     * It is absolutely recommended to implement this interface for LOV-based item plug-ins,
     * to ensure accurate results are returned when null values are used.
     * @example
     * <caption>In this example, the call to .hasDisplayValue() determines if the page item called
     * P1_ITEM has any display value, and if so displays an alert.</caption>
     * if ( apex.item( "P1_ITEM" ).hasDisplayValue() ) {
     *     apex.message.alert( "P1_ITEM has a display value!" );
     * }
     * @returns true if the Oracle APEX item has any displayed value.
     */
    hasDisplayValue(): boolean;
    /**
     * Determine if the value of this item has changed since it was first initialized.
     * Return true if the current value of the Oracle APEX item has changed and false otherwise.
     * Developers rarely have a need to call this function. It is used internally by the Warn on Unsaved Changes feature.
     * Item Plug-in developers should ensure this function works so that the Warn on Unsaved Changes
     * feature can support their plug-in.
     * @example
     * <caption>The following example determines if the value of item P1_ITEM has been changed.</caption>
     * if ( apex.item( "P1_ITEM" ).isChanged() ) {
     *     // do something
     * }
     * @returns true if the item value has changed and false otherwise.
     */
    isChanged(): boolean;
    /**
     * <p>Adds the given value to the current list of values of an item that supports multiple values.
     * Not all multivalued items support this method.</p>
     * @example
     * <caption>In this example, the page item called P1_ITEM will have the value 100 added to the
     * current list of values.</caption>
     * apex.item( "P1_ITEM" ).addValue( "100" );
     * @param pValue - The value to be added.
     * @param [pDisplayValue] - The display value, only if different from pValue and can't be determined by
     *   the item itself. Not all multivalued items that support addValue will support this parameter.
     */
    addValue(pValue: string, pDisplayValue?: string): void;
    /**
     * <p>Removes the given value from the current list of values of an item that supports multiple values.
     * Not all multivalued items support this method.</p>
     * @example
     * <caption>In this example, the page item called P1_ITEM will have the value 100 removed from the
     * current list of values.</caption>
     * apex.item( "P1_ITEM" ).removeValue( "100" );
     * @param [pValue] - The value to be removed. The behavior when no value is given is item specific.
     *   For example, it may remove the currently selected or focused item or items or may do nothing at all.
     */
    removeValue(pValue?: string): void;
    /**
     * <p>Call to refresh the item. What it means for an item to be refreshed depends on the item. Not all items
     * support refresh. Typically, an item such as a select list that has a list of options will refresh the
     * available options from the server. In most cases it is not necessary to call this method directly because
     * the declarative Cascading LOV Parent Items takes care of it automatically.</p>
     * @example
     * <caption>The following example will cause the P1_ITEM select list page item to fetch its options from the server.</caption>
     * apex.item( "P1_ITEM" ).refresh();
     */
    refresh(): void;
    /**
     * <p>Places user focus on the Oracle APEX item, taking into account how specific items are
     * designed to receive focus.</p>
     * @example
     * <caption>In this example, user focus is set to the page item named P1_ITEM.</caption>
     * apex.item( "P1_ITEM" ).setFocus();
     */
    setFocus(): void;
    /**
     * <p>Sets a style for the Oracle APEX item, taking into account how specific items are
     * designed to be styled.</p>
     *
     * <p class="important">Note: Using setStyle is not a best practice. It is better to add or remove CSS classes
     * and use CSS rules to control the style of items. Also keep in mind that the exact markup of native and plug-in items can
     * change from one release to the next.</p>
     * @example
     * <caption>In this example, the CSS property color will be set to red for the page item called P1_ITEM.</caption>
     * apex.item( "P1_ITEM" ).setStyle( "color", "red" );
     * @param pPropertyName - The CSS property name that will be set.
     * @param pPropertyValue - The value used to set the CSS property.
     */
    setStyle(pPropertyName: string, pPropertyValue: string): void;
    /**
     * <p>Returns the display value corresponding to the value given by pValue for the Oracle APEX item.
     * This method is intended for items that have both a value and display value, such as select lists.</p>
     * <p>If the item type does not have a display value distinct from the value then
     * <code class="prettyprint">pValue</code> is returned;
     * meaning that the value is the display value. For item types that have a display value but don't have access
     * to all possible values and display values then this function only works when
     * <code class="prettyprint">pValue</code> is the current value of the item.
     * For the native items, this only applies to item type Popup LOV.
     * For item types such as select lists that have access to all their values,
     * if <code class="prettyprint">pValue</code> is not a valid value then
     * <code class="prettyprint">pValue</code> is returned.</p>
     * @example
     * <caption>This example gets a display value from a select list item called P1_ITEM and displays
     * it in an alert.</caption>
     * apex.message.alert( "The correct answer is: " + apex.item( "P1_ITEM" ).displayValueFor( "APPLES" ) );
     * @param pValue - The value to return the corresponding display value.
     *   For items which support multiple values such as a 'Shuttle' or 'Select List' with attribute
     *   'Allow Multi Selection' set to 'Yes', <code class="prettyprint">pValue</code> may be passed as an array
     *   of values. The return value is always a string with multiple values separated by a comma and space (", ").
     * @param pState - Optional parameter used when items are associated with a {@link model} column
     *   to provide state information about the item value. Most item types don't use this parameter. It is
     *   mostly useful to item types that include markup in the returned display value.
     * @param pState.readonly - If true the column value is readonly.
     * @param pState.disabled - If true the column value is disabled.
     * @returns The string display value corresponding to the given
     *     <code class="prettyprint">pValue</code> as described above.
     */
    displayValueFor(pValue: string | any[], pState: {
        readonly: boolean;
        disabled: boolean;
    }): string;
    /**
     * <p>Return a ValidityState object as defined by the HTML5 constraint validation API for the
     * Oracle APEX item. If a plug-in item implements its own validation then the object may not contain
     * all the fields defined by HTML5. At a minimum it must have the valid property. If the item doesn't support
     * HTML5 validation then it is assumed to be valid.</p>
     *
     * <p>This function does not actually validate the item value. For many item types the browser can do the
     * validation automatically if you add HTML5 constraint attributes such as pattern. Validation can be done
     * using the HTML5 constraint validation API.</p>
     *
     * <p>Developers rarely have a need to call this function. It is used internally by the client side validation
     * feature. Item plug-in developers should ensure this function works with their plug-in.</p>
     * @example
     * <caption>The following example displays a message in an alert dialog if the item called P1_ITEM is not valid.</caption>
     * var item = apex.item( "P1_ITEM" );
     * if ( !item.getValidity().valid ) {
     *     apex.message.alert( "Error: " + item.getValidationMessage() );
     * }
     * @returns A ValidityState object as described above.
     */
    getValidity(): any;
    /**
     * <p>Return a validation message if the Oracle APEX item is not valid and empty string otherwise.</p>
     *
     * <p>The message comes from the element's validationMessage property. An APEX extension allows specifying a
     * custom message, which overrides the element's validationMessage, by adding a custom attribute named
     * data-valid-message. If the item has this attribute then its value is returned if the item is not valid.
     * As the name implies, the text of the message should describe what is expected of valid input, rather than
     * what went wrong.</p>
     * @example
     * <caption>See the example for {@link item#getValidity} for an example of this function.</caption>
     * @param [pLabel] - Optional label to use in the message if the message contains a #LABEL# placeholder.
     *   This parameter is not often needed because in general the label for an item can be determined automatically.
     * @returns A validation message, if the item is not valid and empty string otherwise.
     */
    getValidationMessage(pLabel?: string): string;
    /**
     * <p>Returns the separator used by a multivalued item. It returns null when the separator is not applicable
     * (as it is for items that don't support multiple values) or cannot be customized,
     * in which case the default of ":" is used. See also {@link item#getMultiValueStorage}.</p>
     * @example
     * <caption>The following example creates a multivalued item and calls "getSeparator" function.</caption>
     * apex.item.create( "P1_ITEM", {
     *    storageType: "separated",
     *    separator: "~"
     * } );
     *
     * const separator = apex.item( "P1_ITEM" ).getSeparator(); // returns "~"
     * @returns separator character used to separate multiple values.
     * The separator is set when item is created.
     */
    getSeparator(): string | null;
    /**
     * <p>Returns the storage object of a multivalued item. This object has the properties
     * <code class="prettyprint">type</code> and <code class="prettyprint">separator</code>.</p>
     * <p>Valid values for <code class="prettyprint">type</code> are "separated" or "json-array".
     * See <code class="prettyprint">storageType</code> in {@link apex.item.create} for more information.</p>
     * <p>The property <code class="prettyprint">separator</code> is only available when
     * <code class="prettyprint">type</code> is "separated".
     * See <code class="prettyprint">separator</code> in {@link apex.item.create} for more information.</p>
     * <p>The function returns null when the storage type is not applicable
     * (as it is for items that don't support multiple values).</p>
     * @example
     * <caption>The following example creates a multivalued item and calls
     * "getMultiValueStorage" function.</caption>
     * apex.item.create( "P1_ITEM", {
     *    storageType: "separated",
     *    separator: "~"
     * } );
     *
     * const multiValueStorage = apex.item( "P1_ITEM" ).getMultiValueStorage(); // returns { type: "separated", separator: "~" }
     * @returns object describing storage of multiple values.
     */
    getMultiValueStorage(): any | null;
    /**
     * <p>Returns a promise that is resolved when the item is fully ready to use.
     * This function is only applicable to items that take extra time to load.
     * For example items that are implemented by libraries that load asynchronously including JET or other
     * libraries that use RequireJS. Items that are not delay loaded do not have this method.
     * In addition, it is only useful for code that runs as, or soon after, the page loads. It is not needed
     * in code called from dynamic actions because all dynamic action page load processing waits until
     * after all items are loaded.</p>
     * <p>See also {@link item#isReady} and the <code class="prettyprint">delayLoading</code> property of
     * {@link apex.item.create}.</p>
     * @example
     * <caption>This example sets the value of an item after it is loaded.</caption>
     * var theItem = apex.item( "P1_ITEM" );
     * theItem.whenReady().then( function() {
     *     theItem.setValue( "Some Value" );
     * } );
     */
    whenReady(): Promise<any>;
}

declare namespace Model {
    /**
     * This callback is used by the {@link model#forEach} and {@link model#forEachInPage} methods.
     * @param pRecord - The current record.
     * @param pIndex - The zero based index within the model collection of the current record.
     * @param pId - The identity of the current record if the model
     *   <code class="prettyprint">identityField</code> option is given. If there is no identity then this is
     *   undefined for tree models and is the <code class="prettyprint">pIndex</code> as a string for table models.
     * @param [pError] - If and only if there is an error fetching data during a call to
     *   {@link model#forEachInPage} this is the error object otherwise this is false or undefined.
     */
    type IteratorCallback = (pRecord: Model.Record, pIndex: number, pId: string, pError?: Error) => void;
    /**
     * Metadata properties that the model creates and uses. See {@link model#getRecordMetadata}.
     * @property deleted - true if the record has been deleted otherwise false or undefined.
     * @property inserted - true if the record is newly created and inserted/added to the collection otherwise false or undefined.
     * @property autoInserted - true if the record was auto inserted (these records are not saved if not also updated)
     * @property updated - true if the record has had any fields changed.
     * @property original - When updated is true this is the original record before any changes.
     * @property record - Reference to the record that this metadata is about.
     * @property parent - The parent record of this record. Only applies to tree shape models.
     * @property error - true if the record as a whole has an error.
     * @property warning - true if the record as a whole has a warning.
     * @property message - Only present when <code class="prettyprint">error</code>
     *     or <code class="prettyprint">warning</code> are true. Describes the error or warning condition.
     * @property sel - true if the record is selected and false otherwise. This property should not
     *     be changed except by view layers using the {@link model#setSelectionState} method.
     * @property highlight - A string that view layers can use to provide extra styling for the record.
     * @property disabled - true if the record is disabled. The model makes the disabled state available
     *     to the view layer. If selection state is kept in the model with {@link model#setSelectionState}
     *     disabled records will not be selected.
     *     Not all view layers will make use of this property.
     *     Typically, a view layer will not let disabled records be selected and may show them with
     *     different styles. Disabled state doesn't affect editing. However, a disabled record may also
     *     have <code class="prettyprint">allowedOperations</code> set to not allow editing or deleting.
     *     See {@link model#isDisabled} and {@link model#setDisabledState}.
     * @property hidden - true if the record should be hidden by view layers. The model makes the hidden
     *     state available to the view layer; it does not act on the hidden state at all. Not all view layers
     *     will make use of this property. Typically, a view layer will use CSS or some other means to make
     *     hidden records invisible. See {@link model#setHiddenState}.
     * @property allowedOperations.delete - true if the record can be deleted.
     * @property allowedOperations.update - true if the record can be updated.
     * @property canEdit - Derived from <code class="prettyprint">allowedOperations.update</code>
     * @property canDelete - Derived from <code class="prettyprint">allowedOperations.delete</code>
     * @property endControlBreak - Used by views to implement control break UI. The server sets this to
     *   true in the last record of each group of control break records.
     * @property agg - For aggregate records this is the name of the aggregate function.
     * @property grandTotal - For aggregate records this is true for the overall value (grand total) records.
     * @property fields - An object that maps from a field name to
     *     metadata about the field.
     */
    type RecordMetadata = {
        deleted: boolean;
        inserted: boolean;
        autoInserted: boolean;
        updated: boolean;
        original: Model.Record;
        record: Model.Record;
        parent: Model.Record;
        error: boolean;
        warning: boolean;
        message: string;
        sel: boolean;
        highlight: string;
        disabled: boolean;
        hidden: boolean;
        allowedOperations: {
            delete: boolean;
            update: boolean;
        };
        canEdit: boolean;
        canDelete: boolean;
        endControlBreak: boolean;
        agg: any;
        grandTotal: boolean;
        fields: {
            [key: string]: Model.RecordFieldMetadata;
        };
    };
    /**
     * Metadata related to a specific record field. You access the field metadata from the record metadata.
     * See {@link model#getRecordMetadata}
     * @property changed - true if the field has changed.
     * @property stale - true if the value of this field depends on other fields and those fields have changed
     *     and this field has not been recalculated.
     * @property error - true if the field has an error.
     * @property warning - true if the field has a warning.
     * @property message - Only present when <code class="prettyprint">error</code>
     *     or <code class="prettyprint">warning</code> are true. Describes the error or warning condition.
     * @property disabled - true if the field is disabled. Disabled fields are written to the server as empty string.
     * @property highlight - A string that view layers can use to provide extra styling for the field.
     * @property ck - A checksum. If present and not null indicates the record field is readonly.
     * @property url - Use for cells that are links. This is the link target. The cell value is the link label.
     */
    type RecordFieldMetadata = {
        changed: boolean;
        stale: boolean;
        error: boolean;
        warning: boolean;
        message: string;
        disabled: boolean;
        highlight: string;
        ck: string;
        url: string;
    };
    /**
     * <p>Information about an observer for subscribing to this model. See {@link model#subscribe} and
     * {@link model#unSubscribe}.</p>
     * @property [viewId] - A unique key that can be used to unsubscribe.
     *     A DOM element id makes a good unique key.
     * @property onChange - A function to receive change notifications. The signature is
     *     <code class="prettyprint">function(changeType, change)</code><br>
     *     <code class="prettyprint">changeType</code> is a string describing the change such as "delete"<br>
     *     <code class="prettyprint">change</code> is an object with details about the change.<br>
     *     See each notification for details.
     * @property [progressView] - jQuery object to center a progress spinner over while performing an
     *     asynchronous network operation such as {@link model#fetch} or {@link model#save}.
     * @property [progressOptions] - Options object for {@link apex.util.showSpinner}.
     */
    type Observer = {
        viewId?: string;
        onChange: (...params: any[]) => any;
        progressView?: jQuery;
        progressOptions?: any;
    };
    /**
     * <p>A model is uniquely identified by a string name and optional string instance id. The instance id is used to
     * support multiple detail models in a master detail arrangement. The instance id is the identity value of the
     * record in the master model for which the detail model pertains. The form for a model id is "name" or a
     * tuple array ["name","instance"]</p>
     * @example
     * <caption>A model with no instance.</caption>
     * "MyModel"
     * @example
     * <caption>A detail model with instance id "000109".</caption>
     * ["MyDetailModel", "000109"]
     */
    type ModelId = string | any[];
    /**
     * A model record is either an array or an object depending on the model option <code class="prettyprint">recordIsArray</code>.
     */
    type Record = any[] | any;
    /**
     * A model node is a synonym for {@link Model.Record} that is more naturally used when the model has a tree shape.
     */
    type Node = any[] | any;
    /**
     * The field metadata describes the field and affects how the model uses the field. It may contain additional
     * properties especially if the metadata is shared with view layers.
     * @property index - Only used when records are arrays. This is the index into the array where the field
     *   value is stored.
     * @property controlBreakIndex - Indicates that the field is used as a control break and provides
     *   the order in which this field is sorted for that purpose. Starting at 1.
     *   The server is responsible for sorting the data. The view layer may provide additional configuration to
     *   control sorting. The end result is that the data is sorted so that all the records with the same
     *   control break column values ordered by <code class="prettyprint">controlBreakIndex</code> are
     *   grouped together. The server must also set the record metadata property
     *   <code class="prettyprint">endControlBreak</code>. See {@link Model.RecordMetadata}.
     *   This field property can change after the model is initialized but doesn't take effect until after
     *   the model data is cleared with {@link model#clearData}.
     * @property defaultValue - This value is used when a new record is added or an existing record is duplicated
     *   and <code class="prettyprint">noCopy</code> is true.
     *   The defaultValue has no effect for the identity, meta, children, and parent fields if defined.
     *   If there is no defaultValue empty string is used.
     *   If defaultValue is a function it is called and the return value is used as the field's value. The function
     *   is passed the model. If the new record is a copy of an existing record the source record is also passed in.
     * @property dataType - The data type of the field value.
     * @property calcValue - This is a function used to calculate the value for the field. When any of the
     *   fields listed in the <code class="prettyprint">dependsOn</code> property change this function is called.
     *   The function signature is <code class="prettyprint">calcValue( argsArray, model, record ) return *</code>.
     *   The values of the fields listed in <code class="prettyprint">dependsOn</code> are passed
     *   in the <code>argsArray</code>. This function is also called when a record is received from the server and
     *   the value of this field is null or undefined.
     * @property dependsOn - An array of field names from this model that this field depends on.
     *   When any of the fields named in this array change then this field is either marked stale or if there is
     *   a <code class="prettyprint">calcValue</code> function the <code class="prettyprint">calcValue</code>
     *   function is called to recalculate the value of this field.
     * @property aggregates - An array of aggregate function names. The built-in aggregate function names
     *     are: "COUNT", "COUNT_DISTINCT", "SUM", "AVG", "MIN", "MAX", "MEDIAN".
     * @property parentField - Only applies if the model has a parentModel. When a new record is added or an existing record is
     *   duplicated and noCopy is true the value of this field is taken from the parentField of the parentModel
     *   This is useful for foreign key fields but can be any field that gets a default from the parentModel.
     * @property noCopy - If true the field value is not copied when a record is copied/duplicated.
     * @property readonly - If true the field cannot be edited.
     * @property volatile - The field is generated by the server. It cannot be edited. It is not sent back to the server. This means
     *   that for records stored as arrays the volatile fields should be at the end or the server must account
     *   for the missing volatile fields when using other field's index. Volatile fields may depend on (are calculated
     *   from) other fields and the value may be considered stale if the record is edited. It is up to the view
     *   layers to make this determination.
     * @property virtual - A virtual field has no associated data. None of the other properties apply. The main purpose for
     *   including a virtual field is so that view layers and the model can share the same field metadata.
     *   This allows view layers to have fields that don't have corresponding data in the model.
     */
    type FieldMeta = {
        index: string;
        controlBreakIndex: number;
        defaultValue: any;
        dataType: string;
        calcValue: (...params: any[]) => any;
        dependsOn: any[];
        aggregates: any[];
        parentField: string;
        noCopy: boolean;
        readonly: boolean;
        volatile: boolean;
        virtual: boolean;
    };
    /**
     * <p>A callback function to do additional access checking. See the <code class="prettyprint">check</code>
     * option property of {@link apex.model.create} and the {@link model#check} method.</p>
     * @param pResult - The result of the access checking so far.
     * @param pOperation - One of the default checks ("canEdit", "canDelete", "canAdd", "canDrag") or a custom
     *   operation.
     * @param pRecord - The record to check if action is allowed on it.
     * @param [pAddAction] - Only used by allowAdd see {@link model#allowAdd} for details.
     * @param [pRecordsToAdd] - Only used by allowAdd see {@link model#allowAdd} for details.
     */
    type CheckCallback = (pResult: boolean, pOperation: string, pRecord: Model.Record, pAddAction?: string, pRecordsToAdd?: Model.Record[]) => boolean;
}

/**
 * <p>A model holds data in memory for use by the UI layer. It corresponds to the view-model in the Model-View-ViewModel
 * (MVVM) pattern. The UI can both read and write the data.
 * A model can notify interested parties (subscribers) when the data changes. The data comes (is fetched) from
 * the server and updates can be written back (saved) to the server.</p>
 *
 * <p>Models are created and managed with functions of the {@link apex.model} namespace.
 * A model is uniquely identified by a {@link Model.ModelId}, which is a string name and optional string instance id.</p>
 *
 * <p>A model can hold data of different shapes. They are:</p>
 * <ul>
 * <li>table: The data is an ordered collection of records. In database or UI terms the record might be called a row.
 *    See {@link Model.Record}.</li>
 * <li>tree: The data is a single root record and each record including the root can have an ordered collection of
 *    any number of child records. When dealing with trees it is common to call the records nodes. See {@link Model.Node}.</li>
 * <li>record: The data is a single record. In some cases this is treated as a collection of one.</li>
 * </ul>
 *
 * <p>Each record can have any number of named fields. See {@link Model.Record}. All records in the collection must have
 * the same set of fields although the value of some fields may be null. In database or UI terms the fields
 * might be called columns. The actual storage of a record could be an object or an array. If records are objects then the
 * fields of the record are the properties of the object. If the records are arrays the fields of the record are
 * elements of the array and the {@link Model.FieldMeta} <code class="prettyprint">index</code> property is used to
 * map from the field name to the record array index.</p>
 *
 * <p>The model has very few restrictions on the values of fields.
 * However typically when the model data is backing APEX items or HTML form controls the values will all be strings.
 * The model optionally uses the following fields for specific purposes:</p>
 * <ul>
 * <li>identity: A string value that uniquely identifies the record. There can be multiple identity fields.
 *      Required for editable models. See {@link apex.model.create} option <code class="prettyprint">identityField</code>.</li>
 * <li>meta: An object with additional metadata about the record. See {@link apex.model.create} option <code class="prettyprint">metaField</code>.</li>
 * <li>children: (tree shape only) An array of the child records (nodes). See {@link apex.model.create} option <code class="prettyprint">childrenField</code>.</li>
 * <li>parent identity: (tree shape only) A string value that identifies the parent record (node) of this record (node).
 *      Required for editable tree shaped models. See {@link apex.model.create} option <code class="prettyprint">parentIdentityField</code>.</li>
 * </ul>
 *
 * <p>Another special case is for field values that have a display value in addition to their intrinsic value. These
 * composite values have the form: <code class="prettyprint">{ d: "<em>display value</em>", v: <em>value</em> }</code>
 * When comparing values during {@link model#setValue} only the value is considered not the display value.
 * Also, when the changes are saved to the server just the value is included without being wrapped
 * in an object. Other special fields such as identity or parent etc. cannot have this structure.</p>
 *
 * <h3>Control Breaks:</h3>
 * <p>A table shape model can facilitate view layer presentation of control breaks by keeping track of the
 * control break values and the boundary between the control breaks. The data must be pre-sorted by the control
 * break field values according to {@link Model.FieldMeta} property <code class="prettyprint">controlBreakIndex</code>
 * and the last record in each control break must have the {@link Model.RecordMetadata} property
 * <code class="prettyprint">endControlBreak</code> set to true.
 *
 * <h3>Aggregations:</h3>
 * <p>A table shape model can contain aggregate information. Aggregations are just records that the server
 * includes in order among all the other records marked with metadata
 * property <code class="prettyprint">agg: "<em>AggregateFunctionName</em>"</code>. Aggregate records can also
 * be created by the model when fields have {@link Model.FieldMeta} property
 * <code class="prettyprint">aggregates</code> defined.
 * The aggregate record has most fields empty except for the aggregate fields that contain the aggregate value.
 * The results of each different aggregate function is in a separate record.</p>
 *
 * <h3>Ajax Messages:</h3>
 * <p>This section defines the JSON content of the Ajax requests the model sends to the server and the responses
 * it expects back. This information is useful when creating a plug-in that uses the model.</p>
 *
 * <p>All the requests and responses use the regions array structure shown in {@link apex.server.plugin}. The top
 * level object contains a property called "regions" which is an array of region objects. Each region object,
 * in both the request and response, contains the "id" (region id) and "ajaxIdentifier" associated with the
 * region plug-in. The rest of the region object content depends on the type of request.</p>
 *
 * <pre class="prettyprint"><code>{
 *     "regions": [ {
 *        "id": <em>region-id-or-static-id</em>,
 *        "ajaxIdentifier": <em>ajaxIdentifier</em>,
 *        // model create option regionData is merged here
 *        // method specific properties go here
 *     }, ...]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetch} request:</h4>
 * <p>Model shape table:</p>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "firstRow": <em>n</em>, // one based
 *     "maxRows": <em>n</em>, // null if paginationType is "none"
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 * <p>Model shape tree or record:</p>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetch} response:</h4>
 * <p>Model shape table:</p>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "values": [<em>record</em>, ...],
 *     "firstRow": <em>n</em>, // one based
 *     "moreData": <em>true|false</em>, // true if there are more records on the server and false otherwise
 *     "dataOverflow": <em>true|false</em>, // optional, true if the server has more data than can be returned
 *         // even with pagination. When this is true the totalRows should reflect what the server is willing
 *         // to return not the total number of rows in the database.
 *     "totalRows": <em>n</em> // only required when option hasTotalRecords is true
 * }
 * </code></pre>
 * <p>Model shape tree:</p>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "root": <em>node</em>
 * }
 * </code></pre>
 * <p>Model shape record:</p>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "value": <em>record</em>
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchRecords} request:</h4>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "primaryKeys": [<em>key</em>, ...] // a key is { "recordId": <em>stringId</em>, "pk": [<em>identityValue</em>, ...] }
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchRecords} response:</h4>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "values": [<em>record</em>, ...]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#save} request:</h4>
 * <pre class="prettyprint"><code>"saveData": {
 *     "models": [
 *         {
 *             "version": <em>version</em> // model create option version
 *             "instance": <em>modelInstance</em>, // model instance or null
 *             "values": [<em>record</em>, ...] // meta column contains "op": <em>i|u|d</em> for operation insert, update, delete
 *                 // Note additional properties in the meta column are not yet formally defined
 *                 // inserted records have identityField values set to "".
 *             // model create option saveData is merged here
 *         }, ... // when saving a master model there can be additional detail models
 *     ]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#save} response:</h4>
 * <pre class="prettyprint"><code>"fetchedData": {
 *     models: [
 *         {
 *             "values": [<em>record</em>, ...], // records updated or inserted are returned
 *         }, ... // when saving a master model there can be additional detail models
 *     ]
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchChildNodes} request:</h4>
 * <pre class="prettyprint"><code>"fetchData": {
 *     "parentId": [<em>identityValue</em>, ...], // an array of identity field values or null
 *     "version": <em>version</em> // model create option version
 *     // model create option fetchData is merged here
 * }
 * </code></pre>
 *
 * <h4>Method {@link model#fetchChildNodes} response:</h4>
 * When parentId in the request is null the response contains the whole tree:
 * <pre class="prettyprint"><code>"fetchedData": {
 *     "root": <em>node</em>
 * }
 * </code></pre>
 * When parentId is given in the request the response contains an array of child nodes:
 * <pre class="prettyprint"><code>"fetchedData": {
 *     <em>childrenField</em>: [<em>node</em>, ...]
 * }
 * </code></pre>
 * @example
 * <caption>Models are typically used by advanced UI controls (views) to display, interact with, and edit data.
 * The following is a high level sketch of how a UI control might use a table shape model. </caption>
 * // The widget can create the model during widget initialization
 * this.model = apex.model.create( modelName, options, initialData, ... );
 *
 * // Or it can be configured with the name of a model that already exists and get a reference to it
 * this.model = apex.model.get( modelName );
 *
 * // In either case subscribe to model notifications
 * this.modelViewId = this.model.subscribe( {
 *     onChange: modelNotificationFunction,
 * } );
 *
 * // During create or when the widget is refreshed it should render data from the model
 * // this.pageOffset starts at 0. When the user changes pages or additional page data is needed, run this code again.
 * // The model fetches more data from the server as needed.
 * var count = 0;
 * this.model.forEachInPage( this.pageOffset, pageSize, function( record, index, id ) {
 *     if ( record ) {
 *         // render the row record
 *         count += 1;
 *     }
 *     if ( count === pageSize || !record ) {
 *         // done rendering this page of records
 *     }
 * } );
 *
 * // When settings change that affect the data such as changing the sort order or applying a filter
 * // the new sort order or filter information can be communicated to the server in the model fetchData or
 * // regionData option or it can be sent in a separate Ajax request.
 * this.model.clearData();
 *
 * // Clearing the data will result in a refresh notification. The modelNotificationFunction should
 * this.pageOffset = 0;
 * // call the above forEachInPage code to fetch and render the new data.
 *
 * // When the widget is destroyed it needs to release the model
 * this.model.unSubscribe( this.modelViewId );
 * this.model.release( modelName );
 */
declare interface model {
    /**
     * Return the model id for this model.
     */
    modelId(): Model.ModelId;
    /**
     * <p>Retrieve model data from the server. Data is requested starting at the given offset (or 0 if offset is
     * not given). Data is fetched in model option <code class="prettyprint">pageSize</code> chunks.
     * Can use either the callback argument or the returned promise to determine when the request is complete.</p>
     * @param [pOffset] - Zero based offset of the data to fetch. Only applies to table shape
     *                           models. This is rarely needed because table data is automatically fetched as
     *                           needed when requested via the {@link model#forEachInPage} method.
     *                           Omit this parameter when not needed.
     * @param [pCallback] - A function to call when the request is complete. The callback is passed an
     *                           Error argument only if there is an error.
     * @param [pNoProgress] - Set to true to not show progress during the fetch.
     * @returns A promise if the fetch is initiated, null if there is already a fetch in progress,
     * and false if <code class="prettyprint">pOffset</code> is beyond the end of the data or master record is
     * inserted or deleted or if <code class="prettyprint">pOffset</code> != 0
     * when <code class="prettyprint">paginationType</code> is "none".
     * If and only if a promise is returned, <code class="prettyprint">pCallback</code> will be called.
     * It receives no arguments when resolved and an <code class="prettyprint">Error</code> argument when rejected.
     */
    fetch(pOffset?: number, pCallback?: (...params: any[]) => any, pNoProgress?: boolean): Promise<any>;
    /**
     * <p>Fetch all the data from the server into the model. This repeatedly calls {@link model#fetch} until the
     * server reports there is no more data. This is only for table shape models.
     * Data is fetched in chunks that may be larger than model option <code class="prettyprint">pageSize</code>.
     * Since all the data is to be loaded the intent is to do so in fewer ajax requests.</p>
     * <p>Use with caution. Loading too much data onto the client can take a long time and cause the browser to
     * become unresponsive.</p>
     * @example
     * <caption>This example fetches all the data before using {@link model#forEach} to loop over the records.</caption>
     * model.fetchAll( function( status ) {
     *     if ( status.done ) {
     *         model.forEach( function( record, index, id ) {
     *             // do something with each record
     *         } );
     *     }
     * } );
     * @param pCallback - Function that is called after each fetch completes. It receives an object with properties:
     * <ul>
     *   <li>offset: the current offset in the model that was just added</li>
     *   <li>total: total records in the model (see {@link model#getTotalRecords})</li>
     *   <li>done: true if all the data is fetched false otherwise. When true this is the last time the callback is called.</li>
     * </ul>
     * @param [pNoProgress = true] - Set to false to show progress during fetch. Set to true
     *   to hide progress spinner during fetch. The default is true.
     */
    fetchAll(pCallback: (...params: any[]) => any, pNoProgress?: boolean): void;
    /**
     * <p>Fetches fresh data from the server for the given records. The existing records in the model are replaced
     * with the new returned record from the server. The model must have a <code class="prettyprint">identityField</code>
     * option defined for this to work.
     * Can use either the callback argument or the returned promise to determine when the request is complete.</p>
     * @example
     * <caption>This example fetches the selected records from interactive grid with static id "emp".
     * There is often no need know when the Ajax request completes because the view is updated from model
     * notifications.</caption>
     * var model = apex.region( "emp" ).call( "getCurrentView" );
     * model.fetchRecords( apex.region( "emp" ).call( "getSelectedRecords" );
     * @param pRecords - Array of records to be fetched.
     * @param [pCallback] - A function to call when the request is complete. The callback is passed an
     *  Error argument only if there is an error.
     * @returns A promise that receives no arguments when resolved and an Error argument when rejected.
     *  If there are no records to fetch then null is returned and <code class="prettyprint">pCallback</code> is not called.
     */
    fetchRecords(pRecords: Model.Record, pCallback?: (...params: any[]) => any): Promise<any>;
    /**
     * <p>Save all changed model data to the server. The current changes are copied to the save request except
     * that volatile fields are not included (they are omitted/deleted i.e. not null or undefined) and the metadata
     * has the <code class="prettyprint">op</code> property added with value "d" if the record was deleted,
     * "i" if the record was inserted, and "u" if the record was updated.
     * If the record has no metadata field defined then one is added. For array
     * records it is the last element, for object records it is property <code class="prettyprint">_meta</code>.</p>
     *
     * <p>It is possible to continue making changes to the model while a save is in progress.
     * Can use either the callback argument or the returned promise to determine when the request is complete.</p>
     *
     * <p>See also {@link apex.model.save}.</p>
     * @param [pCallback] - A function to call when the save request is complete.
     *                           callback( error, responseData );
     *                           The callback is passed an Error argument or array of server errors only
     *                           if there is an error. Otherwise, error is null.
     * @returns A promise if the save is initiated and null otherwise (there is already a save in progress or
     * there is nothing to save). If and only if a promise is returned, pCallback will be called. The promise receives no
     * arguments when resolved and an Error argument when rejected.
     */
    save(pCallback?: (...params: any[]) => any): Promise<any>;
    /**
     * Rarely needed. Only useful if making your own call to the server.
     * See {@link model#save}, {@link apex.model.addChangesToSaveRequest}, and {@link apex.model.save}.
     * @param pRequestData - An empty or partially filled in object to which changes for this model will be added.
     */
    addChangesToSaveRequest(pRequestData: any): void;
    /**
     * <p>Give the model data. This is used in cases where the model doesn't get data from the server or at least
     * not using the built-in mechanisms or when the model is created without any initial data.</p>
     * @param pData - Model data to set.
     * @param [pOffset] - Offset at which to add the data. Defaults to 0.
     *   If adding the root of a tree shape model set this to null;
     * @param [pTotal] - Total number of records in the server's collection. Only applies for
     *   table shape models.
     * @param [pMoreData] - If true there is more data available on the server for this model. If false
     *   <code class="prettyprint">pData</code> contains all the data. If omitted or null determine if there is more
     *   data based on <code class="prettyprint">pData</code> and <code class="prettyprint">pTotal</code>.
     *   If <code class="prettyprint">pTotal</code> is not given assume there is more data on server.
     *   Only applies for table shape models and only if
     *   <code class="prettyprint">paginationType</code> is not "none".
     */
    setData(pData: any[], pOffset?: number, pTotal?: number, pMoreData?: boolean): void;
    /**
     * <p>Remove all data from the model. This is called by view layers to indicate that the model should
     * be refreshed with new data from the server. The model sends a refresh notification and the views
     * respond by requesting new data with {@link model#fetch} or {@link model#forEachInPage}.
     * The <code class="prettyprint">delayClearData</code> option controls when the data is actually cleared.</p>
     * <p>When <code class="prettyprint">delayClearData</code> is false the data is cleared right away, before
     * the refresh notification is sent, and the view should remove the displayed data or block all interaction
     * with it, because there is no data backing it in the model.</p>
     * <p>When <code class="prettyprint">delayClearData</code> is true the data will be cleared when the
     * next {@link model#fetch} request completes. The view can continue to display the current data until fetch
     * completes. The model will not allow editing while clear data is pending.
     * </p>
     * @example
     * <caption>Clear the data for a model. This will typically cause any views to refresh, which results
     * in requesting new data from the model.</caption>
     * myModel.clearData();
     * @example
     * <caption>See example for {@link apex.model.multipleFetch}.</caption>
     * @param [pNotify] - If false don't send the refresh notification.
     *   The default is true to send the refresh notification.
     * @returns true for success and false if the model is not cleared because fetch or save
     *  requests are in progress.
     */
    clearData(pNotify?: boolean): boolean;
    /**
     * <p>Returns the total number of records in the model collection or -1 if unknown.</p>
     *
     * <p>For table shape models the total number of records may not be known or it may be an estimate.
     * If the pagination type is "none" then the total records is known and it is the same as what is
     * in the collection.
     * If the pagination type is "progressive" and the model has paged to the end (all pages
     * have been received and the server has said there is no more) then the total records is known and it
     * is the same as what is in the collection (which could be different from what is actually on the server).
     * If the server has told the model how many records it has then that is returned. This is an estimate of what
     * the client model may eventually hold. This value may change as new pages are fetched.
     * If the server has not told the model how many records it has then the total is unknown.
     * </p>
     * <p>For tree shape models the total number of nodes is only available when the model
     * defines the <code class="prettyprint">identityField</code> option. The total doesn't include nodes
     * that have not yet been fetched and never returns -1 (unknown) even if there are nodes that haven't been
     * fetched. If there is no <code class="prettyprint">identityField</code> this returns 0.
     * </p>
     * <p>For record shape the number is always 1 unless <code class="prettyprint">pCurrentTotal</code> is true
     * and there is no record in which case it returns 0.</p>
     *
     * <p>Note: Includes records that are marked for delete in the count.
     * Also includes aggregate records if any in the count.</p>
     * @param [pCurrentTotal] - If true, for table shape models will return the current total
     *   records in the collection rather than -1 if the total records is unknown.
     *   If true, for record shape models will return 0 if the record is null.
     * @returns The number of records or -1 if unknown.
     */
    getTotalRecords(pCurrentTotal?: boolean): number;
    /**
     * <p>Returns the total number of records from the server's perspective or -1 if unknown.</p>
     *
     * <p>For table shape models the server provides the total but for editable grids the number of inserted records
     * is added and the number of deleted records subtracted. This is so the number reflects what is likely
     * to be on the server after changes are saved.</p>
     *
     * <p>For tree shape models this is not supported; returns -1.</p>
     *
     * <p>For record shape models the number is always 1.</p>
     *
     * <p>Note: Aggregate records are never included.</p>
     * @returns The number of records or -1 if unknown.
     */
    getServerTotalRecords(): number;
    /**
     * <p>Return true if the number of records in the data set on the server exceeds some server
     * configured maximum. A server may put a limit on how much data it is willing to return. If
     * the amount of data requested exceeds this limit it will indicate that there is data overflow.
     * This method allows a UI layer to alert the user that there is more data than they can see.
     * Typically, the UI layer would allow filtering so that a reasonable amount of data is returned.</p>
     * @example
     * <caption>This example determines if there is data overflow.</caption>
     * let tooMuchData = model.getDataOverflow();
     * // tooMuchData is true if the server has indicated that it has more data than it is willing or able
     * // to return to the client.
     */
    getDataOverflow(): boolean;
    /**
     * <p>Iterate over the model collection. Calls <code class="prettyprint">pCallback</code> for each record in the model.
     * Similar to <code class="prettyprint">Array.prototype.forEach</code>. The model shape must be table or tree.
     * This will never fetch new data. This includes aggregate records if any.
     * For shape tree see also {@link model#walkTree}.</p>
     *
     * <p>The callback receives the record, the zero based index of the record, and the identity (recordId)
     * of the record.</p>
     * @example
     * <caption>This example calculates the total of field SALARY for all the records that are
     * currently in the model. Deleted and aggregate records are skipped.</caption>
     * var total = 0;
     * model.forEach( function( record, index, id ) {
     *     var salary = parseFloat( model.getValue( record, "SALARY" ) ),
     *         meta = model.getRecordMetadata( id );
     *
     *     if ( !isNaN( salary ) && !meta.deleted && !meta.agg ) {
     *         total += salary;
     *     }
     * } );
     * // do something with total
     * @param pCallback - Function called for each record in the model collection.
     *     The function is given the current record, index, and id.
     * @param [pThisArg] - Value to use as <code class="prettyprint">this</code>
     *     when calling <code class="prettyprint">pCallback</code>.
     */
    forEach(pCallback: Model.IteratorCallback, pThisArg?: any): void;
    /**
     * <p>Transform a copy of the table shape model data into another data structure according to the provided template rules.
     * The transformed output data structure is returned.</p>
     * @example
     * <caption>The following example generates groups and series data for a jet Bar chart from a model
     * created from:<br>
     *     select job, deptno, avg(sal) as avg_sal from emp group by job, deptno</caption>
     *
     * var data = mymodel.transform( {
     *              template: [ {
     *                      path: "groups",
     *                      uniqueIndexField: "DEPTNO",
     *                      item: { name: "DEPTNO" }
     *                  }, {
     *                      path: "series",
     *                      uniqueIndexField: "JOB",
     *                      item: { name: "JOB" }
     *                  }, {
     *                      path: "series/[JOB]/items",
     *                      item: { label: "'AVG_SAL'",
     *                              value: "AVG_SAL",
     *                              name: "DEPTNO"
     *                          }
     *                  } ]
     *              });
     * @param pOptions - An object with properties that define how the model data is to be transformed.
     *     All properties are optional except for template.
     * @param pOptions.template - An array of rule objects each one describing where and how to create an array
     *                           in the output data. Each rule object can have these properties:
     * @param pOptions.template.path - A "/" separated list of property names or indexed fields. The path specifies
     *      where in the output object structure to create an (or use existing) array to
     *      add items to. For example a path of "a/b" will result in output:
     *  <pre class="prettyprint"><code>
     *  {
     *      a: {
     *          b: [&lt;items go here>]
     *      }
     *  }
     *  </code></pre>
     *      <p>An indexed field is the name of a record field wrapped in square brackets.
     *      This creates an array for each unique value of the field. For example a path
     *      of "a/[ENABLED]/b" where the field ENABLED can have values of "yes" and "no" results in output:</p>
     *  <pre class="prettyprint"><code>
     *  {
     *      a: [
     *          {
     *              b: [&lt;items for records with enabled = yes go here>]
     *          },
     *          {
     *              b: [&lt;items for records with enabled = no go here>]
     *          }
     *      ]
     *  }
     *  </code></pre>
     * @param pOptions.template.filter - Filter function( model, record, index, id) return true to
     *     include and return false to skip the given record.
     * @param pOptions.template.uniqueIndexField - The name of a record field. If given an item will be added
     *     to the array only for the first record with a unique value of this field.
     * @param pOptions.template.item - An object, string, array or function that
     *     serves as a template for the elements/items of the output array the resulting value depends on the type:
     *     <ul>
     *         <li>string: A string is the name of a record field and the resulting value is the value of that field or
     *           if it begins and ends with a single quote then the value is the text inside the single quotes or
     *           if it begins with ( and ends with ) the string inside the parens is the
     *           name of a record field and the resulting value is the raw value of that field not the display value
     *           or <code class="prettyprint">showNullAs</code> value.</li>
     *         <li>function: The resulting value is the return value of the function
     *           f(pContext, self, record, index, id)</li>
     *         <li>object: the resulting value is a new object where the properties of the new object
     *           are the same as the properties of this template object and the value of
     *           the properties support the same options as item.</li>
     *         <li>array: The resulting value is a new array where the value items in the new array
     *           come from the template items in this array. The template items support the same
     *           options as item.</li>
     *     </ul>
     * @param pOptions.template.sort - A function suitable as the argument to
     *     <code class="prettyprint">Array.prototype.sort</code> that will sort the output array after all
     *     records are processed.
     * @param pOptions.filter - Filter function( model, record, index, id) return true to include and
     *     return false to skip the given record.
     * @param pOptions.showNullAs - A string to substitute for null field values.
     * @param pOptions.includeAggregates - If true aggregate records are included otherwise they are
     *     skipped this is done before the <code class="prettyprint">filter</code> function is called.
     * @param pOptions.offset - Offset index of first record to process defaults to 0.
     * @param pOptions.count - Count of records starting at <code class="prettyprint">offset</code>
     *    to process. Defaults to all the data currently in the model.
     * @param [pContext] - This is the output object to return with data arrays filled in based on the
     *    template rules. If pContext is not given an empty object is used as a starting point. All functions
     *    are called in the context of this object. Note: if the template rule(s) don't
     *    have a path then pContext can be an array.
     * @returns The output data structure. Same object as <code class="prettyprint">pContext</code> if it was given.
     */
    transform(pOptions: {
        template: {
            path: string;
            filter: (...params: any[]) => any;
            uniqueIndexField: string;
            item: any | any[] | string | ((...params: any[]) => any);
            sort: string;
        }[];
        filter: (...params: any[]) => any;
        showNullAs: string;
        includeAggregates: boolean;
        offset: number;
        count: number;
    }, pContext?: any): any;
    /**
     * <p>Iterate over a range (page) of the model collection. This is only valid for table shape models.
     * Calls <code class="prettyprint">pCallback</code> for <code class="prettyprint">pCount</code>
     * records in the collection starting at <code class="prettyprint">pOffset</code>.
     * If the model doesn't yet contain the requested records they will be fetched from the server
     * by calling {@link model#fetch}.</p>
     *
     * <p>The callback receives the record, the zero based index of the record, and the identity (recordId)
     * of the record. If the collection has fewer records than requested or if there is an error
     * fetching data from the server then <code class="prettyprint">pCallback</code> is called with a null record.
     * If there is an ajax error it is passed to the callback in the error parameter.
     * When more data needs to be fetched the last call before the fetch, has the error parameter
     * set to false. This gives the view layer a way to respond to the pause in rendering due to the
     * asynchronous ajax request.
     * </p>
     * @example
     * <caption>This example renders a <code class="prettyprint">pageSize</code> page of records
     *   starting at offset <code class="prettyprint">currentPageOffset</code>.</caption>
     * var count = 0,
     *     pageOffset = currentPageOffset;
     * model.forEachInPage( pageOffset, pageSize, function( record, index, id ) {
     *     if ( record ) {
     *         // render the record
     *         count += 1;
     *     }
     *     if ( count === pageSize || !record ) {
     *         // done rendering this page of records
     *     }
     * } );
     * @param pOffset - Zero based index to begin iterating.
     * @param pCount - The number of records to call <code class="prettyprint">pCallback</code> for.
     * @param pCallback - Function called for each record in the model collection.
     *     The function is given the current record, index, and id.
     * @param [pThisArg] - Value to use as <code class="prettyprint">this</code> when calling
     *     <code class="prettyprint">pCallback</code>.
     */
    forEachInPage(pOffset: number, pCount: number, pCallback: Model.IteratorCallback, pThisArg?: any): void;
    /**
     * <p>Return the index of the record within the collection. The collection may include aggregate records.
     * Useful because {@link model#forEachInPage} method takes a starting index/offset.</p>
     *
     * <p>Only applies to table and tree shape models. Throws an error if the model shape is record.
     * For tree shape models an identity field must be defined and
     * this returns the index of the node among its siblings.</p>
     * @param pRecord - The record to return the index of.
     * @returns The record index or -1 if not in collection or the root node of a tree shape model.
     */
    indexOf(pRecord: Model.Record): number;
    /**
     * <p>Return the record at the given index within the model collection. Only applies to table shape models.</p>
     * @example
     * <caption>This example returns the fifth record in the collection assuming it exists.</caption>
     * var record = model.recordAt(5);
     * @param index - The index of the record to return.
     * @returns The record or null if there is no record at the given index.
     */
    recordAt(index: number): Model.Record;
    /**
     * <p>Given a record return the unique identifier (id) for the record. The id is used in calls to
     * {@link model#getRecordMetadata} and {@link model#getRecord}. If the model has multiple
     * identity fields this returns a string representation of the combined fields.</p>
     * @example
     * <caption>This example gets the identity of record <code class="prettyprint">someRecord</code>
     *     and uses it to get the record metadata.</caption>
     * var id = model.getRecordId( someRecord ),
     *     meta = model.getRecordMetadata( id );
     * // use meta for something
     * @param pRecord - The record to get the id from.
     * @returns The record id or null if no identityField is defined.
     */
    getRecordId(pRecord: Model.Record): string;
    /**
     * <p>Return an opaque id that represents the control break that the record belongs to.</p>
     * @example
     * <caption>The following code checks if 2 records are in the same control break.</caption>
     * if ( model.getControlBreakId( rec1 ) === model.getControlBreakId( rec2 ) ) {
     *     console.log( "records are in the same control break." );
     * } else {
     *     console.log( "records are not in the same control break." );
     * }
     * @param pRecord - The record to get the control break id from.
     * @returns The control break id that the record belongs to or null if the model doesn't have
     *   any control break fields defined.
     */
    getControlBreakId(pRecord: Model.Record): string;
    /**
     * <p>Return true if any control break columns are configured.
     * See <code class="prettyprint">controlBreakIndex</code> property of {@link model.fieldMeta}.
     * </p>
     */
    hasControlBreaks(): boolean;
    /**
     * Return true if the given field name is an identity field and false otherwise.
     * @param pFieldName - Name of record field.
     */
    isIdentityField(pFieldName: string): boolean;
    /**
     * <p>Return the metadata object for the record given by the record id. This only applies to models that
     * define an identity field with option <code class="prettyprint">identityField</code>. From the
     * record metadata you access field metadata via the <code class="prettyprint">fields</code> property.
     * Note that a fields property doesn't exist if it has no metadata, so you have to check that it exists
     * before accessing or setting any of its properties, as shown in the second example.</p>
     *
     * <p>Upper layers can store information related to the record here. The metadata should be related to the
     * record itself and not the view of it.</p>
     *
     * <p>If any metadata property values are changed, call {@link model#metadataChanged} to notify any view
     * layer of the change if needed.</p>
     * @example
     * <caption>This example checks if the record <code class="prettyprint">someRecord</code>
     *     is updated.</caption>
     * var id = model.getRecordId( someRecord ),
     *     meta = model.getRecordMetadata( id );
     * if ( meta.updated ) {
     *     // do something related to the updated record
     * }
     * @example
     * <caption>This example, using the EMP table, sets the <code class="prettyprint">highlight</code>
     * property of the record or the SAL field based on conditions of the SAL and COMM values.
     * Note that the {@link grid} widget as used by the Interactive Grid region also uses the
     * <code class="prettyprint">highlight</code> property which could conflict with code such as this.
     * If used with Interactive Grid the code could check if there is already a highlight value or could turn
     * off the Interactive Grid highlight feature.
     * This function would be called from a model {@link Model.Observer} in response to
     * a "set" notification or possibly in response to a {@link apex.event:apexendrecordedit} event.
     * The page needs to have custom CSS rules for the "warn-comm" and "warn-sal" classes.</caption>
     * function updateRecordHighlights( model, record, id ) {
     *     var meta = model.getRecordMetadata( id ),
     *         // turn number strings into numbers
     *         sal = Number( model.getValue( record, "SAL" ) ) || 0,
     *         comm = Number( model.getValue( record, "COMM" ) ) || 0,
     *         // get SAL field metadata creating it if it doesn't already exist.
     *         salFieldMeta = apex.util.getNestedObject( meta, "fields.SAL" );
     *
     *     if ( sal > 5000 ) {
     *         salFieldMeta.highlight = "warn-sal";
     *     } else {
     *         salFieldMeta.highlight = null;
     *     }
     *     if ( comm > sal / 5 ) {
     *         meta.highlight = "warn-comm";
     *     } else {
     *         meta.highlight = null;
     *     }
     *     model.metadataChanged( id );
     * }
     * @param [pRecordId] - Value of the record's identity field or array of values of the record's
     *     identity fields or value returned by {@link model#getRecordId}. This can be omitted when the model
     *     shape is "record".
     * @returns Metadata object or null if there is no record associated with
     *     <code class="prettyprint">pRecordId</code>.
     */
    getRecordMetadata(pRecordId?: string | string[]): Model.RecordMetadata;
    /**
     * <p>Call this method if any properties of the metadata returned by {@link model#getRecordMetadata} are changed
     * external to this module. Most record or field metadata should not be changed externally. However, it may
     * be useful and reasonable to externally change metadata that comes from the records initially such as canEdit
     * or custom metadata properties.
     * The result of calling this method is sending a {@link model#event:metaChange} notification.</p>
     * @param pRecordId - Value of the record's identity field or array of values of the record's
     *     identity fields or value returned by {@link model#getRecordId}.
     * @param [pFieldName] - Name of record field that has a metadata change if any.
     * @param [pPropertyName] - Name of the metadata property that has changed.
     *      If multiple properties changed this can be a comma separated list.
     */
    metadataChanged(pRecordId: string, pFieldName?: string, pPropertyName?: string): void;
    /**
     * <p>Return metadata object for given field name. The field metadata is supplied when the model is created
     * in option property <code class="prettyprint">fields</code>.</p>
     * @param pFieldName - The field name.
     * @returns Metadata object or null if there is no such field.
     */
    getFieldMetadata(pFieldName: string): Model.FieldMeta;
    /**
     * <p>Return the index/key to use for the given field name when accessing that field of a record.
     * Use the value returned from this method to access a record field without using {@link model#getValue}.
     * This will work regardless of if the records are stored as objects or arrays.</p>
     * @example
     * <caption>This example gets the field key for the model field named "COST" and uses it
     * in a loop over array of records <code class="prettyprint">selectedRecords</code>.</caption>
     * var i, cost,
     *     costKey = model.getFieldKey("COST");
     * for ( i = 0; i < selectedRecords.length; i++ ) {
     *     cost = selectedRecords[i][costKey];
     *     // do something with cost
     * }
     * @param pFieldName - The field name.
     * @returns returns undefined if the field doesn't exist or is virtual
     */
    getFieldKey(pFieldName: string): string | number | undefined;
    /**
     * <p>Determine if the model has been changed in any way. See also {@link model#getChanges}.</p>
     *
     * <p>Note: Auto inserted records don't count as changes unless they are also updated, but
     * they are returned by {@link model#getChanges}.</p>
     * @example
     * <caption>This example logs a console message if the model has changed.</caption>
     * if ( model.isChanged() ) {
     *     console.log("Model has changes.");
     * }
     * @returns true if the model has changed and false otherwise.
     */
    isChanged(): boolean;
    /**
     * <p>Return an array of record metadata for all changed records.
     * Do not make any changes to the data structure returned. See also {@link model#isChanged}.</p>
     * @example
     * <caption>This example logs a console message if the model has changed that includes the number of changes.</caption>
     * if ( model.isChanged() ) {
     *     console.log("Model has " + model.getChanges().length + " changes.");
     * }
     * @returns Array of record metadata for changed records.
     */
    getChanges(): Model.RecordMetadata[];
    /**
     * This marks the model as not having any changes. All change indications will be removed.
     * If any record deletes are pending they will be removed by this method. This does not revert or undo the
     * changes but rather removes all metadata that is tracking changes. This happens implicitly after the model
     * is saved (See {@link model#save}). Use this method if changes are persisted in some other way or the
     * changes should be discarded before refreshing the model.
     * <p>See also {@link model#revertRecords} and option {@link model#trackChanges}.</p>
     * @example
     * <caption>This example clears all the changes of an interactive grid with static id "emp"
     * in response to a Cancel or Abort button being pressed by the user.
     * Use in an Execute JavaScript Code dynamic action.
     * If not for the call to <code class="prettyprint">clearChanges</code>
     * before <code class="prettyprint">refresh</code>
     * the interactive grid would prompt the user to save changes.</caption>
     * var ig$ = apex.region( "emp" ).widget(),
     *     view = ig$.interactiveGrid( "getCurrentView" );
     * if ( view.supports.edit ) {
     *     // leave edit mode so that the column items will be reinitialized
     *     ig$.interactiveGrid( "getActions" ).set( "edit", false );
     *     view.model.clearChanges();
     * }
     * apex.region("emp").refresh();
     */
    clearChanges(): void;
    /**
     * <p>Return true if the model has any errors.</p>
     * @example
     * <caption>This example logs a console message if the model has errors.</caption>
     * if ( model.hasErrors() ) {
     *     console.log("Model has errors.");
     * }
     * @returns true if model has errors and false otherwise.
     */
    hasErrors(): boolean;
    /**
     * <p>Return an array of record metadata for all records with errors.
     * Do not make any changes to the data structure returned.</p>
     * @returns Array of record metadata for error records.
     */
    getErrors(): Model.RecordMetadata[];
    /**
     * <p>Set the <code class="prettyprint">hidden</code> property of the {@link model#getRecordMetadata}
     * for the record given by pRecordId. This is a convenience method that looks up the record metadata,
     * sets the hidden property, and calls the {@link model#metadataChanged} method if the value changed.</p>
     * @param pRecordId - The record id to set the hidden state on.
     * @param pHidden - The new hidden state to set.
     */
    setHiddenState(pRecordId: string | string[], pHidden: boolean | null): void;
    /**
     * <p>Update the visibility of all records currently in the model by calling the
     * <code class="prettyprint">visibilityFilter</code> function and setting
     * the record <code class="prettyprint">hidden</code> metadata property for each record.
     * Useful for client side filtering of views of table or tree shaped models. This method does nothing if
     * the <code class="prettyprint">visibilityFilter</code> or
     * <code class="prettyprint">visibilityFilterContext</code> options are not set.</p>
     *
     * <p>Client side filtering works best for reasonable sized reports and when the model has all the
     * data to filter on. Not all view layer components will make use of the hidden property. For those
     * that do it may only work if the view has rendered all the data.</p>
     *
     * <p>See also {@link model#setHiddenState} and the <code class="prettyprint">visibilityFilter</code>
     * and <code class="prettyprint">visibilityFilterContext</code> options of {@link apex.model.create}.</p>
     * @example
     * <caption>The following example filters a Cards region with static id "people" using
     * Text Field item P1_FILTER as the user types with a 200ms delay.</caption>
     * var filterItem = apex.item("P1_FILTER"),
     *     lastFilterString = null,
     *     filterContext = {
     *         matchString: ""
     *     };
     *
     * function myFilter( model, record, context ) {
     *     var match = false;
     *     // match record against context.matchString and return true if there is a match
     *     return match;
     * };
     *
     * function checkFilter() {
     *     var value = filterItem.getValue();
     *
     *     if ( value !== lastFilterString ) {
     *         // only filter if the value has changed and don't do it too often
     *         debounceFilterCards( value );
     *         lastFilterString = value;
     *     }
     * };
     *
     * function filterCards( filterString ) {
     *     var model = apex.region( "people" ).call( "getModel" );
     *     filterContext.matchString = filterString.toUpperCase(); // toUpperCase typical for case independent compare
     *     model.updateVisibility( filterContext );
     * };
     * var debounceFilterCards = apex.util.debounce( filterCards, 200 );
     *
     * // these options could instead be set in region Initialization JavaScript Function
     * var model = apex.region( "people" ).call( "getModel" );
     *     model.setOption( "visibilityFilter", myFilter );
     *     model.setOption( "visibilityFilterContext", filterContext );
     *
     * filterItem.element.on( "input", function() {
     *     checkFilter();
     * } );
     * checkFilter();
     * @param [pVisibilityContext] - If present, the <code class="prettyprint">visibilityFilterContext</code>
     *   option is set to this value. If omitted the current <code class="prettyprint">visibilityFilterContext</code>
     *   is used.
     */
    updateVisibility(pVisibilityContext?: any): void;
    /**
     * <p>Set the <code class="prettyprint">disabled</code> property of the {@link Model.RecordMetadata}
     * for the record given by pRecordId. This sets the <code class="prettyprint">disabled</code> property,
     * and calls the {@link model#metadataChanged} method if the value changed.</p>
     * @param pRecordId - The record id to set the disabled state on.
     * @param pDisabled - The new disabled state to set.
     */
    setDisabledState(pRecordId: string | string[], pDisabled: boolean | null): void;
    /**
     * <p>Select or unselect the given record. Should only be used with table shape models.</p>
     *
     * <p>This method should only be used by view widgets to persist the view selection state in metadata property
     * <code class="prettyprint">sel</code>.
     * Note there is no notification about this metadata change. Listen to the view for selection change events.
     * Also use the view to change the selection.</p>
     * @param pRecordId - The record id to set the selection state metadata.
     * @param pSelected - The desired record selection state; true to select and false to unselect.
     * @param [pAction] - Selection action. One of: "all", "set", "range", "anchor", or "toggle".
     *   Default is "set". For "all" and "anchor", pSelected is not used. For "all" pRecordId is not used.
     */
    setSelectionState(pRecordId: string | string[], pSelected: boolean, pAction?: string): void;
    /**
     * <p>Unselect all the selected records. Should only be used with table shape models.
     * See also {@link model#setSelectionState}.</p>
     *
     * <p>This method should only be used by view widgets to persist the view selection state in metadata property
     * <code class="prettyprint">sel</code>.
     * Note there is no notification about this metadata change. Listen to the view for selection change events.
     * Also use the view to change the selection.</p>
     */
    clearSelection(): void;
    /**
     * <p>Return the number of currently selected records. This only applies if a view is storing selection state
     * in the model. The selection may be incomplete if the model hasn't fetched all the data yet.
     * The {@link model#getSelectionState} method is used to tell if the selection is incomplete.</p>
     * <p>This is used by views that store view selection state in the model to return the selection count.</p>
     * @returns The number of selected records.
     */
    getSelectedCount(): number;
    /**
     * <p>Return an array of the selected records. This only applies if a view is storing selection state
     * in the model. The selection may be incomplete if the model hasn't fetched all the data yet.
     * The {@link model#getSelectionState} method is used to tell if the selection is incomplete.</p>
     * <p>This is used by views that store view selection state in the model to return the selection.
     * It is generally best to get the selected records from the view layer.</p>
     * @returns The selected records.
     */
    getSelectedRecords(): Model.Record[];
    /**
     * <p>Returns an object with information about the selection state stored in the model.</p>
     * <p>This method should only be used by view widgets that persist the view selection state in the model.
     * @returns The returned object has these properties:</p>
     * <ul>
     *     <li>incomplete: true if the intended selection includes records that have not yet been loaded
     *     into the model.</p>
     * </ul>
     */
    getSelectionState(): any;
    /**
     * Determine if the given record can be edited.
     *
     * <p>For a record to be editable:</p>
     * <ul>
     * <li>the model must have the <code class="prettyprint">editable</code> option set to true and</li>
     * <li>the type of the record must allow edit or</li>
     * <li>if the record has no type or doesn't specify if it can be edited the default type must allow edit</li>
     * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback
     *   function it must allow or deny the edit</li>
     * </ul>
     * @example
     * <caption>This example checks if editing is allowed before setting a value.</caption>
     * if ( myModel.allowEdit( record ) ) {
     *     myModel.setValue( record, "NAME", newName );
     * }
     * @param pRecord - The record to check if editing is allowed.
     * @returns true if the record can be edited.
     */
    allowEdit(pRecord: Model.Record): boolean;
    /**
     * Determine if the given record can be deleted.
     *
     * <p>For a record to be deletable:</p>
     * <ul>
     * <li>the shape must not be record</li>
     * <li>if the shape is a tree the record must not be the root record</li>
     * <li>the model must have the <code class="prettyprint">editable</code> option set to true</li>
     * <li>if the shape is a tree all the descendant nodes must also be deletable according to the following</li>
     * <li>the type of the record must allow "delete" or</li>
     * <li>if the record has no type or doesn't specify if it can be deleted the default type must allow "delete"</li>
     * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback
     *   function it must allow or deny the "delete"</li>
     * </ul>
     * @example
     * <caption>This example checks if deleting is allowed before deleting a record.</caption>
     * if ( myModel.allowDelete( record ) ) {
     *     myModel.deleteRecords( [record] );
     * }
     * @param pRecord - The record to check if deleting is allowed.
     * @returns true if the record can be deleted.
     */
    allowDelete(pRecord: Model.Record): boolean;
    /**
     * Determine if any record or one or more specific records can be added to the table collection or, for trees,
     * the parent record's children collection.
     *
     * <p>For any record or one or more specific records to be addable:</p>
     * <ul>
     * <li>the shape must not be record and</li>
     * <li>if the shape is a tree the parent record is required and must have a children collection</li>
     * <li>the model must have the <code class="prettyprint">editable</code> option set to true and</li>
     * <li>if the shape is tree the type of the parent record must allow "add" or</li>
     * <li>if the shape is table or the parent record has no type or doesn't specify if it allows "add" the
     * default type must allow "add"</li>
     * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback function
     *   it must allow or deny the "add"</li>
     * <li>then, for tree shape only, if adding is allowed and <code class="prettyprint">pRecordsToAdd</code>
     *   is given then check if the type of each record to add is a valid child type for the parent using
     *   validChildren type property.</li>
     * </ul>
     * @example
     * <caption>This example checks if adding is allowed before inserting a record.</caption>
     * if ( myModel.allowAdd() ) {
     *     myModel.insertNewRecord();
     * }
     * @param [pParentRecord] - The parent record to add children to if the shape is tree,
     *  null if the shape is table.
     * @param [pAddAction] - Specifies how/why the records are to be added.
     *  Standard values are "new", "move", or "copy".
     * @param [pRecordsToAdd] - An array of the records to be added. Only used for tree shape models.
     * @returns true if add is allowed.
     */
    allowAdd(pParentRecord?: Model.Record, pAddAction?: string, pRecordsToAdd?: Model.Record[]): boolean;
    /**
     * Determine if a record can be dragged.
     * Note this is just a check to see if the dragging can start. What is allowed on drop (move, copy etc.)
     * is a separate check.
     *
     * <p>For a record to be draggable:</p>
     * <ul>
     * <li>the shape must not be record and</li>
     * <li>the model must have the <code class="prettyprint">editable</code> option set to true and</li>
     * <li>the type of the record must allow drag or</li>
     * <li>if the record has no type or doesn't specify if it can be dragged the default type must allow drag</li>
     * <li>and if the model specifies an additional <code class="prettyprint">check</code> callback function
     *   it must allow or deny the drag</li>
     * </ul>
     * @param pRecord - The record to check if it can be dragged.
     * @returns true if the record can be dragged.
     */
    allowDrag(pRecord: Model.Record): boolean;
    /**
     * <p>Determine what drag operations are allowed for a set of records. Not all views support dragging.
     * Dragging is a view operation. The model provides this method simply to allow type based configuration
     * of available drag operations. Note: The model types option is not currently documented and may change
     * in the future.</p>
     * @param pRecords - array of records to determine drag operations for or null when dragging
     *     an external record into this model.
     * @returns object with allowed drag operations. The properties are: "normal", "ctrl", "alt", "shift", "meta".
     *     The standard values are "move", "copy" or "add". Other values are allowed. The normal property is required.
     *     The default is: <code class="prettyprint">{ normal: "move", ctrl: "copy" }</code>
     *     or if <code class="prettyprint">pRecords</code> is null <code class="prettyprint">{ normal: "add" }</code>
     */
    dragOperations(pRecords: Model.Record[]): any;
    /**
     * <p>Low level operation permission checking. Better to use {@link model#allowEdit}, {@link model#allowDelete},
     * {@link model#allowAdd}, {@link model#allowDrag}.
     * The purpose is to determine what kinds of edits are allowed.</p>
     *
     * <p>If the model is not editable (editable option is false) then no operations are allowed.
     * Also, no operations are allowed on deleted records or aggregate records. No operations are
     * allowed when the {@link model#event:refresh} notification <code class="prettyprint">clearDataPending</code>
     * property is true until the next fetch completes.</p>
     *
     * <p>Operation checking is based on the type of the record (as determined by the type field) and the type
     * information given to the model in the types option. Type names are strings. The special type name
     * "default" is used to provide a default when records don't have a type or the type of the record doesn't
     * specify a value for the operation. Note: The model types option is not currently documented and may change
     * in the future.</p>
     *
     * <p>Operations are strings. The standard operation permissions are "canAdd", "canDelete", "canEdit",
     * "canDrag". You can define your own as well.</p>
     *
     * <p>First the record itself is checked to see if it allows the operation by checking if the record metadata contains
     * the specified permission.
     * Next the type of the record is checked to see if it allows the operation.
     * If the record has no type or the operations for that type didn't specify a value for the operation then
     * the default type is checked to see if it allows the operation.
     * The value of an operation is true or false or a function that returns true or false. The function is
     * called in the context of this model with arguments <code class="prettyprint">pRecord, pAddAction, pRecordsToAdd</code>.
     * If the model options includes a <code class="prettyprint">check</code> function then it is called with the result so far and all the
     * same arguments as this check function. See {@link Model.CheckCallback}.</p>
     * @param pOperation - One of the default checks ("canEdit", "canDelete", "canAdd", "canDrag") or a custom
     * operation.
     * @param [pRecord] - The record to check if action is allowed on it.
     * @param [pAddAction] - Only used by allowAdd see {@link model#allowAdd} for details.
     * @param [pRecordsToAdd] - Only used by allowAdd see {@link model#allowAdd} for details.
     * @returns true if the operation is allowed.
     */
    check(pOperation: string, pRecord?: Model.Record, pAddAction?: string, pRecordsToAdd?: Model.Record[]): boolean;
    /**
     * <p>Return true if the record is disabled and false otherwise. The record disabled state is determined
     * by the record {@link Model.RecordMetadata} <code class="prettyprint">disabled</code> property. If the
     * <code class="prettyprint">disabled</code> property is not defined or is null return a default of false.</p>
     * @param pRecord - The record to determine disabled state for.
     * @param [pRecordMeta] - Optional record metadata for <code class="prettyprint">pRecord</code>.
     *   Pass this in if it is already available from a previous call to {@link model#getRecordMetadata}
     *   otherwise it will be retrieved from the given record.
     * @returns true if disabled and false otherwise.
     */
    isDisabled(pRecord: Model.Record, pRecordMeta?: Model.RecordMetadata): boolean;
    /**
     * <p>Return the record for a given record id. This only considers records that are currently fetched
     * into the model. The server may have a record with the given record id but if it hasn't yet been
     * fetched into the model, it will not be found with this method.</p>
     * <p>For table or tree shape models that define an <code class="prettyprint">identityField</code>
     * option, call with the value of the record's identity field or if the records have multiple identity fields
     * call with an array of ids or a string representation of the combined identity fields as returned by
     * {@link model#getRecordId}.</p>
     * <p>For table shape models that don't define an <code class="prettyprint">identityField</code> option
     * call with the index of the record. This is the same as {@link model#recordAt}.
     * <p>For record shape models call with no record id to get the one and only model record.</p>
     * <p>For tree shape models that do not define an <code class="prettyprint">identityField</code> this
     * always returns null</p>
     * @example
     * <caption>This example returns the record with identity "001002".</caption>
     * record = model.getRecord( "001002" );
     * @example
     * <caption>This example has a table shape model with two identity fields. It returns the
     * record from a model with identity <code class="prettyprint">["AXB9", "00003"]</code>.</caption>
     * record = model.getRecord( ["AXB9", "00003"] );
     * @example
     * <caption>This example returns the record from a model with shape record.</caption>
     * record = model.getRecord();
     * @param [pRecordId] - The record id.
     * @returns Record or null if no record corresponding to
     *   <code class="prettyprint">pRecordId</code> is found.
     */
    getRecord(pRecordId?: string | string[]): Model.Record | null;
    /**
     * <p>Get the value of a record field given the record itself
     * or omit the record when the model shape is record. See also {@link model#setValue}.</p>
     * @example
     * <caption>This example returns the NAME field of the given record.</caption>
     * var name = model.getValue( someRecord, "NAME" );
     * @example
     * <caption>This example returns the NAME field from a record shape model.</caption>
     * var name = model.getValue( "NAME" );
     * @param [pRecord] - The record to return the value of the given column.
     *  Omit if model shape is record.
     * @param pFieldName - Name of record field to get.
     * @returns Value of record field.
     */
    getValue(pRecord: Model.Record, pFieldName: string): any;
    /**
     * <p>Set the value of a record field given the record itself
     * or omit the record when the model shape is record. See also {@link model#getValue}.</p>
     *
     * <p>An error is thrown if the record does not allow editing or the field does not allow being set.</p>
     * @example
     * <caption>This example sets the NAME field of the given record.</caption>
     * model.setValue( someRecord, "NAME", newName );
     * @example
     * <caption>This example sets the SALARY field of the given record. Note that the number
     * <code class="prettyprint">sal</code> is converted to a string.</caption>
     * model.setValue( someRecord, "SALARY", "" + sal );
     * @example
     * <caption>This example sets the identity field PART_NO of the given record.
     * Variable <code class="prettyprint">newPartNo</code> is a string. It checks for
     * a duplicate value and gives a message if the new part number is already taken.</caption>
     * var result = model.setValue( someRecord, "PART_NO", newPartNo );
     * if ( result === "DUP" ) {
     *     apex.message.alert( "The part number " + newPartNo + " is already taken." );
     * }
     * @example
     * <caption>This example sets the NAME field of a record shape model.</caption>
     * model.setValue( "NAME", newName );
     * @param [pRecord] - The record that will have a field set to the given value.
     *  Omit if model shape is record.
     * @param pFieldName - Name of record field to set.
     * @param pValue - The value to set. Note: Although the model is flexible in the data types it can
     * store in a field the APEX server expects strings. In most cases you should convert the value to a
     * string. See the {@link model} interface description for details including the convention for storing
     * display value pairs.
     * @returns One of:
     * <ul>
     *     <li>"SET": The value was set.</li>
     *     <li>"DUP": The value was not set because of duplicate identity. This can only happen when setting an
     *     identity field. Note: Even if the new value is unique on the client it may still result in an
     *     error when saving because the client in general does not have all the data that the server does.</li>
     *     <li>"NC": The value was not set because the new value is equal to the old value.</li>
     *     <li>null: The record is not in the model.</li>
     * </ul>
     */
    setValue(pRecord: Model.Record, pFieldName: string, pValue: any): string | null;
    /**
     * <p>Get the value of a record field given the record id.
     * This is only useful when the model shape is table or tree.
     * If there are many field values to get or set use {@link model#getRecord} followed by {@link model#getValue}
     * or {@link model#setValue}. See also {@link model#setRecordValue}.</p>
     * @example
     * <caption>This example gets the NAME field of the record with identity "00013".</caption>
     * var name = model.getRecordValue( "00013", "NAME" );
     * @param pRecordId - Value of the record's identity field or array of values of the record's
     *     identity fields or value returned by {@link model#getRecordId}.
     * @param pFieldName - Name of record field to get.
     * @returns Value of record field.
     */
    getRecordValue(pRecordId: string | string[], pFieldName: string): any;
    /**
     * <p>Set the value of a record field given the record id.
     * This is only useful when the model shape is table or tree.
     * If there are many field values to get or set use {@link model#getRecord} followed by {@link model#getValue}
     * or {@link model#setValue}. See also {@link model#getRecordValue}.</p>
     * @example
     * <caption>This example sets the NAME field of the record with identity "00013".</caption>
     * model.setRecordValue( "00013", "NAME", newName );
     * @param pRecordId - Value of the record's identity field or array of values of the record's
     *     identity fields or value returned by {@link model#getRecordId}.
     * @param pFieldName - Name of record field to set.
     * @param pValue - Value to set.
     */
    setRecordValue(pRecordId: string | string[], pFieldName: string, pValue: any): void;
    /**
     * <p>Sets the validity and associated validation message of a record or record field.</p>
     * @example
     * <caption>This examples calls a function, <code class="prettyprint">checkRecord</code>, that returns
     * an error message if the record is not valid and null if it is valid. It then sets the validity of the record.
     * </caption>
     * var invalidReasonMessage = checkRecord( recordId );
     * if ( invalidReasonMessage ) {
     *     model.setValidity( "error", recordId, null, invalidReasonMessage );
     * } else {
     *     this.model.setValidity( "valid", recordId );
     * }
     * @param pValidity - one of "error", "warning", "valid".
     * @param pRecordId - Value of the record's identity field or array of values of the record's
     *     identity fields or value returned by {@link model#getRecordId}.
     * @param [pFieldName] - Name of field that the validity state applies to or null if it applies to the whole record.
     * @param [pMessage] - Error or warning message text or omit if valid
     */
    setValidity(pValidity: string, pRecordId: string, pFieldName?: string, pMessage?: string): void;
    /**
     * <p>Delete one or more records from a table or tree.
     * </p>
     * <p>If the <code class="prettyprint">onlyMarkForDelete</code>
     * option is true the records are just marked for delete.
     * Records marked for delete will be included in data returned by {@link model#forEach}, {@link model#forEachInPage},
     * {@link model#walkTree}, etc. and can be found by {@link model#getRecord}. They will be deleted once the
     * {@link model#clearChanges} method is called explicitly or implicitly after data has been saved successfully.
     * </p>
     * <p>If the <code class="prettyprint">onlyMarkForDelete</code> option is false
     * the records are deleted right away and are no longer part of the model. In either case the deleted records
     * are on the change list so the deletion can be persisted.</p>
     *
     * <p>If <code class="prettyprint">pRecords</code> contains records that cannot be found in the collection
     * or finds records that can't be deleted they are ignored and a debug warning is given.</p>
     * @example
     * <caption>This example checks if deleting is allowed before deleting a record.</caption>
     * if ( myModel.allowDelete( record ) ) {
     *     myModel.deleteRecords( [record] );
     * }
     * @param pRecords - An array of records to delete.
     * @returns The number of records deleted or marked for delete.
     */
    deleteRecords(pRecords: Model.Record[]): number;
    /**
     * <p>Return true if the record exists in the model and has a change that can be reverted
     * (is updated or is deleted). See also {@link model#revertRecords}.</p>
     * @example
     * <caption>This example checks if a record can be reverted before reverting it.</caption>
     * if ( myModel.canRevertRecord( record ) ) {
     *     myModel.revertRecords( [record] );
     * }
     * @param pRecord - The record to check if it can be reverted.
     * @returns true if the record has a change that can be reverted.
     */
    canRevertRecord(pRecord: Model.Record): boolean;
    /**
     * <p>Revert one or more records to the way they were when first added to the model or last saved.
     * This undoes any changes made to the records. See also {@link model#canRevertRecord}.</p>
     * @example
     * <caption>This example checks if a record can be reverted before reverting it.</caption>
     * if ( myModel.canRevertRecord( record ) ) {
     *     myModel.revertRecords( [record] );
     * }
     * @param pRecords - The records to revert.
     * @returns The number of records reverted. This can be less than the number of records in
     *   <code class="prettyprint">pRecords</code> if some of the records had no changes to revert.
     */
    revertRecords(pRecords: Model.Record[]): number;
    /**
     * <p>Inserts a new record into the collection. Only applies to tree and table shape models.
     * For tree shape models the record is inserted under the given parent node. The model must
     * allow adding new records. See {@link model#allowAdd}.</p>
     * @param [pParentRecord] - Parent tree node. Only for tree shape models, must be null otherwise.
     * @param [pAfterRecord] - Record after which to insert the new record. If not given
     *   the new record is inserted at the beginning.
     * @param [pNewRecord] - The new record to insert. If not given a new record is created using
     *   defaults. The identity, meta, children, and parent fields if any will be initialized.
     *   Control break fields will get the control break values from the control break the record is being
     *   inserted into.
     * @returns The temporary primary key of inserted record.
     */
    insertNewRecord(pParentRecord?: Model.Record, pAfterRecord?: Model.Record, pNewRecord?: Model.Record): string;
    /**
     * <p>Moves the given records to a new position in the collection (table or parentRecord's children) or, for
     * tree shape only, to a new parent node.</p>
     *
     * <p>For tree shape models if there is a <code class="prettyprint">parentIdentityField</code>
     * the moved records will have the parent identity field
     * set to the identity of the new parent record.</p>
     * @param pRecords - Array of records to move.
     * @param [pParentRecord] - Only used when the shape is tree.
     *     This is the parent node to insert the moved records into. If null then insert to root.
     * @param [pAfterRecord] - The moved records are added after this record or if null at the beginning.
     * @returns Array of record identities of moved records.
     */
    moveRecords(pRecords: Model.Record[], pParentRecord?: Model.Record, pAfterRecord?: Model.Record): string[];
    /**
     * <p>Copies the given records and inserts the copies into the collection (table or parent node's children) or,
     * for tree shape only, to a new parent node.</p>
     * @example
     * <caption>This examples copies the selected records to just after the last selected record.</caption>
     * var keys = model.copyRecords( selectedRecords, null, selectedRecords[ selectedRecords.length - 1 ] );
     * @param pRecords - Array of records to copy.
     * @param [pParentRecord] - Only used when the shape is tree. This is the parent node to insert the
     *   copies into. If null then insert to root.
     * @param [pAfterRecord] - The copied records are added after this record or if null at the beginning.
     * @returns Array of temp primary keys of inserted records.
     */
    copyRecords(pRecords: Model.Record[], pParentRecord?: Model.Record, pAfterRecord?: Model.Record): string[];
    /**
     * <p>Return the root node of the tree. An error is thrown if the model shape is not tree.</p>
     * @example
     * <caption>This example gets the tree shape model root node.</caption>
     * var rootNode = model.root();
     * @returns Root node or null if there is no root.
     */
    root(): Model.Node;
    /**
     * <p>Return the child at pIndex of node pNode.</p>
     *
     * <p>This method must only be used on tree shape models.</p>
     * @example
     * <caption>This example loops over the children of a parent node.</caption>
     * var i, node;
     * for ( i = 0; i < model.childCount( parentNode ); i++ ) {
     *     node = model.child( parentNode, i );
     *     // do something with node
     * }
     * @param pNode - The node who's ith child is to be returned.
     * @param pIndex - The index of the child node.
     * @returns The ith child node.
     */
    child(pNode: Model.Node, pIndex: number): Model.Node;
    /**
     * <p>Return the parent node of the given node. Only supported for tree shape models that have an
     * <code class="prettyprint">identityField</code> option defined.</p>
     *
     * <p>This method must only be used on tree shape models.</p>
     * @param pNode - The node to get the parent of.
     * @returns Parent node or null for the root node and undefined otherwise
     */
    parent(pNode: Model.Node): Model.Node;
    /**
     * <p>Returns the number of children that node <code class="prettyprint">pNode</code> has, or null if the answer is not yet known.
     * A node that has its children lazy loaded may not know how many children it has until they are loaded.</p>
     *
     * <p>This method must only be used on tree shape models.</p>
     * @example
     * <caption>This example loops over the children of a parent node.</caption>
     * var i, node;
     * for ( i = 0; i < model.childCount( parentNode ); i++ ) {
     *     node = model.child( parentNode, i );
     *     // do something with node
     * }
     * @param pNode - The node whose children are to be counted.
     * @returns Number of children, 0 if none, or null if not known.
     */
    childCount(pNode: Model.Node): number | null;
    /**
     * <p>Returns true if the node <code class="prettyprint">pNode</code> has children, false if it does not,
     * and null if not yet known.
     * A node that has its children lazy loaded may not know if it has any children until they are loaded.
     * @example
     * <caption>This example logs a message to the console if the node is a leaf (has no children).</caption>
     * if ( model.hasChildren( node ) === true ) {
     *     console.log("node is a leaf");
     * }
     * @param pNode - The node to check if it has any children.
     * @returns true if the node has children, false if it does not, and null if not known.
     */
    hasChildren(pNode: Model.Node): boolean;
    /**
     * <p>Fetch child nodes for node <code class="prettyprint">pNode</code>.
     * This method is only used for trees that lazy load data from the sever as needed.
     * If <code class="prettyprint">pNode</code> is not given or null the whole tree is loaded from the server.</p>
     *
     * <p>This is an asynchronous operation. When it completes the <code class="prettyprint">pCallback</code>
     * function is called with a status argument. Where status is:
     * <ul>
     *     <li>&gt; 0 (or true) if 1 or more children were fetched.</li>
     *     <li>0 if the node has 0 children.</li>
     *     <li>Error if there was an error fetching the children.</li>
     * </ul>
     *
     * <p>Can use either the callback argument or the returned promise to determine when the request is complete.</p>
     * @param [pNode] - The node record to fetch children for. If null or omitted fetch the root node.
     * @param [pCallback] - callback function that is called after nodes have been fetched or there is an error.
     * @returns A promise that receives count of children fetched when resolved and an Error argument when rejected.
     */
    fetchChildNodes(pNode?: Model.Node, pCallback?: (...params: any[]) => any): Promise<any>;
    /**
     * <p>Traverse the tree shape model. This is a depth first search of the tree.
     * Methods of the <code class="prettyprint">pVisitor</code> object are called as follows:</p>
     * <ul>
     *     <li>First the visitor <code class="prettyprint">node</code> method is called for the
     *       <code class="prettyprint">pNode</code> passed to <code class="prettyprint">walkTree</code>.
     *       This allows pre-order search.</li>
     *     <li>If the node has children the next 3 steps are done.</li>
     *     <li>The visitor <code class="prettyprint">beginChildren</code> method is called.</li>
     *     <li>For each child node <code class="prettyprint">walkTree</code> is called performing these steps
     *       recursively. This node becomes <code class="prettyprint">pParentNode</code> and the child node
     *       becomes <code class="prettyprint">pNode</code>.</li>
     *     <li>The visitor <code class="prettyprint">endChildren</code> method is called.</li>
     *     <li>Last the visitor <code class="prettyprint">postNode</code> method is called for the
     *       <code class="prettyprint">pNode</code> passed to <code class="prettyprint">walkTree</code>.
     *       This allows post-order search.</li>
     * </ul>
     * @example
     * <caption>This example walks the tree shape model starting at the root logging information
     * about the tree as it goes. Indentation shows the structure of the tree.
     * The nodes in this model have a NAME field.</caption>
     * var indent = "";
     * model.walkTree( model.root(), {
     *     node: function( node, parent ) {
     *         console.log( indent + "Node: " + model.getValue( node, "NAME" ) );
     *     },
     *     beginChildren: function( node ) {
     *         indent += "    ";
     *     },
     *     endChildren: function( node ) {
     *         indent = indent.substring(4);
     *     }
     * }, null );
     * @example
     * <caption>This example walks the tree shape model starting at the root and processes
     *   the nodes in post-order. This means that the node's children are processed before the node.
     *   Depth or level information is not needed so the <code class="prettyprint">beginChildren</code> and
     *   <code class="prettyprint">endChildren</code> methods are omitted.</caption>
     * model.walkTree( model.root(), {
     *     postNode: function( node, parent ) {
     *         // do something to process the node
     *     },
     * }, null );
     * @param pNode - The node to start with. This node is visited and then all of its children are.
     * @param [pVisitor.node] - Function with signature function(node, parent). If the function returns
     *   true the node's children will not be visited. This is a way to exclude or prune sub branches of the tree
     *   during the traversal.
     * @param [pVisitor.beginChildren] - Function with signature function(node).
     * @param [pVisitor.endChildren] - Function with signature function(node).
     * @param [pVisitor.postNode] - Function with signature function(node, parent).
     * @param [pParentNode] - The parent node of <code class="prettyprint">pNode</code> or null if
     * <code class="prettyprint">pNode</code> is the root. If this argument is omitted or undefined and
     * the model has the <code class="prettyprint">identityField</code> option defined the parent node
     * will be determined automatically. If this argument is omitted or undefined and
     * the model does not have the <code class="prettyprint">identityField</code> option defined then
     * the parent parameter in the first call to the visitor <code class="prettyprint">node</code> method is null.
     */
    walkTree(pNode: Model.Node, pVisitor: {
        node?: (...params: any[]) => any;
        beginChildren?: (...params: any[]) => any;
        endChildren?: (...params: any[]) => any;
        postNode?: (...params: any[]) => any;
    }, pParentNode?: Model.Node): void;
    /**
     * <p>Subscribe to model change notifications by adding an observer.</p>
     * @example
     * <caption>This simple example subscribes to a model to handle notifications.</caption>
     * var viewId = model.subscribe( {
     *     onChange: function( changeType, change ) {
     *         // respond to model changes
     *     }
     * } );
     * @example
     * <caption>This example is typical of what a widget that displays model data would do to subscribe.</caption>
     * var viewId = model.subscribe( {
     *     viewId: this.element[0].id
     *     onChange: function(changeType, change) {
     *         // respond to model changes
     *     },
     *     progressView: this.element
     * } );
     * @param pObserver - An observer object that includes a callback function to receive notifications.
     * @returns A viewId to use with {@link model#unSubscribe}. This is the same as the
     *   <code class="prettyprint">viewId</code> property if there is one. One is generated if not given in
     *   <code class="prettyprint">pObserver</code>
     */
    subscribe(pObserver: Model.Observer): string;
    /**
     * <p>Unsubscribe to model change notifications.</p>
     * @example
     * <caption>This example unsubscribes from this model using the <code class="prettyprint">viewId</code>
     * returned when subscribing.</caption>
     * model.unSubscribe(viewId);
     * @param pViewId - The view id returned from {@link model#subscribe}.
     */
    unSubscribe(pViewId: string): void;
    /**
     * <p>Get the value of the given model option. The model options are provided in the call
     * to {@link apex.model.create}. See also {@link model#setOption}.</p>
     * @example
     * <caption>This example gets the <code class="prettyprint">onlyMarkForDelete</code> option.</caption>
     * var markForDelete = model.getOption( "onlyMarkForDelete" );
     * @example
     * <caption>This example gets the <code class="prettyprint">hasTotalRecords</code> option.</caption>
     * var hasTotalRecords = model.getOption( "hasTotalRecords" );
     * @param pName - Name of option to get.
     * @returns Option value.
     */
    getOption(pName: string): any;
    /**
     * <p>Set the value of the given model option. The model options are provided in the call
     * to {@link apex.model.create}. See also {@link model#getOption}.</p>
     *
     * <p>The options that can be set are:</p>
     * <ul>
     *     <li>genIdPrefix</li>
     *     <li>pageItemsToSubmit</li>
     *     <li>fetchData</li>
     *     <li>saveData</li>
     *     <li>regionData</li>
     *     <li>parentRecordId</li>
     *     <li>editable</li>
     *     <li>trackChanges</li>
     *     <li>onlyMarkForDelete</li>
     *     <li>pageSize</li>
     *     <li>requestOptions</li>
     *     <li>callServer</li>
     *     <li>visibilityFilter</li>
     *     <li>visibilityFilterContext</li>
     *     <li>delayClearData</li>
     * </ul>
     * @param pName - Name of option to set. Not all options can be set.
     * @param pValue - Value to set the option to.
     */
    setOption(pName: string, pValue: any): void;
}

/**
 * <p>The region interface is used to access region related methods and properties. You get access
 * to the region interface for a region with the {@link apex.region|apex.region} function.</p>
 *
 * <p>Plug-in developers can define the behavior of their region by calling {@link apex.region.create}.</p>
 */
declare interface region {
    /**
     * <p>The jQuery object for the region element.</p>
     */
    element: jQuery;
    /**
     * <p>Identifies the parent (master) region ID, if the region is the detail region of a master detail relationship.
     */
    parentRegionId: string;
    /**
     * <p>Identifies the type of the region. Regions that don't implement a custom region interface have type "generic".</p>
     */
    type: string;
    /**
     * <p>For regions that are implemented with a jQuery UI style widget, this is the name of the widget. For other
     * widget implementations it is null. It is used internally by the {@link region#call}, {@link region#on} and
     * {@link region#off} methods.</p>
     */
    widgetName: string;
    /**
     * <p>For region plug-ins which support Faceted Search / Smart Filters it is possible to pass in the DOM ID of the
     * {@link facetsRegion} region in order for APEX to bind the two together. If provided, the region will be automatically refreshed as the filters change.
     * Further, if the region's refresh callback returns a Promise, APEX will also automatically perform the appropriate locking and unlocking
     * of the {@link facetsRegion} region during refresh.</p>
     */
    filterRegionId: string;
    /**
     * <p>Cause the region to get new data from the server or otherwise refresh itself. Not all regions support refresh.
     * Exactly what happens depends on the type of region.</p>
     *
     * <p>This function should be used in place of the legacy way of refreshing a region, which was to trigger the
     * apexrefresh event on the region element.</p>
     *
     * <p>The default implementation triggers the legacy apexrefresh event on the region element for backward compatibility
     * with old regions that don't implement this interface.</p>
     *
     * <p>The refresh callback can and should return a Promise, in order for the caller to have more knowledge of its progress.
     * Whether it does return one depends on the region or plug-in.</p>
     * @example
     * <caption>The following will refresh the region with Static ID "myRegion":</caption>
     * var region = apex.region( "myRegion" );
     * region.refresh();
     * @example
     * <caption>The following example will refresh an Interactive Report region while maintaining the same page.</caption>
     * var region = apex.region( "myRegion" );
     * region.refresh( true );
     * @param pKeepPagination - controls the pagination and scroll behavior after refresh.
     * The exact behavior depends on the region. Not all regions support this parameter.
     * For example Interactive Report will maintain the page and scroll offset.
     */
    refresh(pKeepPagination: boolean): Promise<any>;
    /**
     * <p>Cause the region to take focus. Not all native or plug-in regions support taking focus. It is up to the
     * specific region to determine where focus will go. Some regions manage focus such that there is a single
     * tab stop (or limited number of tab stops) and they may put focus to where the user last had focus within
     * the region.</p>
     *
     * <p>The default implementation sets focus to the first element in the region that is capable of being tabbed
     * to.</p>
     * @example
     * <caption>The following example will focus the region with Static ID "myRegion".</caption>
     * var region = apex.region( "myRegion" );
     * region.focus();
     */
    focus(): void;
    /**
     * <p>Returns the widget associated with the region or null if the region isn't implemented with a widget.
     * Some advanced region types such as Calendar, Interactive Grid, or Tree are implemented using a widget.
     * This function provides access to the widget typically by returning a jQuery object for the widget element.
     * You can then call widget methods on the jQuery object. See also the {@link region#call} method.</p>
     * @example
     * <caption>The following adds a row to an Interactive Grid by using the region widget method to
     * access the interactiveGrid widget {@link interactiveGrid#getActions} method and then invoking the
     * <code class="prettyprint">selection-add-row</code> action.</caption>
     * apex.region( "myGridRegion" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );
     * @returns jQuery object or null if there is no widget associated with the region.
     */
    widget(): jQuery | null;
    /**
     * <p>Calls a method on the widget associated with the region. This method only applies to
     * regions that are implemented with a jQuery UI style widget.</p>
     * @example
     * <caption>The call method is a shorthand for calling methods on a widget. The following example
     * shows an Interactive Grid region with Static ID <code class="prettyprint">emp</code> and two equivalent ways of invoking the
     * <code>getSelectedRecords</code> method.</caption>
     * var records1 = apex.region( "emp" ).call( "getSelectedRecords" );
     * // same result as above but this is more verbose
     * var records2 = apex.region( "emp" ).widget().interactiveGrid( "getSelectedRecords" );
     * @param pMethod - The string name of the widget method.
     * @param args - Any number of arguments to be passed to the widget method.
     * @returns The return value depends on the method called.
     */
    call(pMethod: string, ...args: any[]): any;
    /**
     * <p>Attaches an event handler to the widget element associated with this region. This method only applies to
     * regions that are implemented with a jQuery UI style widget. This means that {@link region#widgetName}
     * property must be defined and the {@link region#widget} method returns a value.</p>
     *
     * <p>This is a shortcut for calling <code class="prettyprint">apex.region(id).widget().on(...)</code>.
     * Unlike the jQuery object <code class="prettyprint">on</code> method this does not return the
     * jQuery object and therefore is not chainable. See the jQuery documentation for details.</p>
     *
     * <p>See also {@link region#off}.</p>
     * @example
     * <caption>This example handles the selectionChange event of an Interactive Grid
     * region by logging a message to the console. Note that the short event name "selectionChange" can be
     * used rather than the full name "interactivegridselectionchange".
     * See also {@link interactiveGrid#event:selectionchange}</caption>
     * apex.region( interactiveGridRegionId ).on( "selectionChange", function(event, data) {
     *     console.log("Selection changed; # records selected is", data.selectedRecords.length );
     * } );
     * @param events - One or more space-separated event types and optional namespaces as defined by the
     *   jQuery <code class="prettyprint">on</code> method. For events defined by this region widget the
     *   event name prefix can be omitted.
     * @param args - Other arguments to be passed to the widget's jQuery object
     *   <code class="prettyprint">on</code> method such as selector, data, and handler.
     */
    on(events: any, ...args: any[]): void;
    /**
     * <p>Removes an event handler from the widget element associated with this region. This method only applies to
     * regions that are implemented with a jQuery UI style widget. This means that {@link region#widgetName}
     * property must be defined and the {@link region#widget} method returns a value.</p>
     *
     * <p>This is a shortcut for calling <code class="prettyprint">apex.region(id).widget().off(...)</code>.
     * Unlike the jQuery object <code class="prettyprint">off</code> method this does not return the
     * jQuery object and therefore is not chainable. See the jQuery documentation for details.</p>
     *
     * <p>See also {@link region#on}.</p>
     * @example
     * <caption>This example removes all event handlers for the selectionChange event of an
     * Interactive Grid region. Note that the short event name "selectionChange" can be
     * used rather than the full name "interactivegridselectionchange".
     * See also {@link interactiveGrid#event:selectionchange}.</caption>
     * apex.region( interactiveGridRegionId ).off( "selectionChange" );
     * @param events - One or more space-separated event types and optional namespaces as defined by the
     *   jQuery <code class="prettyprint">off</code> method. For events defined by this region widget the
     *   event name prefix can be omitted.
     * @param args - Other arguments to be passed to the widget's jQuery object
     *   <code class="prettyprint">off</code> method such as selector, data, and handler.
     */
    off(events: any, ...args: any[]): void;
    /**
     * <p>Return an alternative loading indicator for the given element. Not all regions have this method so
     * check if it exists before calling. For regions that support column items and when the column items may
     * not be visible on the screen at all times this allows the region to
     * place the loading indicator in an appropriate location. This can return the loading indicator passed in
     * or return a completely new loading indicator.</p>
     * @param pElement - DOM element that may represent a column item.
     * @param pLoadingIndicator$ - A loading indicator that can be inserted in to the DOM where desired and returned or ignored.
     * @returns loadingIndicator jQuery object or null if the region has no alternative for given element.
     */
    alternateLoadingIndicator(pElement: Element, pLoadingIndicator$: jQuery): jQuery;
}

/**
 * <p>The htmlBuilder interface is used create HTML markup. It makes it easy to generate markup that is
 * well-formed and properly escaped. It is simpler and safer than using string concatenation and doesn't
 * require the overhead of using a template library. For simple templates see {@link apex.util.applyTemplate}</p>
 * @example
 * <caption>This example creates an HTML string consisting of a label and text input and inserts it
 *     into the DOM. Data to be mixed into the markup is in an options object. The options values will be
 *     properly escaped to avoid cross site scripting security issues. With an options object
 *     <code class="prettyprint">{ id: "nameInput", label: "Name", size: 10, maxChars: 15 }</code>
 *     the resulting markup will be:<br>
 *     <code>&lt;label for='nameInput'>Name&lt;/label>&lt;input type='text' id='nameInput' class='specialInput' size='10' maxlength='15' value='' /></code></caption>
 * var out = apex.util.htmlBuilder();
 * out.markup( "<label" )
 *     .attr( "for", options.id )
 *     .markup( ">" )
 *     .content( option.label )
 *     .markup( "</label><input type='text'" )
 *     .attr( "id", options.id )
 *     .attr( "class", "specialInput" )
 *     .optionalAttr( "title", options.title )
 *     .attr( "size", options.size )
 *     .attr( "maxlength",  options.maxChars )
 *     .attr( "value", "" )
 *     .markup( " />" );
 * $( "#myContainer", out.toString() );
 */
declare interface htmlBuilder {
    /**
     * <p>Add markup.</p>
     * @param pMarkup - The markup to add. No escaping is done.
     * @returns This htmlBuilder instance for method chaining.
     */
    markup(pMarkup: string): this;
    /**
     * <p>Add an attribute.<p>
     * @param [pName] - Attribute name. A leading space and trailing = is added and the value is quoted.
     *     If not given just the value is added without being quoted.
     * @param pValue - Attribute value. This will be escaped.
     * @returns This htmlBuilder instance for method chaining.
     */
    attr(pName: string, pValue: string): this;
    /**
     * <p>Add an optional attribute. The attribute and its value is only added if the value is a non-empty
     * string or a non-zero number or true.</p>
     * @param pName - Attribute name. A leading space and trailing = is added and the value is quoted.
     * @param pValue - Attribute value. This will be escaped.
     * @returns This htmlBuilder instance for method chaining.
     */
    optionalAttr(pName: string, pValue: string): this;
    /**
     * <p>Add an optional Boolean attribute. The attribute is added only if the value is true.</p>
     * @param pName - Attribute name. A leading space is added.
     * @param pValue - If true the attribute is added. If false the attribute is not added.
     * @returns This htmlBuilder instance for method chaining.
     */
    optionalBoolAttr(pName: string, pValue: boolean): this;
    /**
     * <p>Add element content. The content is escaped.<p>
     * @param pContent - The content to add between an element open and closing tags.
     * @returns This htmlBuilder instance for method chaining.
     */
    content(pContent: string): this;
    /**
     * <p>Remove all markup from this builder interface instance. Use this when you want to reuse the builder
     * instance for new markup.</p>
     */
    clear(): void;
    /**
     * <p>Return the HTML markup.</p>
     * @returns The markup that has been built so far.
     */
    toString(): string;
}

declare namespace facetsRegion {
    /**
     * <p>Facet control option properties that configure the look and behavior of a facet.
     * </p>
     * <p>A note about facet visibility: There are 3 options that can affect if a facet is shown:
     * displayed, visibleCondition, and lovDependsOn. There is little coordination between these options.
     * In general, the last one evaluated wins (gets to say if the facet is visible or not).
     * </p>
     * <p>See also listControl, {@link facetsRegion#rangeControl}.
     * </p>
     * @property name - The item/session state name
     * @property type - One of "list", "range", "rangeList", "selectList",
     *               "group", "checkbox", "input"
     * @property label - The UI label to show for the facet control.
     * @property includeLabel - Determines if the facet label is also displayed when a facet value is shown
     *   standalone such as in the current facets area in faceted search mode
     *   or as a suggestion facet chip in smart filters mode. When facet is displayed in filter dialog the label is always shown.
     * @property icon - Icon CSS classes to show before the facet label in faceted search mode and
     *   in the suggestions drop down in smart filters mode.
     * @property cssClasses - Additional classes to set on the facet control. In faceted search mode
     * the class is added to the facet control element with class 'a-FS-control'.
     * In smart filters mode the class is added to the suggestion chip element with class 'a-Chip' and to
     * the popup element with class 'a-FS-body'.
     * @property collapsible - Determines if the the facet control can be collapsed.
     *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
     * @property initialCollapsed - When <code class="prettyprint">collapsible</code> is true this determines if the facet control is initially collapsed.
     *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
     * @property maxHeight - The maximum height of the facet control values area.
     *   If the facet has more values than will fit in this height then they will scroll.
     *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
     * @property clearBtn - If true the control will have a clear button shown when it has a value.
     *   Default true.
     *   When {@link facetsRegion#uiMode} is "S" (smart filters mode) this does not apply and is set to false.
     * @property hasFeedback - If true then this control expects to get feedback about how many matching
     *   resources are available. The default comes from option {@link facetsRegion#feedback}.
     * @property displayAs - Controls whether the facet control is shown as inline or in a filter dialog (INLINE, FILTER_DIALOG).
     *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
     * @property visibleCondition - A condition object as described by apex.util.checkCondition. This controls the visibility
     *     of the facet. When the condition is true the facet if visible. When not visible the facet will have no value.
     * @property showChart - Default true. Only applicable for LOV related controls and if showCharts, hasFeedback and showCounts is true.
     * @property initialChart - Default false. Only applies if showChart is applicable and true and showCharts is a string.
     * @property suggestedValues - Determines if a facet suggestion chip is displayed in the suggestion filter chips area
     *   and if so what value to suggest. If true the value with the largest count or first value
     *   of a LOV facet is used as the suggestion value.
     *   If false this facet is not included in the suggestion filter chip area. If an array it is an array of
     *   facet values. The first value that has a non-zero count is used.
     *   Only applies when {@link facetsRegion#uiMode} is "S" (smart search mode).
     * @property * - Additional type specific properties.
     */
    type control = {
        name: string;
        type: string;
        label: string;
        includeLabel: boolean;
        icon: string;
        cssClasses: string;
        collapsible: boolean;
        initialCollapsed: boolean;
        maxHeight: Number;
        clearBtn: boolean;
        hasFeedback: boolean;
        displayAs: string;
        visibleCondition: any;
        showChart: boolean;
        initialChart: boolean;
        suggestedValues: boolean | any[];
        // *: facetsRegion.listControl | facetsRegion.rangeControl | facetsRegion.selectListControl | facetsRegion.checkboxControl | facetsRegion.inputControl;
    };
    /**
     * <p>These are additional options for controls that have a list of values (LOV).
     * These options apply to the facet control types 'list' and 'rangeList'</p>
     * @property escape - If false allows markup in the values display values. Otherwise markup is escaped.
     * @property multiple - If true the user can select multiple values from the list. (checkboxes)
     * @property showCounts - Default true. Only applicable if hasFeedback is true.
     * @property hideEmpty - If true values with 0 count are hidden if false values with 0 count are visually "disabled"
     * @property lovDependsOn - Parent cascading LOV parent facet name. When the parent changes, new values are requested from the server.
     * @property lovDependsOnRequired - If true the lovDependsOn parent must have a value for this facet to have any values.
     *       This only applies when lovDependsOn is specified.
     * @property values - LOV array of objects with these properties
     * @property values.r - Return value
     * @property values.d - Display value
     * @property [values.l] - Optional display value without markup. Only needed when display value includes markup
     *      if no l property and escape is false fall back to stripHTML on display value (d).
     * @property [values.i] - Icon CSS Classes for value
     * @property [values.g] - Indicates that this list item represents a group not a value.
     * @property filterValues - If true the user can filter the list of values to make it easy to find a particular value.
     * @property listClasses - extra classes to add to the list grouping element
     * @property showAllCount - If the list contains more than this number of items a "Show all" control is shown.
     *     Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
     * @property showAllGrace - Default 1. If the number of items is withing this amount of the showAllCount
     *     don't bother with showMore behavior. Only applies if showAllCount is given.
     *     This solves the problem of clicking show more/all only to find for example 1 more item.
     * @property orderByCount - If true the items are ordered by the count descending (after checked items if checkedFirst is true).
     * @property checkedFirst - If true any selected items are shown first. Not supported if values are grouped.
     * @property disabledLast - If true any disabled items are shown last. Only applies if hasFeedback is true.
     *     Not applicable if hideEmpty is true. Not supported if values are grouped.
     * @property hideRadioButton - Only applies when multiple is false. Uses bold label rather than radio button to indicate selected item
     * @property noManualEntry - Only applies to rangeList. If true the manual range entry controls are not added.
     * @property actionsFilter - If true adds the action Filter to the facet context menu. The default is false.
     *      Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
     */
    type listControl = {
        escape: boolean;
        multiple: boolean;
        showCounts: boolean;
        hideEmpty: boolean;
        lovDependsOn: string;
        lovDependsOnRequired: boolean;
        values: {
            r: string;
            d: string;
            l?: string;
            i?: string;
            g?: boolean;
        }[];
        filterValues: boolean;
        listClasses: string;
        showAllCount: number;
        showAllGrace: number;
        orderByCount: boolean;
        checkedFirst: boolean;
        disabledLast: boolean;
        hideRadioButton: boolean;
        noManualEntry: boolean;
        actionsFilter: boolean;
    };
    /**
     * <p>These are additional options for controls that allow a range defined by a start and end value.
     * These options apply to the facet control types 'range' and 'rangeList' (unless noManualEntry is true).</p>
     * @property allowOpen - If true manual entry open ended ranges are allowed. Default false.
     * @property prefixText - Text to display before the range input fields. Example: "$".
     * @property suffixText - Text to display after the range input fields. Example: "mph".
     * @property rangeText - Text displayed between the 2 range input fields. Example: " - ".
     * @property currentLabel - Label used for the current facets area. Example: "$%0 to $%1"
     * @property currentLabelOpenHi - Label used for the current facets area. Example: "Over $%0"
     * @property currentLabelOpenLow - Label used for the current facets area. Example: "Under $%0"
     * @property min - Minimum value user is allowed to enter.   When dataType is number:
     * @property max - Maximum value user is allowed to enter.   When dataType is number:
     * @property step - Number input step increment.   When dataType is number:
     * @property dataType - The datatype of the value to enter and the facet value to compare with.
     *   The comparison operator is controlled by the server. One of "NUMBER", "VARCHAR2", "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ"
     * @property formatMask - Format Mask of the input when facet is based on dataType "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ"
     */
    type rangeControl = {
        allowOpen: boolean;
        prefixText: string;
        suffixText: string;
        rangeText: string;
        currentLabel: string;
        currentLabelOpenHi: string;
        currentLabelOpenLow: string;
        min: number;
        max: number;
        step: number;
        dataType: string;
        formatMask: string;
    };
    /**
     * <p>These are additional options for select list controls.
     * These options apply to the facet control types 'selectList'.</p>
     * @property showCounts - Default true. Only applicable if hasFeedback is true.
     * @property hideEmpty - If true values with 0 count are hidden if false values with 0 count are visually "disabled"
     * @property lovDependsOn - Parent cascading LOV parent facet name. When the parent changes, new values are requested from the server.
     * @property lovDependsOnRequired - If true the lovDependsOn parent must have a value for this facet to have any values.
     *   This only applies when lovDependsOn is specified.
     * @property values - Same as for list type.
     * @property nullLabel - This is the label for the first option, which used to unselect all others.
     *   It represents no facet value selected. This is not the same as the List of Values: Include Null Option.
     *   Required.
     */
    type selectListControl = {
        showCounts: boolean;
        hideEmpty: boolean;
        lovDependsOn: string;
        lovDependsOnRequired: boolean;
        values: object[];
        nullLabel: string;
    };
    /**
     * Checkbox specific options
     *   Note the checkbox type can only be in a group. This means it must follow a group control or be in
     *     the facets array of a group item. It is different from other facet controls in that it does not
     *     form its own group. The label is the label of the checkbox. So some of the common control properties
     *     such as collapsible and maxHeight don't apply and are simply ignored. Some properties take their
     *     value from the group the checkbox is in.
     * @property value - Control return value when checked
     * @property icon - Icon CSS class
     * @property escape - If false allows markup in the label. Otherwise markup is escaped.
     * @property altLabel - {string} label to use in currentFacets and charts. Useful when the label contains markup.
     */
    type checkboxControl = {
        value: string;
        icon: string;
        escape: boolean;
        altLabel: string;
    };
    /**
     * Input specific options
     * @property dataType - The datatype of the value to enter and the facet value to compare with.
     *   The comparison operator is controlled by the server. One of "NUMBER", "VARCHAR2", "DATE", "TIMESTAMP", "TIMESTAMP WITH TIME ZONE", "TIMESTAMP WITH LOCAL TIME ZONE"
     * @property formatMask - Format Mask of the input when facet is based on dataType "DATE", "TIMESTAMP", "TIMESTAMP WITH TIME ZONE", "TIMESTAMP WITH LOCAL TIME ZONE"
     * @property inputLabel - Label to show before the input.
     * @property suffixText - {string} Text to show after the input.
     * @property currentLabel - {string} Label used for the current facets area. Example: "Within %0 miles"
     *   When dataType is "NUMBER":
     * @property min - Minimum value user is allowed to enter
     * @property max - Maximum value user is allowed to enter
     * @property step - Number input step increment
     */
    type inputControl = {
        dataType: string;
        formatMask: string;
        inputLabel: string;
        suffixText: string;
        currentLabel: string;
        min: number;
        max: number;
        step: number;
    };
}

/**
 * <p>The facetsRegion interface is used to access the properties and methods of the facets API which is
 * used by both the Faceted Search and Smart Filters regions.
 * You get access to the facetsRegion interface with the {@link apex.region} function when passed
 * the regionId (static ID) of either a Faceted Search Region or Smart Filters Region.
 * The terms <em>facet</em> and <em>filter</em> (when used as a noun) are often used interchangeably.
 * </p>
 * <p>The facetsRegion provides the user interface used to search and filter an associated report.
 * The Faceted Search and Smart Filters regions have a great deal of overlap in their functionality; both allow
 * searching and filtering a report. The biggest difference is in the UI and this is controlled by the
 * {@link facetsRegion#uiMode} property. A number of properties are only supported in one mode or the other
 * as noted in the description of each property.
 * </p>
 * <p>Report region plug-in developers use the facetsRegion API to support the client side of faceted
 * search for their plug-in. The plug-in server-side render code must pass the static ID of the Faceted Search
 * or Smart Filter region to the client as part of its configuration. The plug-in region must listen for
 * the {@link facetsRegion#event:change} event and refresh the report in response.
 * Before sending the ajax request to refresh the report it must call
 * {@link facetsRegion#lock} and after the response completes it must call {@link facetsRegion#unlock}.
 * </p>
 * <div class="hw">
 * <h3 id="facet-items-section">Facet Items</h3>
 * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Facet Items" href="#facet-items-section"></a>
 * </div>
 * <p>Users filter the report by choosing or entering value(s) for as many facets as needed. The facet value is used
 * to match a specific column. Users can also enter a search term that matches any of the searchable columns
 * of the report. Each facet value and the search term(s) is stored in a hidden page item and has a corresponding
 * session state value. The item name is the filter or facet name.
 * </p>
 * <p>For example, if there is a facet or filter with name P1_PROJECT_STATUS that has LOV return values:
 * 'OPEN', 'IN_PROGRESS', 'CLOSED', and 'REOPENED'. Setting the page item will cause the facets region and
 * the report region to be updated to reflect the new facet value(s).
 * After executing the following code the report will show any records that have project status of OPEN or REOPENED.</p>
 * <pre class="prettyprint"><code>apex.item( "P1_PROJECT_STATUS" ).setValue( "OPEN:REOPENED" );
 * </code></pre>
 * <p>Note that multiple values are separated by a colon ":" and facet values that represent a range use
 * vertical bar "|" to separate the min and max range values.
 * </p>
 * <h4 id="facet-items-section-flexible-Operators"><b>Flexible Operators</b></h4>
 * <p>When using facets of type "Input Field" and "User can Choose Operator" is activated then the operator can be set by changing
 * the facet value.</p>
 * <p>For example, if there is a facet or filter with name P1_POPULATION, then report region can be filtered for all countries where
 * population is equal to a specific value.
 * After executing the following code the report will show any records that have equals to 1000.</p>
 * <pre class="prettyprint"><code>apex.item( "P1_POPULATION" ).setValue( "EQ:1000" );</code></pre>
 * <p>The following operators are available:</p>
 * <ul>
 *     <li>General
 *         <ul>
 *             <li>EQ: Equals</li>
 *             <li>NEQ: Not equals</li>
 *         </ul>
 *     </li>
 *     <li>NUMBER
 *         <ul>
 *             <li>LT: Less than</li>
 *             <li>LTE: Less than or equal to</li>
 *             <li>GT: Greater than</li>
 *             <li>GTE: Greater than or equal to</li>
 *         </ul>
 *     </li>
 *     <li>VARCHAR2
 *         <ul>
 *             <li>STARTS": Starts with</li>
 *             <li>NSTARTS: Does not start with</li>
 *             <li>C: Contains</li>
 *             <li>NC: Does not contain</li>
 *         </ul>
 *     </li>
 * </ul>
 */
declare interface facetsRegion extends region {
    /**
     * <p>Controls the UI mode of the region. It is one of the following values:</p>
     * <ul>
     * <li>"F" This is traditional faceted search mode. This is the value set by the Faceted Search region.</li>
     * <li>"S" This is smart filter search mode. This is the value set by the Smart Filters region.</li>
     * </ul>
     * <p>This option property cannot be changed after initialization. A number of other options and methods
     * are affected by this property setting.
     * </p>
     */
    uiMode: string;
    /**
     * <p>This determines if the search bar is collapsible.
     * If null (the default) the search bar is collapsible on mobile sized screens but not on desktop (larger) screens.
     * If true the searchbar is always collapsible. If false the searchbar is not collapsible.
     * When collapsible and there are no filters the search input field is not shown and the suggestions,
     * if any, are on one line.
     * This only applies when {@link facetsRegion#uiMode} is "S" (smart filter mode) and
     * {@link facetsRegion#maxChips} is not 0.
     * </p>
     */
    collapsibleSearchBar: boolean | null;
    /**
     * <p>The maximum number of suggestion filter chips to show at a time.
     * If 0 the suggestion filter chips area is not shown. If -1 then all available facet suggestions
     * are shown. The {@link facetsRegion#moreFiltersChip} option is only useful when this value is positive.
     * </p>
     * <p>This only applies when {@link facetsRegion#uiMode} is "S" (smart filter mode) and is ignored otherwise.
     * </p>
     */
    maxChips: number;
    /**
     * <p>Determine if a special "more filters" chip is shown in the suggestion filter chips area.
     * When clicked this chip shows a list of available filers to choose and filer the report on.
     * </p>
     * <p>This only applies when {@link facetsRegion#uiMode} is "S" (smart filter mode) and is ignored otherwise.
     * See also {@link facetsRegion#maxChips}.</p>
     */
    moreFiltersChip: boolean;
    /**
     * <p>Batch facet control changes or not. Batching changes allows the user to make a number of selections
     * before the report refreshes. In some cases this can make searching more efficient.
     * </p>
     * <p>When true, the {@link facetsRegion#event:change} event is delayed until an "apply" button is pressed. When
     *  {@link facetsRegion#uiMode} is "F" (faceted search mode) there will be an apply button shown (unless
     *  {@link facetsRegion#externalApply} is true). When {@link facetsRegion#uiMode} is "S" (smart filter mode)
     *  changes are applied when the the facet popup is closed.
     * </p>
     * <p>When false, the {@link facetsRegion#event:change} event is fired as soon as any facet control value changes.
     * </p>
     */
    batch: boolean;
    /**
     * <p>Only applies if {@link facetsRegion#batch} is true and {@link facetsRegion#uiMode} is "F" (faceted search mode).
     * If true no apply button is shown. Used when facets are in a dialog
     * or popup or otherwise have some other external way to apply the changes.
     * See the {@link facetsRegion#apply} method.
     * </p>
     */
    externalApply: boolean;
    /**
     * <p>If true the facet control values give feedback (counts) about how many resources match the facet value.
     * If false there is no feedback. Feedback can also be configured on a per facet basis with the
     * <code class="prettyprint">hasFeedback</code> property of a control. See {@link facetsRegion.control}.
     * </p>
     * <p>This option can only be set during initialization.</p>
     */
    feedback: boolean;
    /**
     * <p>This controls the search field.
     * If true a search field is included in the facets area.
     * If false there is no search field.
     * If a string it is the ID of a page item input field to use as the search field
     * When {@link facetsRegion#uiMode} is "S" (smart filter mode) this option is forced to be true
     * and cannot be changed.
     * </p>
     */
    searchField: string | boolean;
    /**
     * <p>The id of a button that initiates the search. Only applies if {@link facetsRegion#searchField}
     * is a string page item id. If this value is changed call {@link facetsRegion#refreshView}.
     * </p>
     */
    searchButton: string;
    /**
     * <p>Name of the search item. Required if {@link facetsRegion#searchField} is not false.
     * </p>
     */
    searchItem: string;
    /**
     * <p>Specify if multiple searches are allowed. If true the report can be filtered by multiple
     * search terms. Each search term must match some part of a record for it to be included in the report.
     * (This means that search term conditions are combined with AND.)
     * If false only a single search term is allowed.
     * When {@link facetsRegion#uiMode} is "S" (smart filter mode) this option is forced to be true
     * and cannot be changed.
     * </p>
     */
    multipleSearches: boolean;
    /**
     * <p>Controls if and where the list of current (applied) facet choices are shown. This is known as the
     * current facets area.
     * If a string, it is the selector of an element to render the list of current facet values in.
     * If true the list of current facets is added at the top of the facets region.
     * If false or not present there is no list of current facets.
     * </p>
     * <p>This option can only be set during initialization.
     * When {@link facetsRegion#uiMode} is "S" (smart filter mode) this option is forced to be false
     * because applied facets are always shown in the search bar.
     * </p>
     */
    currentFacets: string | boolean;
    /**
     * <p>Controls if and where the total count is shown.
     * If a string, it is a selector of an element to display the current total resources count in.
     * If true show the total count in the current facets area or if there is no current facets area show it
     * where the current facets area would be if it were true.
     * If false don't show the total count.
     * This is forced to false if feedback is false.</p>
     */
    showTotalCount: string | boolean;
    /**
     * <p>Determines if facets can have a button to show a chart of facet counts.
     * If true a chart for a single facet can be shown in a dialog (or popup).
     * If false no charts can be shown.
     * If a string it is the selector of an element to render the charts in.
     * </p>
     * <p>Charts can also be shown with the {@link facetsRegion#addChart} method unless this option is false.
     * When {@link facetsRegion#uiMode} is "S" (smart filter mode) there is no built-in UI for the user to show charts.
     * The require and JET chart libraries and JET CSS must be available. This is done automatically by the Faceted
     * Search region but not the Smart Filters region.
     * </p>
     */
    showCharts: string | boolean;
    /**
     * <p>The default maximum number of values to show in a facet chart.</p>
     */
    chartTopNValues: number;
    /**
     * <p>Controls if and how numbers for facet value counts and total count are formatted.
     * If false the numbers are not formatted.
     * If true the numbers are formatted using compact format (with no fractional digits) for numbers greater
     * than or equal to the {@link facetsRegion#numberFormatThreshold} and a default format model with group separators otherwise.
     * The {@link facetsRegion#numberFormatOptions} are not used.
     * If a string: it is a database number format model or the keyword "compact".
     * </p>
     */
    numberFormat: string | boolean;
    /**
     * See {@link facetsRegion#numberFormat}. Only applies if {@link facetsRegion#numberFormat} is true.
     * If null and <code class="prettyprint">numberFormat</code> is true then
     * the default format model with group separators is used.
     */
    numberFormatThreshold: number;
    /**
     * <p>Options to pass to the number formatting function. The available option properties depend on
     * the value of {@link facetsRegion#numberFormat}. See {@link apex.locale.formatNumber} and
     * {@link apex.locale.formatCompactNumber}.
     * </p>
     */
    numberFormatOptions: any;
    /**
     * <p>Persist facet control collapsed state and chart state in browser session storage or not.
     * </p>
     */
    persistState: boolean;
    /**
     * <p>Controls if facet values are cleared when hidden by the facet configuration popup (More Filters).
     * This option is not applicable when {@link facetsRegion#uiMode} is "S" (smart filter mode)</p>
     */
    clearOnHide: boolean;
    /**
     * An array of facet control objects. Required. The controls are set according to the region
     * facet or filter configuration.
     */
    controls: facetsRegion.control[];
    /**
     * <p>Object containing translatable strings. All required.</p>
     * @property searchLabel - Accessible label for the search input field or search button.
     *   Only used when {@link facetsRegion#searchField} is true.
     * @property searchPlaceholder - Placeholder text for the search input field.
     *   Only used when {@link facetsRegion#searchField} is true.
     * @property totalCountLabel - Label to show before the total results count. Only used when {@link facetsRegion#showTotalCount} is true.
     */
    text: {
        searchLabel: string;
        searchPlaceholder: string;
        totalCountLabel: string;
    };
    /**
     * <p>The facetsRegion type is "Facets".</p>
     */
    type: string;
    /**
     * <p>Renders and initializes the facets UI.</p>
     * @example
     * <caption>This example refreshes the view.</caption>
     * apex.region( "regionId" ).refreshView();
     */
    refreshView(): void;
    /**
     * <p>Clears all filters and search terms and resets any persistent settings to their original configured values.</p>
     * @example
     * <caption>This example resets the region.</caption>
     * apex.region( "regionId" ).refreshView();
     */
    reset(): void;
    /**
     * <p>This is a convenience method that simply calls the {@link facetsRegion#fetchCounts} method.</p>
     */
    refresh(): void;
    /**
     * <p>Refreshes the counts for all the facets. This is useful if the report is also filtered by controls, such
     * as page items, that are external to the facets region and those external control values have changed.</p>
     * <p>See also {@link facetsRegion#refresh}.</p>
     * @example
     * <caption>In this example there is an input element with id <em>P1_EXTERNAL_FILTER</em> and when
     * it changes the report is refreshed so the facet counts must also be refreshed.</caption>
     * $("#P1_EXTERNAL_FILTER").on( "change", function() {
     *     apex.region( "regionId" ).fetchCounts();
     * } );
     */
    fetchCounts(): void;
    /**
     * <p>Returns the number of facets that have a non-empty value. This is useful when the
     * facet UI is not always visible (for example it is in a collapsible or dialog region)
     * and you wish to display how many filters are applied.</p>
     * @param pIncludeSearchTerms - If true the search terms are included in the count.
     */
    getFacetCount(pIncludeSearchTerms: boolean): number;
    /**
     * <p>Clear all the current (applied) facet values and any search terms.</p>
     * <p>See also {@link facetsRegion#clearFacets}.</p>
     * @example
     * <caption>This example clears all the facet and search term values when the button with
     * id <em>CLEAR_BUTTON</em> is pressed.</caption>
     * $("#CLEAR_BUTTON").on( "click", function() {
     *     apex.region( "regionId" ).clear();
     * } );
     */
    clear(): void;
    /**
     * <p>Clear all the current (applied) facet values. Search terms if any are not cleared.</p>
     * <p>See also {@link facetsRegion#clear}.</p>
     * @example
     * <caption>This example defines an action that will clear all the facet values when
     * the keyboard shortcut Ctrl+/,X is pressed. The action could also be associated with a menu item
     * and/or button. See also {@link actions#add}.</caption>
     * apex.actions.add( [ {
     *     name: "clear-search",
     *     label: "Clear Filters",
     *     shortcut: "Ctrl+/,X",
     *     action: function() {
     *         apex.region( "regionId" ).clearFacets();
     *     }
     * } ] );
     */
    clearFacets(): void;
    /**
     * <p>Returns the total number of resources (records) in the report. This is the same value
     * displayed by the {@link facetsRegion#showTotalCount} property, except it is not formatted.
     * Returns null if {@link facetsRegion#feedback} property is false.</p>
     * @example
     * <caption>This example logs the number of records in the report to the console.</caption>
     * console.log("Total records is ", apex.region( "regionId" ).getTotalResourceCount() );
     */
    getTotalResourceCount(): number;
    /**
     * <p>Returns an object structure with all the counts displayed by the facets UI.</p>
     * @returns Facet value counts. The object properties are the facet control names.
     * The value of each property is an object with the facet value as the property and the
     * count as the property value.
     */
    getFacetValueCounts(): any;
    /**
     * <p>Shows the specified facet.</p>
     * <p>This API only works for facets that are displayed inline ({@link facetsRegion#displayAs} is "INLINE").</p>
     * <p>See also {@link facetsRegion#hideFacet}.</p>
     * @example
     * <caption>This example shows the facet named "P1_COMM".</caption>
     * apex.region( "myRegionId" ).showFacet( "P1_COMM" );
     */
    showFacet(pFacetName: string): void;
    /**
     * <p>Hides the specified facet. Note that hiding a facet does not clear any value(s) that may currently
     * be filtering the report.</p>
     * </p>
     * <p>In faceted search mode ({@link facetsRegion#uiMode} is "F") the facet
     * header and all choices or other selection UI are hidden.
     * </p>
     * <p>This API only works for facets that are displayed inline ({@link facetsRegion#displayAs} is "INLINE").</p>
     * <p>In smart filter mode ({@link facetsRegion#uiMode} is "S") the hidden facet will not show in the
     * suggestion chip area or in the suggestion drop down.</p>
     * <p>
     * <p>See also {@link facetsRegion#showFacet}.</p>
     * @example
     * <caption>This example hides the facet named "P1_COMM".</caption>
     * apex.region( "myRegionId" ).hideFacet( "P1_COMM" );
     * @example
     * <caption>This example hides the facet named "P1_COMM" and also clears any values it may have.</caption>
     * apex.item( "P1_COMM" ).setValue( "" );
     * apex.region( "myRegionId" ).hideFacet( "P1_COMM" );
     */
    hideFacet(pFacetName: string): void;
    /**
     * <p>Focus the first tabbable element. In faceted search mode ({@link facetsRegion#uiMode} is "F")
     * the search input field is focused if {@link facetsRegion#searchField} is true or the first facet control body
     * otherwise. In smart filter mode ({@link facetsRegion#uiMode} is "S") the search bar search input field
     * or search button is focused.
     * </p>
     * @example
     * <caption>This example puts focus in the Faceted Search or Smart Filters region.</caption>
     * apex.region( "myRegionId" ).focus();
     */
    focus(): void;
    /**
     * <p>Apply any outstanding changes to facet values. This method is intended for when
     * both {@link facetsRegion#batch} and {@link facetsRegion#externalApply} are true.</p>
     * @example
     * <caption>In this example the <code class="prettyprint">batch</code> and
     * <code class="prettyprint">externalApply</code> properties are true and the page has
     * a button with id "myApplyButton". The user clicks this button to apply facet choices.</caption>
     * $( "#myApplyButton" ).on( "click", function() {
     *     apex.region( "myRegionId" ).apply();
     * }
     */
    apply(): void;
    /**
     * <p>Disables the facets region so that facet values cannot be changed through the UI or API.
     * This is done by the report region associated with this facets region so that multiple requests are not
     * sent to the server at the same time.
     * For every call to {@link facetsRegion#lock} there must be a corresponding call to {@link facetsRegion#unlock}.</p>
     * <p>See {@link facetsRegion#unlock}.</p>
     * @example
     * <caption>This example shows how a report region plug-in would listen for facet value changes and
     * call lock and unlock. </caption>
     * // ajaxIdentifier and facetsStaticId are passed into the report plug-in
     * if ( facetsStaticId ) {
     *     let facetsRegion = apex.region( facetsStaticId );
     *     facetsRegion.widget().on( "facetschange", function() {
     *         facetsRegion.lock();
     *         let p = apex.server.plugin( ajaxIdentifier, ... );
     *         ...
     *         p.always( function() {
     *             facetsRegion.unlock();
     *         } );
     *     } );
     * }
     * @example
     * <caption>This example shows how to set multiple facet item values but only cause the report
     *  and facet counts to be updated once. The region static id is "empFacets" and P2_JOB and P2_MGR are
     *  2 of the facet names.</caption>
     * let facets = apex.region( "empFacets" );
     * facets.lock();
     * $s("P2_JOB", "CLERK");
     * $s("P2_MGR", "7698");
     * facets.unlock(); // only after this will the report and counts be updated
     */
    lock(): void;
    /**
     * <p>Enables the facets region after it was previously disabled with {@link facetsRegion#lock} so
     * that facet values can be changed again. For every call to {@link facetsRegion#lock} there must be a
     * corresponding call to {@link facetsRegion#unlock}.</p>
     * <p>See {@link facetsRegion#lock}.</p>
     * @example
     * <caption>See {@link facetsRegion#lock} for examples.</caption>
     */
    unlock(): void;
    /**
     * <p>Add/show a chart for the given facet.</p>
     * <p>This API only works for facets that are displayed inline ({@link facetsRegion#displayAs} is "INLINE").</p>
     * <p>See also {@link facetsRegion#removeChart}.</p>
     * @example
     * <caption>This example shows a chart for the P1_SAL facet in a non-modal dialog.</caption>
     * apex.region( "myRegionId" ).addChart( "P1_SAL" );
     * @example
     * <caption>This example adds a pie chart for the P1_JOB facet in dashboard area div with id "#chartDashboard".</caption>
     * apex.region( "myRegionId" ).addChart( "P1_JOB", $( "#chartDashboard" ), {type: "pie"});
     * @param pFacetName - The facet to add a chart for.
     * @param [pAppendTo$] - The element to append the chart to. If not specified then the chart is shown
     *    according to the {@link facetsRegion#showCharts} property.
     *    The {@link facetsRegion#showCharts} option must not be false if <code class="prettyprint">appendTo$</code>
     *    is not specified.
     * @param [pConfig] - Optional chart configuration.
     * @param pConfig.type - The chart type. One of "bar", "pie".
     * @param pConfig.topN - Maximum number of values to show in the chart
     */
    addChart(pFacetName: string, pAppendTo$?: jQuery, pConfig?: {
        type: string;
        topN: number;
    }): void;
    /**
     * <p>Remove the chart for the given facet.</p>
     * <p>See also {@link facetsRegion#addChart}.</p>
     * @example
     * <caption>This example removes the chart for the P1_SAL facet.</caption>
     * apex.region( "myRegionId" ).removeChart( "P1_SAL" );
     * @param pFacetName - The facet name of the chart to remove.
     */
    removeChart(pFacetName: string): void;
}

/**
 * <p>The numberFieldItem interface is used to access the properties and methods of the Number Field item.
 * You get access to the numberFieldItem interface with the {@link apex.item} function when passed
 * the item id (name) of a Number Field item.</p>
 * <p>When the field looses focus or the user presses enter the number entered will be formatted according to
 * the format mask configured for the item if any. If the page or item is validated on the client,
 * which is done by default before the page is submitted, this item will report validation errors.
 * It validates if the field is required, that it is a valid number, and within the minimum and maximum
 * range if so configured.</p>
 */
declare interface numberFieldItem extends item {
    /**
     * <p>The number field item type is "NUMBER".</p>
     */
    item_type: string;
    /**
     * <p>Return the current value of the item as a JavaScript number. If the value is not a valid number
     * returns NaN. This is useful when working with numbers because the {@link item#getValue} method
     * always returns a string.</p>
     * @example
     * <caption>In this example, page items P1_COST and P1_TAX are added together and then
     * formatted and displayed in an alert dialog</caption>
     * var total = apex.item( "P1_COST" ).getNativeValue() + apex.item( "P1_TAX" ).getNativeValue();
     * apex.message.alert( "Total is: " + apex.locale.formatNumber( total, "L999G999G999D99" ) );
     */
    getNativeValue(): number;
    /**
     * <p>Returns the current value of an Oracle APEX item. The initial value of a page item comes from
     * session state when the server renders the page. The initial value of a column item comes from the
     * corresponding field value of the active record of the Oracle APEX {@link model}. This function
     * always returns the current value of the item, which may have been changed by the user or with the
     * {@link item#setValue} method since it was initialized.</p>
     *
     * <p>There are two shorthand functions related to <code class="prettyprint">getValue</code>.
     * The {@link $v} function that returns an item's value as a string.
     * This will either be a single value, or if the item supports multiple values, will
     * be a ':' colon separated list of values. Note this does not make use of the configurable separator or
     * storage type for multivalued items.
     * The {@link $v2} function, which is just a shortcut
     * to getValue and returns either a single value, or an array of values. See also {@link item#setValue}.</p>
     * @example
     * <caption>In this example, the current value of the page item called P1_ITEM will be shown in an
     * alert.</caption>
     * apex.message.alert( "P1_ITEM value = " + apex.item( "P1_ITEM" ).getValue() );
     * @returns Returns either a single string value or array of string values if the item
     * supports multiple values (for example the 'Select List' with attribute
     * 'Multiple Values : Type' not equal to 'No' or 'Shuttle' native item types).
     */
    getValue(): string | any[];
    /**
     * <p>Sets the Oracle APEX item value. This function sets the current value of the
     * item. For page items the session state is not affected until the page is submitted (or the item
     * is explicitly saved to the server using ajax or a dynamic action). For column items the region
     * such as Interactive Grid takes care of writing the value back to the Oracle APEX {@link model}
     * when appropriate.</p>
     *
     * <p>Normally a change event is explicitly triggered on the item node when the value is set. This allows
     * cascading LOV functionality and dynamic action change events to work.
     * The caller may suppress the change event for the item being set, if needed. The change event should be
     * suppressed when the value is set while processing a change event triggered on the same item, to prevent
     * an infinite loop. The {@link grid} widget relies on the change event to update the model. If you suppress
     * the change event on a column item you may need to call the {@link grid#setActiveRecordValue} method.</p>
     *
     * <p>There is a shorthand function for setValue {@link $s}. See also {@link item#getValue}.</p>
     * @example
     * <caption>In this example, the value of the page item called P1_ITEM will be set to 10.
     * As <code class="prettyprint">pSuppressChangeEvent</code> has not been passed, the default behavior of the
     * <code class="prettyprint">change</code> event triggering for P1_ITEM will occur.</caption>
     * apex.item( "P1_ITEM" ).setValue( "10" );
     * @example
     * <caption>In this example, P1_ITEM is a Popup LOV page item with distinct display and return values.
     * The display value of P1_ITEM will be set to SALES, and the hidden return value will be set to 10.
     * Because true has been passed for the <code class="prettyprint">pSuppressChangeEvent</code> parameter,
     * the <code class="prettyprint">change</code> event will not trigger for the P1_ITEM item.</caption>
     * apex.item( "P1_ITEM" ).setValue( "10", "SALES", true );
     * @example
     * <caption>This example shows how to suppress the change event when there is no display value.</caption>
     * apex.item( "P1_ITEM" ).setValue( "10", null, true );
     * @param pValue - The value to set. For items that support multiple values (for example a
     * 'Shuttle'), an array of string values can be passed to set multiple values at once.
     * @param [pDisplayValue] - The display value, only if different from pValue and can't be determined by the item itself.
     *   For example, for the item type Popup LOV when the display value and return value are different,
     *   this parameter sets the display value while the <code class="prettyprint">pValue</code> parameter sets the hidden return value.
     * @param [pSuppressChangeEvent] - Pass true to prevent the change event from being triggered
     *   for the item being set. The default is false.
     */
    setValue(pValue: string | string[], pDisplayValue?: string, pSuppressChangeEvent?: boolean): void;
    /**
     * Determine if the value of this item has changed since it was first initialized.
     * Return true if the current value of the Oracle APEX item has changed and false otherwise.
     * Developers rarely have a need to call this function. It is used internally by the Warn on Unsaved Changes feature.
     * Item Plug-in developers should ensure this function works so that the Warn on Unsaved Changes
     * feature can support their plug-in.
     * @example
     * <caption>The following example determines if the value of item P1_ITEM has been changed.</caption>
     * if ( apex.item( "P1_ITEM" ).isChanged() ) {
     *     // do something
     * }
     * @returns true if the item value has changed and false otherwise.
     */
    isChanged(): boolean;
    /**
     * <p>Returns the display value corresponding to the value given by pValue for the Oracle APEX item.
     * This method is intended for items that have both a value and display value, such as select lists.</p>
     * <p>If the item type does not have a display value distinct from the value then
     * <code class="prettyprint">pValue</code> is returned;
     * meaning that the value is the display value. For item types that have a display value but don't have access
     * to all possible values and display values then this function only works when
     * <code class="prettyprint">pValue</code> is the current value of the item.
     * For the native items, this only applies to item type Popup LOV.
     * For item types such as select lists that have access to all their values,
     * if <code class="prettyprint">pValue</code> is not a valid value then
     * <code class="prettyprint">pValue</code> is returned.</p>
     * @example
     * <caption>This example gets a display value from a select list item called P1_ITEM and displays
     * it in an alert.</caption>
     * apex.message.alert( "The correct answer is: " + apex.item( "P1_ITEM" ).displayValueFor( "APPLES" ) );
     * @param pValue - The value to return the corresponding display value.
     *   For items which support multiple values such as a 'Shuttle' or 'Select List' with attribute
     *   'Allow Multi Selection' set to 'Yes', <code class="prettyprint">pValue</code> may be passed as an array
     *   of values. The return value is always a string with multiple values separated by a comma and space (", ").
     * @param pState - Optional parameter used when items are associated with a {@link model} column
     *   to provide state information about the item value. Most item types don't use this parameter. It is
     *   mostly useful to item types that include markup in the returned display value.
     * @param pState.readonly - If true the column value is readonly.
     * @param pState.disabled - If true the column value is disabled.
     * @returns The string display value corresponding to the given
     *     <code class="prettyprint">pValue</code> as described above.
     */
    displayValueFor(pValue: string | any[], pState: {
        readonly: boolean;
        disabled: boolean;
    }): string;
}

/**
 * <p>The mapRegion interface is used to access the properties and methods of the spatialMap API.
 * You get access to the mapRegion interface with the {@link apex.region} function when passed
 * the regionId (static ID) of a Map Region. This region uses the 3rd party {@link https://maplibre.org/ MapLibre GL JS}
 * library and exposes it via the {@link mapRegion#getMapObject} method. Developer code that uses the MapLibre API
 * may not be forward compatible should the MapLibre API change.
 * </p>
 */
declare interface mapRegion extends region {
    /**
     * <p>Whether load map data making an ajax request or not. Required.</p>
     */
    lazyLoading: boolean;
    /**
     * <p>Copyright notice html expression.</p>
     */
    copyrightNotice: string;
    /**
     * <p>Unit system that will be used for scale control and distance tool.
     * One of "metric" or "imperial".</p>
     */
    mapUnitSystem: string;
    /**
     * <p>An array of objects with basic information about layers. Required.</p>
     * @property id - Layer id.
     * @property label - Layer name.
     * @property useSpatialIndex - If true the widget will only fetch rows for the current map window from the database.
     *                                     This provides a performance benefit when the data source contains a large amount of rows.
     * @property minZoom - Specify the minimum zoom level for the layer to become visible.
     * @property maxZoom - Specify the maximum zoom level for this layer to remain visible.
     * @property tooltip - Layers features tooltip information.
     * @property tooltip.template - If Advanced formatting has been chosen for the tooltip then user needs to provide
     *                                     an HTML expressions to be shown as tooltip when hovering over a layer feature on the map.
     * @property tooltip.cssClasses - Additional css classes to be added in tooltip container.
     * @property infoWindow - Layers features info window information.
     * @property infoWindow.template - If Advanced formatting has been chosen for the info window then user needs to provide
     *                                        an HTML expressions to be shown as info window when clicking on a layer feature on the map.
     * @property infoWindow.cssClasses - Additional css classes to be added in info window container.
     */
    layers: object[];
    /**
     * <p>Tyle layer information object. Required.</p>
     * @property type - One of "oracle-default", default layer from Oracle map server; "oracle-custom", all available layers from Oracle map server;
     *                         and "shared-component", all custom backgrounds created by user.
     * @property name - Tile layer name for light mode. One of "osm-bright", "osm-positron", "bi-world-map", "osm-dark-matter" or "world-map".
     * @property darkmodeName - Tile layer name for dark mode.  One of "osm-bright", "osm-positron", "bi-world-map", "osm-dark-matter" or "world-map".
     * @property api_key - API Key value that can be set in the custom background URL, if required by the provider. Standard mode.
     * @property api_key_dark - API Key value that can be set in the custom background URL, if required by the provider. Dark mode.
     * @property attribution - Attribution text to display on the custom map. Standard mode.
     * @property attribution_dark - Attribution text to display on the custom map. Dark mode.
     * @property http_headers - Custom background HTTP headers required by the provider. Standard mode.
     * @property http_headers_dark - Custom background HTTP headers required by the provider. Dark mode.
     * @property layer_type - Type of the map tile layer retrieved from custom background URL.
     *                               One of "RASTER", "VECTOR" or "OGCWMS". Standard mode.
     * @property layer_type_dark - Type of the map tile layer retrieved from custom background URL.
     *                                    One of "RASTER", "VECTOR" or "OGCWMS". Dark mode.
     * @property url - URL used to fetch a custom map tile layer. Standard mode.
     * @property url_dark - URL used to fetch a custom map tile layer. Dark mode.
     * @property zoom_min - The minimum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
     *                             and 24 being the highest (fully zoomed in). Standard mode.
     * @property zoom_max - The maximum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
     *                             and 24 being the highest (fully zoomed in). Standard mode.
     * @property zoom_min_dark - The minimum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
     *                                  and 24 being the highest (fully zoomed in). Dark mode.
     * @property zoom_max_dark - The maximum zoom level of the map (0-24) with 0 being the lowest zoom level (fully zoomed out)
     *                                  and 24 being the highest (fully zoomed in). Dark mode.
     */
    tileLayer: {
        type: string;
        name: string;
        darkmodeName: string;
        api_key: string;
        api_key_dark: string;
        attribution: string;
        attribution_dark: string;
        http_headers: any;
        http_headers_dark: any;
        layer_type: string;
        layer_type_dark: string;
        url: string;
        url_dark: string;
        zoom_min: number;
        zoom_max: number;
        zoom_min_dark: number;
        zoom_max_dark: number;
    };
    /**
     * <p>Navigation Controls Bar Object. Add zoom and rotation (compass) controls to the map. Required.</p>
     * @property type - One of "none", "no-compass" or "full".
     * @property position - One of "top-left","top-right" or "bottom-left".
     */
    navigationBar: {
        type: string;
        position: string;
    };
    /**
     * <p>If true map position will be initialized using the specified initial map position (basedOnFeatures, getFromBrowser or static values for longitude, latitude and zoom level).
     * If false widget will initialize map position using session state.</p>
     */
    resetMapPosition: boolean;
    /**
     * <p>Comma separated list of page items on the current page to be set into session state when an AJAX request is made.</p>
     */
    itemsToSubmit: string;
    /**
     * <p>Map tools to be used in the map.</p>
     * @property mousewheelZoom - If true scroll zoom will be enabled.
     * @property scaleBar - If true scale control will be enabled.
     * @property circleTool - If true  circle tool  will be enabled.
     * @property browserLocation - If true geolocate control will be enabled.
     * @property rectangleZoom - If true rectangle zoom tool will be enabled.
     * @property distanceTool - If true distance tool will be enabled.
     * @property overviewMap - If true overview map will be displayed on map.
     * @property infiniteMap - If true MapLibre will render multiple world copies.
     */
    mapFeatures: {
        mousewheelZoom: boolean;
        scaleBar: boolean;
        circleTool: boolean;
        browserLocation: boolean;
        rectangleZoom: boolean;
        distanceTool: boolean;
        overviewMap: boolean;
        infiniteMap: boolean;
    };
    /**
     * <p>This item will be populated with the current map bbox. So whenever the map is zoomed or dragged,
     * store the current bbox in this item.</p>
     */
    mapStatusItem: string;
    /**
     * <p>Position of "No Data Found" and "More Data Found" messages container.</p>
     * @property position - One of "top" or "bottom".
     * @property selector - Selector for the DIV container to display the messages in.
     */
    layerMessages: {
        position: string;
        selector: string;
    };
    /**
     * <p>These styles can be used as the SVG Shape attribute within a Point layer.
     * An array of objects that provide definitions for custom SVG shapes to be used as point markers.</p>
     * @property type - Svg element type
     * @property name - Svg shape name that can be used to specify the SVG shape to display point objects.
     * @property width - Svg shape width
     * @property height - Svg shape height
     * @property viewBox - Defines the position and dimension of an SVG viewport.
     * @property elements - Array of objects that represent the necessary svg child elements to create the svg shape.
     *                               Each object most contain all the necessary element attrs.
     */
    customStyles: object[];
    /**
     * <p>Object returned by the AJAX request.</p>
     * @property map - Object with map bbox coordinates and series information.
     * @property map.bbox - Boundary box. Array of coordinates that describes the map window where all the layers features will be displayed.
     * @property map.series - Array of series that represent the layers. Series will contain all the feature points and information about the layers that will be created by MapLibre.
     */
    mapData: {
        map: {
            bbox: object[];
            series: object[];
        };
    };
    /**
     * <p>Legend area position and styles.</p>
     * @property position - One of "start", "end" or "selector"
     * @property selector - JQuery selector to display the legend in.
     * @property title - Legend title text.
     * @property cssClasses - Additional css classes to be added in lagend container.
     */
    legend: {
        position: string;
        selector: string;
        title: string;
        cssClasses: string;
    };
    /**
     * <p>Determines if raster or vector tile layer is used. If false map will use raster tile layers. If true map will use vector tile layers. Vector tiles are better quality. Available vector tile layers are: OpenStreetMap Positron, OpenStreetMap Dark and OpenStreetMap Bright.</p>
     */
    useVectorTileLayers: boolean;
    /**
     * <p>The mapRegion type is "SpatialMap".</p>
     */
    type: string;
    /**
     * <p>Update map layers data. If map initialization has not been completed region can't be refreshed.</p>
     * @example
     * <caption>This example make an ajax request to server to update layers data.</caption>
     * apex.region( "regionId" ).refresh();
     */
    refresh(): void;
    /**
     * <p>Focus the map</p>
     * @example
     * <caption>This example focus the map.</caption>
     * apex.region( "regionId" ).focus();
     */
    focus(): void;
    /**
     * Returns layers objects array.
     * @example
     * <caption>This example gets all the layers objects.</caption>
     * apex.region( "regionId" ).getLayers();
     * @returns An array of objects containing layers information.
     */
    getLayers(): object[];
    /**
     * <p>Returns layer id. If no layer name is given return null.</p>
     * @example
     * <caption>This example gets the id of the specified layer.</caption>
     * apex.region( "regionId" ).getLayerIdByName( "earthquakes" );
     * @param pName - Layer name.
     * @returns Layer ID.
     */
    getLayerIdByName(pName: string): number;
    /**
     * <p>Returns feature object from layer. If no layer id or feature id are given return empty object.</p>
     * @example
     * <caption>This example gets the specified feature object.</caption>
     * apex.region( "regionId" ).getFeature( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "0i97th6465" );
     * @param pLayerId - Id of layer.
     * @param pFeatureId - Id of feature.
     * @returns An object containing feature properties.
     */
    getFeature(pLayerId: number, pFeatureId: string): any;
    /**
     * <p>Add a new feature to series and to layer. If no layer id is given feature won't be added.</p>
     * @example
     * <caption>This example add a new feature to the map.</caption>
     * apex.region( "regionId" ).addFeature(
     *   apex.region( "regionId" ).getLayerIdByName( "earthquakes" ),
     *   {
     *     id: "6tgy767836",
     *     geometry: {
     *       type: "Point",
     *       coordinates: [ -108.852, 15.8821667 ]
     *     },
     *     infoWindow: {
     *       title: "Title text",
     *       body: "Body text"
     *     },
     *     tooltip: "Tooltip text"
     *   }
     * );
     * @param pLayerId - Id of layer.
     * @param pFeature - Feature object to be added.
     */
    addFeature(pLayerId: number, pFeature: any): void;
    /**
     * <p>Update feature from series and layer source. If no layer id or feature object are given feature won't be updated.</p>
     * @example
     * <caption>This example update the specified feature from series in the map.</caption>
     * apex.region( "regionId" ).updateFeature(
     *   apex.region( "regionId" ).getLayerIdByName( "earthquakes" ),
     *   {
     *     id: "6tgy767836",
     *     geometry: {
     *       type: "Point",
     *       coordinates: [ -128.852, 55.8821667 ]
     *     },
     *     infoWindow: {
     *       title: "My info window title",
     *       body: "My info window body"
     *     },
     *     tooltip: "My tooltip content"
     *   }
     * );
     * @param pLayerId - Id of layer.
     * @param pFeature - Feature object to update.
     */
    updateFeature(pLayerId: number, pFeature: any): void;
    /**
     * <p>Removes feature from map. If no layer id or feature id are given feature won't be removed.</p>
     * @example
     * <caption>This example removes the specified feature from the map.</caption>
     * apex.region( "regionId" ).removeFeature( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "8jd4760465" );
     * @param pLayerId - Id of layer.
     * @param pFeatureId - Id of feature to remove.
     */
    removeFeature(pLayerId: number, pFeatureId: string): void;
    /**
     * <p>Display feature popup. If map initialization has not been completed or pop-up type, layer id or feature id are invalid pop-up won't be displayed.</p>
     * @example
     * <caption>This example display the tooltip pop-up.</caption>
     * apex.region( "regionId" ).displayPopup( "tooltip", apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "6tgy767836" );
     * @example
     * <caption>This example display the info window pop-up. This pop-up will not be focused after open.</caption>
     * apex.region( "regionId" ).displayPopup( "infoWindow", apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "6tgy767836", false );
     * @example
     * <caption>This example display the info window pop-up on a polygon at the specified position.</caption>
     * apex.region( "regionId" ).displayPopup( "infoWindow", apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "8jd4760465", false, { lng: 0, lat: 0 } );
     * @param pType - Pop-up type. One of "tooltip" or "infoWindow".
     * @param pLayerId - Id of layer.
     * @param pFeatureId - Feature Id.
     * @param pFocusAfterOpen - Whether popup should get focus or not.
     * @param [pLngLat] - Tooltip coordinates. Only required if feature geometry type is other than "Point".
     * @param [pLngLat.lng] - Tooltip longitude.
     * @param [pLngLat.lat] - Tooltip latitude.
     */
    displayPopup(pType: string, pLayerId: number, pFeatureId: string, pFocusAfterOpen: boolean, pLngLat?: {
        lng?: any;
        lat?: any;
    }): void;
    /**
     * Remove tooltip pop-up.
     * @example
     * <caption>This example close the tooltip pop-up.</caption>
     * apex.region( "regionId" ).closeTooltip();
     */
    closeTooltip(): void;
    /**
     * <p>Remove feature info window pop-up. If layer id or feature id are invalid info window won't be closed.</p>
     * @example
     * <caption>This example close the specified info window pop-up.</caption>
     * apex.region( "regionId" ).closeInfoWindow( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ), "6tgy767836" );
     * @param pLayerId - Id of layer.
     * @param pFeatureId - Feature Id.
     */
    closeInfoWindow(pLayerId: number, pFeatureId: string): void;
    /**
     * <p>Remove all info window pop-ups from layer. If no layer id is given all info windows will be closed.</p>
     * @example
     * <caption>This example close all opened info window pop-ups.</caption>
     * apex.region( "regionId" ).closeAllInfoWindows();
     * @example
     * <caption>This example close all opened info window pop-ups, but only from the specified layer</caption>
     * apex.region( "regionId" ).closeAllInfoWindows( apex.region( "regionId" ).getLayerIdByName( "earthquakes" ) );
     * @param [pLayerId] - Only required to close info windows from a specific layer.
     */
    closeAllInfoWindows(pLayerId?: number): void;
    /**
     * <p>Return the current map window bbox and the zoom level in one object. If map initialization has not been completed return an empty object.</p>
     * @example
     * <caption>This example gets the current map window BBOX and the zoom level in one object.</caption>
     * apex.region( "regionId" ).getMapBboxAndZoomLevel();
     * @returns An object containing the bbox and zoom properties.
     */
    getMapBboxAndZoomLevel(): any;
    /**
     * <p>Return the current map center and the zoom level in one object. If map initialization has not been completed return an empty object.</p>
     * @example
     * <caption>This example gets the current map center and the zoom level in one object.</caption>
     * apex.region( "regionId" ).getMapCenterAndZoomLevel();
     * @returns An object containing the center and zoom properties.
     */
    getMapCenterAndZoomLevel(): any;
    /**
     * <p>Return the current map pitch and the bearing values in one object. If map initialization has not been completed return an empty object.</p>
     * @example
     * <caption>This example gets the map pitch and bearing properties in one object.</caption>
     * apex.region( "regionId" ).getMapPitchAndBearing();
     * @returns An object containing the pitch and bearing properties.
     */
    getMapPitchAndBearing(): any;
    /**
     * <p>Zooms the map to the specified level. If map initialization has not been completed zoom level can't be set.</p>
     * @example
     * <caption>This example sets the zoom level to 3.</caption>
     * apex.region( "regionId" ).setZoomLevel( 3 );
     * @param pZoomLevel - The new zoom level.
     */
    setZoomLevel(pZoomLevel: number): void;
    /**
     * <p>Recenters the map to the specified position. If map initialization has not been completed map center can't be set.</p>
     * @example
     * <caption>This example centers the map to Washington, D.C.</caption>
     * var lng = -77.050636,
     *     lat = 38.889248;
     * apex.region( "regionId" ).setCenter( [ lng, lat ] );
     * @param pCenter - Longitude, latitude array.
     */
    setCenter(pCenter: object[]): void;
    /**
     * <p>Returns the {@link https://maplibre.org/maplibre-gl-js/docs/API/classes/Map/ MapLibre GL JS Map} object.
     * If map initialization has not been completed return null.</p>
     * <p>Developer code that uses the MapLibre API may not be forward compatible should the MapLibre API change.</p>
     * @example
     * <caption>This example gets the MapLibre map object.</caption>
     * apex.region( "regionId" ).getMapObject();
     * @returns The MapLibre object to call MapLibre API functions on.
     */
    getMapObject(): any;
    /**
     * Returns the current circle, which has been drawn with the circle tool.
     * @example
     * <caption>This example gets the current circle drawn with circle tool.</caption>
     * apex.region( "regionId" ).getCircle();
     * @returns The drawn circle coordinates as a GeoJSON polygon, null if no circle has been drawn.
     */
    getCircle(): any;
    /**
     * Removes (clears) the drawn circle from the map. Does nothing if no circle has been drawn.
     * @example
     * <caption>This example removes the circle drawn with the circle tool.</caption>
     * apex.region( "regionId" ).clearCircle();
     */
    clearCircle(): void;
    /**
     * Resets the map instance.
     * @example
     * <caption>This example resets the map instance.</caption>
     * apex.region( "regionId" ).reset();
     */
    reset(): void;
    /**
     * <p>Return the current map bbox, zoom level, pitch and bearing values in one object. If map initialization has not been completed return an empty object.</p>
     * @example
     * <caption>This example gets the current map bbox, zoom level, pitch and bearing values in one object.</caption>
     * apex.region( "regionId" ).getMapStatus();
     * @returns An object containing the bbox, zoom, pitch and bearing properties.
     */
    getMapStatus(): any;
}

/**
 * <p>The templateReportRegion interface is used to access the properties and methods of any
 * Template Component Report region.
 * You get access to the templateReportRegion interface with the {@link apex.region} function when passed
 * the regionId (static ID) of a Template Component Report region.
 * </p>
 * <p>Template Component Reports are server rendered regions and have only a few client side API methods.
 * The contents of the report are called rows even if the template component UI may look different such as
 * with cards where multiple cards/rows are on the same visual row.</p>
 */
declare interface templateReportRegion extends region {
    /**
     * <p>Set focus to the templateReport if possible. If the view supports selection or focus
     * then the last focused (current) row will be focused. Otherwise, the first focusable
     * element within the report, if any, will be focused.</p>
     * @example
     * <caption>This example puts focus in the report.</caption>
     * apex.region( "regionStaticId" ).focus();
     */
    focus(): void;
    /**
     * <p>Returns the current row as a jQuery object.
     * The current row is the row that has or last had focus.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     * @example
     * <caption>This example get the current row in the report.</caption>
     * var current$ = apex.region( "regionStaticId" ).getCurrentRow();
     * console.log( "make use of current row", current$ );
     * @returns The current row or null if not supported.
     */
    getCurrentRow(): jQuery;
    /**
     * <p>Sets the last focused row to the given pRow$. If pRow$ is not a row
     * or not in the report container the current row is not changed.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     * <p>The {@link apex.event:apexcurrentrowchange} event is triggered any time the current row changes.</p>
     * @example
     * <caption>This example finds a particular row using jQuery and then makes it the
     * current row and sets focus to it. In this example report rows have class "my-item".</caption>
     * var current$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setCurrentRow( current$, true );
     * @param pRow$ - The row to make current.
     * @param [pFocus] - If true also focus the row.
     */
    setCurrentRow(pRow$: jQuery, pFocus?: boolean): void;
    /**
     * <p>Returns the value of the current row.
     * The current row is the row that has or last had focus.
     * The value of a row is its primary key in the <code class="prettyprint">data-id</code> attribute.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     * @returns The current row value or null if not supported.
     */
    getCurrentRowValue(): string;
    /**
     * <p>Sets the last focused row to the one with the given pRowValue. If no row has the given value
     * the current row is not changed. The row must be rendered in order to be made the current row.
     * The value of a row is its primary key in the <code class="prettyprint">data-id</code> attribute.
     * This attribute is typically added with the #APEX$ROW_IDENTIFICATION# placeholder.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     * <p>The {@link apex.event:apexcurrentrowchange} event is triggered any time the current row changes.</p>
     * @param pRowValue - The value of a row.
     * @param [pFocus] - If true also focus the row.
     */
    setCurrentRowValue(pRowValue: string, pFocus?: boolean): void;
    /**
     * <p>Return the currently selected rows as a jQuery collection.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     * <p>Because this returns a jQuery collection it can only return selected rows that are
     * currently in the DOM. When using virtual scroll pagination with show total count on,
     * it is better to use {@link templateReportRegion#getSelectedValues}</p>
     * <p>See also {@link templateReportRegion#setSelection}.</p>
     * @example
     * <caption>This example get the current selection.</caption>
     * var selection$ = apex.region( "regionStaticId" ).getSelection();
     * console.log( "make use of selected rows", selection$ );
     * @returns The selected row elements as a jQuery collection.
     * Returns null if selection isn't supported or the report is not initialized.
     */
    getSelection(): jQuery;
    /**
     * <p>Set the selected rows. Triggers the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     * <p>See also {@link templateReportRegion#getSelection}.</p>
     * @example
     * <caption>This example finds a particular row using jQuery and then selects it
     * and sets focus to it. In this example report rows have class "my-item".</caption>
     * var toSelect$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setSelection( toSelect$, true );
     * @param pElements$ - A jQuery object with row elements such as the return value of getSelection.
     * @param [pFocus] - If true the first row element of the selection is given focus.
     * @param [pNoNotify] - If true the selection change event will be suppressed.
     */
    setSelection(pElements$: jQuery, pFocus?: boolean, pNoNotify?: boolean): void;
    /**
     * <p>Select all the rows in the report that can be selected. Triggers the
     * {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the report supports multiple selection and
     * if the report has a select all control.</p>
     * @example
     * <caption>This example selects all the rows in the report.</caption>
     * apex.region( "regionStaticId" ).selectAll();
     * @param [pFocus] - If true the first selected row is given focus.
     * @param [pNoNotify] - If true the selection change notification will be suppressed.
     */
    selectAll(pFocus?: boolean, pNoNotify?: boolean): void;
    /**
     * <p>Returns the value for each selected row.
     * The value of a row is its primary key in the <code class="prettyprint">data-id</code> attribute.
     * This attribute is typically added with the #APEX$ROW_IDENTIFICATION# placeholder.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     * @returns Array of selected record values.
     * Returns null if selection is not supported.
     */
    getSelectedValues(): string[];
    /**
     * <p>Selects the report rows that correspond to the given values.
     * The value of a row is the primary key in the <code class="prettyprint">data-id</code> attribute.
     * This attribute is typically added with the #APEX$ROW_IDENTIFICATION# placeholder.
     * Triggers the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     * @param pValues - Array of row values to select.
     * @param [pFocus] - If true the first row of the selection is given focus.
     * @param [pNoNotify] - If true the selection change event will be suppressed.
     * @returns Count of the rows actually selected or -1 if called before the report is initialized or
     * there is no data or selection is not supported.
     */
    setSelectedValues(pValues: string[], pFocus?: boolean, pNoNotify?: boolean): number;
    /**
     * <p>Display the first page of rows. If pagination type is scroll
     * then this simply scrolls to the top of the viewport
     * and a new page of rows is added if needed. If pagination type is not scroll
     * and not already on the first page the view is refreshed and shows the first page.</p>
     * @example
     * <caption>This example goes to the first page.</caption>
     * apex.region( "regionStaticId" ).firstPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    firstPage(): boolean;
    /**
     * <p>Display the previous page of rows. If pagination type is scroll
     * the viewport scrolls up one page and
     * rows are added if needed. If pagination type is not scroll
     * and not on the first page refresh the view to show the previous page.</p>
     * @example
     * <caption>This example goes to the previous page.</caption>
     * apex.region( "regionStaticId" ).previousPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    previousPage(): boolean;
    /**
     * <p>Display the next page of rows. If pagination type is scroll
     * the viewport scrolls down one page and
     * rows are added if needed. If pagination type is not scroll
     * and not on the last page refresh the view to show the next page.</p>
     * @example
     * <caption>This example goes to the next page.</caption>
     * apex.region( "regionStaticId" ).nextPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    nextPage(): boolean;
    /**
     * <p>Display the last page of rows. If pagination type is scroll
     * this simply scrolls to the bottom of the viewport
     * and a new page of rows is added if needed. pagination type is not scroll
     * and not already on the last page the view is refreshed and shows the last page.
     * This method only works correctly if the report knows the total number of rows.</p>
     * @example
     * <caption>This example goes to the last page.</caption>
     * apex.region( "regionStaticId" ).lastPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    lastPage(): boolean;
    /**
     * <p>The templateReportRegion type is "TemplateComponent".</p>
     */
    type: string;
    /**
     * <p>Refreshes the report with new data from the server.</p>
     * @returns A promise that is resolved with no arguments when the refresh is complete.
     */
    refresh(): Promise<any>;
}

/**
 * <p>The cardsRegion interface is used to access the properties and methods of Cards regions.
 * You get access to the cardsRegion interface with the {@link apex.region} function when passed
 * the regionId (static ID) of a Cards region.
 * </p>
 * <p>Cards is a client rendered region using {@link model} for the data layer and {@link tableModelView}
 * widget for the view layer. This interface is a convenient wrapper for most of the methods
 * of {@link tableModelView}. The cards in the report are called items
 * (not to be confused with APEX Page Items or Column Items).
 * See {@link tableModelView} for information about report markup requirements.</p>
 */
declare interface cardsRegion extends region {
    /**
     * <p>Set focus to the cards region if possible. If the view supports selection or focus
     * then the last focused (current) item will be focused. Otherwise, the first focusable
     * element within the report, if any, will be focused.</p>
     * @example
     * <caption>This example puts focus in the report.</caption>
     * apex.region( "regionStaticId" ).focus();
     */
    focus(): void;
    /**
     * <p>Return the model currently being used by this view.
     * The model can change over time so the returned model should not be saved and used later.
     * If you need to store a reference to the model use {@link apex.model.get} and release it with
     * {@link apex.model.release}.
     * </p>
     * @returns The current {@link model}.
     */
    getModel(): model;
    /**
     * <p>Return information about the current pagination state of the view.
     * Returns null if there is no data in the report.</p>
     * @example
     * <caption>This example logs to the console the current page and total number of pages
     * The Cards region pagination type must be Page and Show Total Count must be on.</caption>
     * var info = apex.region( "regionStaticId" ).getPageInfo();
     * console.log("current and total pages", info.currentPage, info.totalPages );
     */
    getPageInfo(): tableModelViewBase.pageInfo;
    /**
     * <p>Returns the current item as a jQuery object.
     * The current item is the item that has or last had focus.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * or "focus". See also {@link cardsRegion#setCurrentItem}.</p>
     * @example
     * <caption>This example get the current item in the report.</caption>
     * var currentItem$ = apex.region( "regionStaticId" ).getCurrentItem();
     * console.log( "make use of current item", currentItem$ );
     * @returns The current item or null if not supported.
     */
    getCurrentItem(): jQuery;
    /**
     * <p>Sets the last focused item to the given pItem$. If pItem$ is not an item
     * or not in the report container the current item is not changed.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * or "focus". See also {@link cardsRegion#getCurrentItem}.</p>
     *
     * <p>The {@link tableModelView#event:currentitemchange} event
     * and the {@link apex.event:apexcurrentrowchange} event are triggered any time the current item changes.</p>
     * @example
     * <caption>This example finds a particular item using jQuery and then makes it the
     * current item and sets focus to it. In this example report items have class "my-item".</caption>
     * var currentItem$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setCurrentItem( currentItem$, true );
     * @param pItem$ - The item to make current.
     * @param [pFocus] - If true also focus the item.
     */
    setCurrentItem(pItem$: jQuery, pFocus?: boolean): void;
    /**
     * <p>Returns the value of the current item.
     * The current item is the item that has or last had focus.
     * The value of an item is its unique identifier as returned by {@link model#getRecordId}.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "focus"
     * or "select". See also {@link cardsRegion#setCurrentItemValue}.</p>
     * @returns The current item value or null if not supported.
     */
    getCurrentItemValue(): string;
    /**
     * <p>Sets the last focused item to the one with the given pItemValue. If no item has the given value
     * the current item is not changed. The item must be rendered in order to be made the current item.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * or "focus". See also {@link cardsRegion#getCurrentItemValue}.</p>
     *
     * <p>The {@link tableModelView#event:currentitemchange} event
     * and the {@link apex.event:apexcurrentrowchange} event are triggered any time the current item changes.</p>
     * @param pItemValue - The value of an item.
     * @param [pFocus] - If true also focus the item.
     */
    setCurrentItemValue(pItemValue: string, pFocus?: boolean): void;
    /**
     * <p>Return the currently selected items as a jQuery collection.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     * <p>Because this returns a jQuery collection it can only return selected items that are
     * currently in the DOM. When using virtual scroll pagination and {@link tableModelView#persistSelection} is
     * true it is better to use {@link cardsRegion#getSelectedRecords}</p>
     * <p>See also {@link cardsRegion#setSelection}.</p>
     * @returns The selected item elements as a jQuery collection.
     * Returns null if selection isn't supported or the report is not initialized.
     */
    getSelection(): jQuery;
    /**
     * <p>Set the selected items. Triggers the {@link tableModelView#event:selectionchange} event
     * and the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select".</p>
     * <p>See also {@link cardsRegion#getSelection}.</p>
     * @example
     * <caption>This example finds a particular item using jQuery and then selects it
     * and sets focus to it. In this example report items have class "my-item".</caption>
     * var item$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setSelection( item$, true );
     * @param pElements$ - A jQuery object with item elements such as the return value of
     *   {@Link cardsRegion#getSelection}.
     * @param [pFocus] - If true the first item element of the selection is given focus.
     * @param [pNoNotify] - If true the selection change event will be suppressed.
     */
    setSelection(pElements$: jQuery, pFocus?: boolean, pNoNotify?: boolean): void;
    /**
     * <p>Select all the items in the report that can be selected. Triggers the
     * {@link tableModelView#event:selectionchange} event and the
     * {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * and {@link tableModelView#multiple} and {@link tableModelView#selectAll(1)} options are both true.</p>
     *
     * <p>This only applies to the current page or what has been rendered so far unless the selection
     * state is persisted in the model.
     * See {@link tableModelView#selectAll(1)} for details about how pagination settings and
     * {@link tableModelView#persistSelection} affect the meaning of "all items".</p>
     * @example
     * <caption>This example selects all the items in the report.</caption>
     * apex.region( "regionStaticId" ).selectAll();
     * @param [pFocus] - If true the first selected item is given focus.
     * @param [pNoNotify] - If true the selection change notification will be suppressed.
     */
    selectAll(pFocus?: boolean, pNoNotify?: boolean): void;
    /**
     * <p>Returns the value for each record returned by {@link cardsRegion#getSelectedRecords}.
     * The value of a record is its unique identifier as returned by {@link model#getRecordId}.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     * @returns Array of selected record values.
     * Returns null if selection is not supported.
     */
    getSelectedValues(): string[];
    /**
     * <p>Selects the report items that correspond to the given values.
     * The value of an item is the unique identifier of the corresponding model record
     * as returned by {@link model#getRecordId}
     * and also the value of the item's <code class="prettyprint">data-id</code> attribute.
     * Triggers the {@link tableModelView#event:selectionchange} event
     * and the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     * @param pValues - Array of item/record values to select.
     * @param [pFocus] - If true the first record of the selection is given focus.
     * @param [pNoNotify] - If true the selection change event will be suppressed.
     * @returns Count of the items actually selected or -1 if called before the report is initialized or
     * there is no data or selection is not supported.
     */
    setSelectedValues(pValues: string[], pFocus?: boolean, pNoNotify?: boolean): number;
    /**
     * <p>Given a jQuery object with one or more item elements return the corresponding model records.
     * For this to work the elements must have a <code class="prettyprint">data-id</code>
     * attribute with the value of the record id.</p>
     * @param pElements$ - A jQuery object of item elements such as returned
     *   by {@link cardsRegion#getSelection}.
     * @returns Array of records from the model corresponding to the item elements.
     */
    getRecords(pElements$: jQuery): Model.Record[];
    /**
     * <p>Return the underlying data model records corresponding to the current selection.</p>
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     *
     * <p>When using virtual scroll pagination and {@link tableModelView#persistSelection} is
     * true it is possible for the user to select a range of records or all records when the model
     * does not yet contain all the selected records. In this case the selection is incomplete
     * and only the records currently in the model will be returned. See option
     * {@link tableModelView#loadIncompleteSelection} for how an incomplete selection is handled.</p>
     * <p>See also {@link cardsRegion#setSelectedRecords}.</p>
     * @returns Array of records from the model corresponding to the selected items.
     * Returns null if selection is not supported.
     */
    getSelectedRecords(): Model.Record[];
    /**
     * <p>Selects the report items that correspond to the given data model records.
     * Triggers the {@link tableModelView#event:selectionchange} event
     * and the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     * <p>See also {@link cardsRegion#getSelectedRecords}.</p>
     * @param pRecords - Array of data model records to select.
     * @param [pFocus] - If true the first record of the selection is given focus.
     * @param [pNoNotify] - If true the selection change event will be suppressed.
     * @returns Count of the items actually selected or -1 if called before the report is initialized or
     * there is no data or selection is not supported.
     */
    setSelectedRecords(pRecords: Model.Record[], pFocus?: boolean, pNoNotify?: boolean): number;
    /**
     * <p>Display the first page of items. If option <code class="prettyprint">pagination.scroll</code>
     * is true simply scrolls to the top of the viewport
     * and a new page of items is added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not already on the first page the view is refreshed and shows the first page.</p>
     * @example
     * <caption>This example goes to the first page.</caption>
     * apex.region( "regionStaticId" ).firstPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    firstPage(): boolean;
    /**
     * <p>Display the previous page of items. If <code class="prettyprint">pagination.scroll</code>
     * is true the viewport scrolls up one page and
     * records are added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not on the first page refresh the view to show the previous page.</p>
     * @example
     * <caption>This example goes to the previous page.</caption>
     * apex.region( "regionStaticId" ).previousPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    previousPage(): boolean;
    /**
     * <p>Display the next page of items. If <code class="prettyprint">pagination.scroll</code>
     * is true the viewport scrolls down one page and
     * records are added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not on the last page refresh the view to show the next page.</p>
     * @example
     * <caption>This example goes to the next page.</caption>
     * apex.region( "regionStaticId" ).nextPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    nextPage(): boolean;
    /**
     * <p>Display the last page of items. If <code class="prettyprint">pagination.scroll</code>
     * is true simply scrolls to the bottom of the viewport
     * and a new page of items is added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not already on the last page the view is refreshed and shows the last page.
     * This method only works correctly if the model knows the total number of rows.</p>
     * @example
     * <caption>This example goes to the last page.</caption>
     * apex.region( "regionStaticId" ).lastPage();
     * @returns true for success, false if a page is currently being rendered.
     */
    lastPage(): boolean;
    /**
     * <p>Go to the specified page number. This should only be used when
     * <code class="prettyprint">pagination.scroll</code> is false and the model knows the total number of records.</p>
     * @example
     * <caption>This example goes to 4th page. Note that the page numbers are zero based.
     * If there are not that many pages then nothing happens.</caption>
     * apex.region( "regionStaticId" ).gotoPage( 3 );
     * @param pPageNumber - zero based page number
     * @returns true for success, false if a page is currently being rendered.
     */
    gotoPage(pPageNumber: number): boolean;
    /**
     * <p>Load more records into the view. If option <code class="prettyprint">pagination.scroll</code>
     * is true this adds a new page of items to the end.
     * If <code class="prettyprint">pagination.scroll</code> is false this is the same as
     * <code class="prettyprint">nextPage</code>.
     * This is intended to be used when <code class="prettyprint">pagination.loadMore</code> is true.</p>
     * @returns true for success, false if a page is currently being rendered.
     */
    loadMore(): boolean;
    /**
     * <p>The cardsRegion type is "Cards".</p>
     */
    type: string;
    /**
     * <p>Refreshes the report with new data from the server.</p>
     * @returns A promise that is resolved with no arguments when the refresh is complete.
     */
    refresh(): Promise<any>;
    /**
     * <p>Refreshes the view (re-renders the DOM) without fetching new data from the server.</p>
     */
    refreshView(): void;
}

