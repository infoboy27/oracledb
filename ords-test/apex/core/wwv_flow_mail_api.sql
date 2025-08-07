set define off
set verify off
prompt ...wwv_flow_mail_api
create or replace package wwv_flow_mail_api as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 2012 - 2022. All Rights Reserved.
--
-- You can use the `APEX_MAIL` package to send an email from an Oracle Application
-- Express application. This package is built on top of the Oracle supplied `UTL_SMTP`
-- package. Because of this dependence, the `UTL_SMTP` package must be installed and
-- functioning to use `APEX_MAIL`.
--
-- `APEX_MAIL` contains three notable procedures. Use `APEX_MAIL.SEND` to send an outbound
-- email message from your application. Use `APEX_MAIL.PUSH_QUEUE` to deliver mail
-- messages stored in `APEX_MAIL_QUEUE`. Use `APEX_MAIL.ADD_ATTACHMENT` to send an
-- outbound email message from your application as an attachment.
--
-- Oracle APEX installs the database job `ORACLE_APEX_MAIL_QUEUE`,
-- which periodically sends all mail messages stored in the active mail queue.
--
-- Note:
-- The `APEX_MAIL` package may be used from outside the context of an Application
-- Express application (such as from a Database Scheduler job) as long as the
-- database user making the call is mapped to an Oracle APEX workspace.
-- If the database user is mapped to multiple workspaces, you must first call
-- `APEX_UTIL.SET_WORKSPACE` or `APEX_UTIL.SET_SECURITY_GROUP_ID` as in the following
-- examples. The `APEX_MAIL` package cannot be used by database users that are not
-- mapped to any workspace unless they have been granted the role
-- `APEX_ADMINISTRATOR_ROLE`.
--
-- Example:
-- apex_util.set_workspace(p_workspace => 'MY_WORKSPACE');
--
-- Example:
-- for c1 in (
--   select workspace_id
--     from apex_applications
--    where application_id = 100 )
-- loop
--   apex_util.set_security_group_id(p_security_group_id => c1.workspace_id);
-- end loop;
--
--------------------------------------------------------------------------------

--##############################################################################
--
-- Sending Mail
--
--##############################################################################

--==============================================================================
-- This procedure sends an outbound email message from an application. Although
-- you can use this procedure to pass in either a `VARCHAR2` or a `CLOB` to `p_body`
-- and `p_body_html`, the data types must be the same. In other words, you cannot
-- pass a `CLOB` to `p_body` and a `VARCHAR2` to `p_body_html`.
--
-- When using `APEX_MAIL.SEND`, remember the following:
-- - No single line may exceed 1000 characters. The SMTP/MIME specification
--   dictates that no single line shall exceed 1000 characters. To comply with
--   this restriction, you must add a carriage return or line feed characters to
--   break up your `p_body` or `p_body_html` parameters into chunks of 1000 characters
--   or less. Failing to do so results in erroneous email messages, including
--   partial messages or messages with extraneous exclamation points.
-- - Plain text and HTML email content. Passing a value to `p_body`, but not
--   `p_body_html` results in a plain text message. Passing a value to `p_body` and
--   `p_body_html` yields a multi-part message that includes both plain text and
--   HTML content. The settings and capabilities of the recipient's email client
--   determine what displays. Although most modern email clients can read an HTML
--   formatted email, remember that some users disable this functionality to
--   address security issues.
-- - Avoid images. When referencing images in `p_body_html` using the `<img />` tag,
--   remember that the images must be accessible to the recipient's email client
--   in order for them to see the image. For example, suppose you reference an
--   image on your network called `hello.gif` as follows:
--   `<img src="http://someserver.com/hello.gif" alt="Hello" />`
--   In this example, the image is not attached to the email, but is referenced
--   by the email. For the recipient to see it, they must be able to access the
--   image using a web browser. If the image is inside a firewall and the
--   recipient is outside of the firewall, the image is not displayed.
--   Alternatively, you may specify the `p_content_id` parameter when calling
--   `APEX_MAIL.ADD_ATTACHMENT` which creates an inline attachment that can be
--   referenced as follows:
--   `<img src="cid:hello_content_id" alt="Hello" />`
--   But note that this may greatly increase the size of the resultant emails
--   and that clients may not always automatically display inline images. For
--   these reasons, avoid using images. If you must include images, be sure to
--   include the ALT attribute to provide a textual description in the event
--   the image is not accessible or displayed.
--
-- Parameters:
-- * p_to:        Valid email address to which the email is sent (required).
--                For multiple email addresses, use a comma-separated list
-- * p_from:      Email address from which the email is sent (required).
--                This email address must be a valid address. Otherwise, the
--                message is not sent.
--                Please note:
--                If an instance administrator has already defined a 'Default Email From Address'
--                on the instance level, this address will ALWAYS be used as the 'from' address.
-- * p_body:      Body of the email in plain text, not HTML (required). If a value
--                is passed to `p_body_html`, then this is the only text the recipient
--                sees. If a value is not passed to `p_body_html`, then this text only
--                displays for email clients that do not support HTML or have HTML
--                disabled. A carriage return or line feed (CRLF) must be included
--                every 1000 characters.
-- * p_body_html: Body of the email in HTML format. This must be a full HTML document
--                including the <html> and <body> tags. A single line cannot exceed
--                1000 characters without a carriage return or line feed (CRLF)
-- * p_subj:      Subject of the email
-- * p_cc:        Valid email addresses to which the email is copied. For multiple
--                email addresses, use a comma-separated list
-- * p_bcc:       Valid email addresses to which the email is blind copied. For
--                multiple email addresses, use a comma-separated list
-- * p_replyto:   Address of the Reply-To mail header. You can use this parameter
--                as follows:
--                - If you omit the `p_replyto` parameter, the Reply-To mail header
--                  is set to the value specified in the `p_from` parameter
--                - If you include the `p_replyto` parameter, but provide a NULL
--                  value, the Reply-To mail header is set to NULL. This results
--                  in the suppression of automatic email replies
--                - If you include `p_replyto` parameter, but provide a non-null
--                  value (for example, a valid email address), you send these
--                  messages, but the automatic replies go to the value specified
--                  (for example, the email address)
--
-- Example:
-- The following example demonstrates how to use APEX_MAIL.SEND to send a plain text
-- email message from an application.
--
-- DECLARE
--   l_body CLOB;
-- BEGIN
--   l_body := 'Thank you for your interest in the APEX_MAIL package.'||utl_tcp.crlf||utl_tcp.crlf;
--   l_body := l_body ||'  Sincerely,'||utl_tcp.crlf;
--   l_body := l_body ||'  The Oracle APEX Dev Team'||utl_tcp.crlf;
--   apex_mail.send(
--     p_to   => 'some_user@somewhere.com',   -- change to your email address
--     p_from => 'some_sender@somewhere.com', -- change to a real senders email address
--     p_body => l_body,
--     p_subj => 'APEX_MAIL Package - Plain Text message');
-- END;
-- /
--
-- Example:
-- The following example demonstrates how to use APEX_MAIL.SEND to send an HTML email
-- message from an application. Remember, you must include a carriage return or line
-- feed (CRLF) every 1000 characters. The example that follows uses utl_tcp.crlf.
--
-- DECLARE
--   l_body      CLOB;
--   l_body_html CLOB;
-- BEGIN
--   l_body := 'To view the content of this message, please use an HTML enabled mail client.'||utl_tcp.crlf;
--
--   l_body_html := '<html>
--     <head>
--       <style type="text/css">
--         body{font-family: Arial, Helvetica, sans-serif;
--           font-size:10pt;
--           margin:30px;
--           background-color:#ffffff;}
--
--         span.sig{font-style:italic;
--           font-weight:bold;
--           color:#811919;}
--       </style>
--     </head>
--     <body>'||utl_tcp.crlf;
--   l_body_html := l_body_html ||'<p>Thank you for your interest in the <strong>APEX_MAIL</strong> package.</p>'||utl_tcp.crlf;
--   l_body_html := l_body_html ||'  Sincerely,<br />'||utl_tcp.crlf;
--   l_body_html := l_body_html ||'  <span class="sig">The Oracle APEX Dev Team</span><br />'||utl_tcp.crlf;
--   l_body_html := l_body_html ||'</body></html>';
--   apex_mail.send(
--     p_to   => 'some_user@somewhere.com',   -- change to your email address
--     p_from => 'some_sender@somewhere.com', -- change to a real senders email address
--     p_body      => l_body,
--     p_body_html => l_body_html,
--     p_subj      => 'APEX_MAIL Package - HTML formatted message');
-- END;
-- /
--==============================================================================
procedure send (
    p_to        in varchar2,
    p_from      in varchar2,
    p_body      in varchar2,
    p_body_html in varchar2 default null,
    p_subj      in varchar2 default null,
    p_cc        in varchar2 default null,
    p_bcc       in varchar2 default null,
    p_replyto   in varchar2 default null );

procedure send (
    p_to        in varchar2,
    p_from      in varchar2,
    p_body      in clob,
    p_body_html in clob     default null,
    p_subj      in varchar2 default null,
    p_cc        in varchar2 default null,
    p_bcc       in varchar2 default null,
    p_replyto   in varchar2 default null );

--==============================================================================
-- This procedure adds a mail to the mail queue of Oracle APEX. The mail
-- is based on an email template where the placeholder values specified as JSON
-- string are substituted.
--
-- Parameters:
-- * p_template_static_id: Static identifier string, used to identify the shared
--                         component email template.
-- * p_placeholders:       JSON string representing the placeholder names along
--                         with the values, to be substituted.
-- * p_to:                 Valid email address to which the email is sent (required).
--                         For multiple email addresses, use a comma-separated list.
-- * p_cc:                 Valid email addresses to which the email is copied.
--                         For multiple email addresses, use a comma-separated list.
-- * p_bcc:                Valid email addresses to which the email is blind copied.
--                         For multiple email addresses, use a comma-separated list.
-- * p_from:               This must be a valid email address from which the email is sent.
--                         If `p_from`is not provided:
--                         * the 'Application Email From Address' will be used (if provided under 'Application Definition')
--                         * else, `p_replyto` will be used (if provided)
--                         * else, `p_to` will be used,
--                         when the email is sent.
--                         Please note:
--                         If `p_to` or `p_replyto` contain multiple email addresses, `p_from` is required!
--                         Please note:
--                         If an instance administrator has already defined a 'Default Email From Address' on the instance
--                         level, this address will ALWAYS be used as the 'from' address, no matter `p_from` being provided or not.
-- * p_replyto:            Specify a valid email address to instruct recipient's email client to send human-generated replies
--                         to this address rather than the address specified in `p_from`.
-- * p_application_id:     Application ID where the email template is defined.
--                         Defaults to the current application (if called from
--                         within an application).
-- * p_language_override:  language of a translated template to use. Use a language code
--                         like "en", "fr" or "de-at" here. An application translation
--                         for this language must exist, otherwise the argument is
--                         being ignored.
--
-- Note:
-- When calling the SEND procedure from outside the context of an Oracle APEX
-- application (such as from a Database Scheduler job), you must specify the
-- p_application_id parameter.
--
-- Example:
-- begin
--   apex_mail.send (
--     p_template_static_id => 'ORDER',
--     p_placeholders       => '{ "ORDER_NUMBER": 5321, "ORDER_DATE": "01-Feb-2018", "ORDER_TOTAL": "$12,000" }',
--     p_to                 => 'some_user@somewhere.com' );
-- end;
--==============================================================================
procedure send (
    p_template_static_id in varchar2,
    p_placeholders       in clob,
    p_to                 in varchar2,
    p_cc                 in varchar2 default null,
    p_bcc                in varchar2 default null,
    p_from               in varchar2 default null,
    p_replyto            in varchar2 default null,
    p_application_id     in number   default wwv_flow_security.g_flow_id,
    p_language_override  in varchar2 default null );

--==============================================================================
-- This function sends an outbound email message from an application. Although
-- you can use this function to pass in either a `VARCHAR2` or a `CLOB` to
-- `p_body` and `p_body_html`, the data types must be the same. In other words,
-- you cannot pass a `CLOB` to `p_body` and a `VARCHAR2` to `p_body_html`.
--
-- For more details see the documentation for the `APEX_MAIL.SEND` procedure.
--
-- Returns:
-- This function returns a `NUMBER` representing the unique numeric
-- identifier associated with the mail message. This unique identifier can be
-- used in a call to `APEX_MAIL.ADD_ATTACHMENT` to attach files to the mail.
--
-- Example:
-- The following example demonstrates how to use APEX_MAIL.SEND to send a plain text email message from an application and return the unique message ID.
--
-- DECLARE
--   l_body CLOB;
--   l_id   NUMBER;
-- BEGIN
--   l_body := 'Thank you for your interest in the APEX_MAIL package.'||utl_tcp.crlf||utl_tcp.crlf;
--   l_body := l_body ||'  Sincerely,'||utl_tcp.crlf;
--   l_body := l_body ||'  The Oracle APEX Dev Team'||utl_tcp.crlf;
--   l_id   := apex_mail.send(
--     p_to   => 'some_user@somewhere.com',   -- change to your email address
--     p_from => 'some_sender@somewhere.com', -- change to a real senders email address
--     p_body => l_body,
--     p_subj => 'APEX_MAIL Package - Plain Text message');
-- END;
-- /
--==============================================================================
function send (
    p_to        in varchar2,
    p_from      in varchar2,
    p_body      in varchar2,
    p_body_html in varchar2 default null,
    p_subj      in varchar2 default null,
    p_cc        in varchar2 default null,
    p_bcc       in varchar2 default null,
    p_replyto   in varchar2 default null )
    return number;

function send (
    p_to        in varchar2,
    p_from      in varchar2,
    p_body      in clob,
    p_body_html in clob     default null,
    p_subj      in varchar2 default null,
    p_cc        in varchar2 default null,
    p_bcc       in varchar2 default null,
    p_replyto   in varchar2 default null )
    return number;

--==============================================================================
-- This function returns a mail id after adding the mail to the mail queue of
-- Oracle APEX. The mail id can be used in a call to add_attachment to
-- add attachments to an existing mail.
--
-- The mail is based on an email template where the placeholder values specified
-- as JSON string are substituted.
--
-- For more details see the `APEX_MAIL.SEND` procedure.
--
-- Note:
-- When calling the SEND function from outside the context of an Application
-- Express application (such as from a Database Scheduler job), you must specify
-- the p_application_id parameter.
--
-- Example:
-- declare
--   l_mail_id number;
-- begin
--   l_mail_id := apex_mail.send (
--     p_template_static_id => 'ORDER',
--     p_placeholders       => '{ "ORDER_NUMBER": 5321, "ORDER_DATE": "01-Feb-2018", "ORDER_TOTAL": "$12,000" }',
--     p_to                 => 'some_user@somewhere.com' );
--
--   apex_mail.add_attachment (
--     p_mail_id    => l_mail_id,
--     p_attachment => ... );
-- end;
--==============================================================================
function send (
    p_template_static_id in varchar2,
    p_placeholders       in clob,
    p_to                 in varchar2,
    p_cc                 in varchar2 default null,
    p_bcc                in varchar2 default null,
    p_from               in varchar2 default null,
    p_replyto            in varchar2 default null,
    p_application_id     in number   default wwv_flow_security.g_flow_id,
    p_language_override  in varchar2 default null )
    return number;

--##############################################################################
--
-- Adding Attachments
--
--##############################################################################

--==============================================================================
-- This procedure adds an attachment of type `BLOB` to an outbound email message.
-- To add multiple attachments to a single email, `APEX_MAIL.ADD_ATTACHMENT` can
-- be called repeatedly for a single email message.
--
-- Parameters:
-- * p_mail_id:    The numeric ID associated with the email. This is the numeric
--                 identifier returned from the call to `APEX_MAIL.SEND` to compose
--                 the email body.
-- * p_attachment: A `BLOB` variable containing the binary content to be attached
--                 to the email message.
-- * p_filename:   The filename associated with the email attachment.
-- * p_mime_type:  A valid MIME type (or Internet media type) to associate with
--                 the email attachment.
-- * p_content_id: An optional identifier for the attachment. If this is non-null
--                 then the file will be attached inline. That attachment may then
--                 be referenced in the HTML of the email body by using the `cid:`
--                 Note: Be aware that automatic displaying of inlined images
--                 may not be supported by all e-mail clients.
--                 Since: 21.2
--
-- Example:
-- The following example demonstrates how to access files stored in
-- `APEX_APPLICATION_FILES` and add them to an outbound email message
--
-- DECLARE
--   l_id NUMBER;
-- BEGIN
--   l_id := APEX_MAIL.SEND(
--     p_to        => 'fred@flintstone.com',
--     p_from      => 'barney@rubble.com',
--     p_subj      => 'APEX_MAIL with attachment',
--     p_body      => 'Please review the attachment.',
--     p_body_html => '<b>Please</b> review the attachment');
--   FOR c1 IN (SELECT filename, blob_content, mime_type
--     FROM APEX_APPLICATION_FILES
--     WHERE ID IN (123,456)) LOOP
--
--     APEX_MAIL.ADD_ATTACHMENT(
--       p_mail_id    => l_id,
--       p_attachment => c1.blob_content,
--       p_filename   => c1.filename,
--       p_mime_type  => c1.mime_type);
--   END LOOP;
--   COMMIT;
-- END;
-- /
--
-- Example:
-- This example shows how to attach a file inline, by using a content identifier,
-- and how to refer to that attachment in the HTML of the email.
--
-- Example:
-- declare
--   l_id         number;
--   l_body       clob;
--   l_body_html  clob;
--   l_content_id varchar2(100) := 'my-inline-image';
--   l_filename   varchar2(100);
--   l_mime_type  varchar2(100);
--   l_image      blob;
-- begin
--   l_body := 'To view the content of this message, please use an HTML enabled mail client.' || utl_tcp.crlf;
--
--   l_body_html := '<html><body>' || utl_tcp.crlf ||
--                  '<p>Here is the image you requested.</p>' || utl_tcp.crlf ||
--                  '<p><img src="cid:' || l_content_id || '" alt="Requested Image"></p>' || utl_tcp.crlf ||
--                  '<p>Thanks,<br />' || utl_tcp.crlf ||
--                  'The Oracle APEX Dev Team<br />' || utl_tcp.crlf ||
--                  '</body></html>';
--   l_id := apex_mail.send (
--     p_to        => 'some_user@somewhere.com',   -- change to your email address
--     p_from      => 'some_sender@somewhere.com', -- change to a real senders email address
--     p_body      => l_body,
--     p_body_html => l_body_html,
--     p_subj      => 'Requested Image' );
--
--   select filename,   mime_type,   blob_content
--     into l_filename, l_mime_type, l_image
--     from apex_application_files
--    where id = 123;
--
--   apex_mail.add_attachment(
--     p_mail_id    => l_id,
--     p_attachment => l_image,
--     p_filename   => l_filename,
--     p_mime_type  => l_mime_type,
--     p_content_id => l_content_id );
--
--   commit;
-- end;
--==============================================================================
procedure add_attachment (
    p_mail_id    in number,
    p_attachment in blob,
    p_filename   in varchar2,
    p_mime_type  in varchar2,
    p_content_id in varchar2 default null );

--==============================================================================
-- This procedure adds an attachment of type `CLOB` to an outbound email message.
-- To add multiple attachments to a single email, `APEX_MAIL.ADD_ATTACHMENT` can
-- be called repeatedly for a single email message.
--
-- Parameters:
-- * p_mail_id:    The numeric ID associated with the email. This is the numeric
--                 identifier returned from the call to `APEX_MAIL.SEND` to compose
--                 the email body.
-- * p_attachment: A `CLOB` variable containing the text content to be attached to
--                 the email message.
-- * p_filename:   The filename associated with the email attachment.
-- * p_mime_type:  A valid MIME type (or Internet media type) to associate with
--                 the email attachment.
--
-- Example:
-- The following example demonstrates how to attach a text file to an outbound
-- email message.
--
-- DECLARE
--   l_id NUMBER;
--   l_clob CLOB := 'Value1,Value2,Value3,42';
-- BEGIN
--   l_id := APEX_MAIL.SEND(
--     p_to => 'fred@flintstone.com',
--     p_from => 'barney@rubble.com',
--     p_subj => 'APEX_MAIL with a text attachment',
--     p_body => 'Please review the attachment.',
--     p_body_html => '<b>Please</b> review the attachment');
--
--   APEX_MAIL.ADD_ATTACHMENT(
--     p_mail_id => l_id,
--     p_attachment => l_clob,
--     p_filename => 'data.csv',
--     p_mime_type => 'text/csv');
--
--   COMMIT;
-- END;
-- /
--==============================================================================
procedure add_attachment (
    p_mail_id    in number,
    p_attachment in clob,
    p_filename   in varchar2,
    p_mime_type  in varchar2 );

--##############################################################################
--
-- General Utilities
--
--##############################################################################

--==============================================================================
-- If an email includes a link to an Oracle APEX instance, use this
-- function to get the instance URL.
--
-- Note:
-- This function requires that the instance setting Oracle APEX Instance
-- URL for emails is set.
--
-- Example:
-- The following example sends an Order Confirmation email which includes an absolute URL to page 10 of application 100.
--
-- declare
--   l_body      clob;
--   l_body_html clob;
-- begin
--   l_body := 'To view the content of this message, please use an HTML enabled mail client.' || utl_tcp.crlf;
--
--   l_body_html := '<html><body>' || utl_tcp.crlf ||
--                  '<p>Please confirm your order on the <a href="' ||
--                  apex_mail.get_instance_url || 'f?p=100:10">Order Confirmation</a> page.</p>' || utl_tcp.crlf ||
--                  '</body></html>';
--   apex_mail.send (
--     p_to        => 'some_user@somewhere.com',   -- change to your email address
--     p_from      => 'some_sender@somewhere.com', -- change to a real senders email address
--     p_body      => l_body,
--     p_body_html => l_body_html,
--     p_subj      => 'Order Confirmation' );
-- end;
--==============================================================================
function get_instance_url return varchar2;

--==============================================================================
-- Use this function to get the image prefixed URL, if the email includes
-- Oracle APEX instance images.
--
-- Note:
-- This function requires that the instance setting "Oracle APEX Images
-- URL" for emails is set!
--
-- Example:
-- declare
--   l_body      clob;
--   l_body_html clob;
-- begin
--   l_body := 'To view the content of this message, please use an HTML enabled mail client.' || utl_tcp.crlf;
--
--   l_body_html := '<html><body>' || utl_tcp.crlf ||
--                  '<p>Please confirm your order on the <a href="' ||
--                  apex_mail.get_instance_url || 'f?p=100:10">Order Confirmation</a> page.</p>' || utl_tcp.crlf ||
--                  '<p>Sincerely,<br />' || utl_tcp.crlf ||
--                  'The Oracle APEX Dev Team<br />' || utl_tcp.crlf ||
--                  '<img src="' || apex_mail.get_images_url || 'oracle.gif" alt="Oracle Logo"></p>' || utl_tcp.crlf ||
--                  '</body></html>';
--   apex_mail.send (
--     p_to        => 'some_user@somewhere.com',   -- change to your email address
--     p_from      => 'some_sender@somewhere.com', -- change to a real senders email address
--     p_body      => l_body,
--     p_body_html => l_body_html,
--     p_subj      => 'Order Confirmation' );
-- end;
--==============================================================================
function get_images_url return varchar2;

--==============================================================================
-- Oracle APEX stores unsent email messages in the `APEX_MAIL_QUEUE`
-- dictionary view. You can manually deliver mail messages stored in this queue to
-- the SMTP gateway by invoking the `APEX_MAIL.PUSH_QUEUE` procedure.
--
-- Oracle APEX logs successfully submitted messages in the `APEX_MAIL_LOG`
-- dictionary view with the timestamp reflecting your server's local time.
--
-- Parameters:
-- * p_smtp_hostname: SMTP gateway host name
-- * p_smtp_portno:   SMTP gateway port number
--
-- Note:
-- These parameter values are provided for backward compatibility, but their respective
-- values are ignored. The SMTP gateway hostname and SMTP gateway port number are
-- exclusively derived from values entered on the Instance Settings page in
-- Administration Services or set using `APEX_INSTANCE_ADMIN API`.
--
-- Example:
-- The following example demonstrates the use of the `APEX_MAIL.PUSH_QUEUE`
-- procedure using a shell script. This example only applies to UNIX/LINUX
-- installations.
--
-- SQLPLUS / <<EOF
-- APEX_MAIL.PUSH_QUEUE;
-- DISCONNECT
-- EXIT
-- EOF
--==============================================================================
procedure push_queue (
    p_smtp_hostname in varchar2 default null,
    p_smtp_portno   in varchar2 default null );

--==============================================================================
-- Procedure to return a formatted mail based on an e-mail template where the
-- placeholders specified as JSON string are substituted.
--
-- Parameters:
-- * p_static_id:          The identifier which was specified when the template was
--                         created in the Oracle APEX Builder.
-- * p_placeholders:       A JSON formatted string containing name/value pairs specifying
--                         values for the placeholders to be replaced in the email template.
-- * p_application_id:     Application ID where the email template is defined. Defaults
--                         to the current application (if called from within an application).
-- * p_subject:            The subject line generated from the template, after any
--                         placeholders and substitutions have been made.
-- * p_html:               The HTML code for the email, after placeholders have been replaced.
-- * p_text:               The plain text of the email, with substitutions made.
-- * p_language_override:  language of a translated template to use. Use a language code
--                         like "en", "fr" or "de-at" here. An application translation
--                         for this language must exist, otherwise the argument is
--                         being ignored.
--
-- Example:
--
-- declare
--   l_subject varchar2( 4000 );
--   l_html    clob;
--   l_text    clob;
-- begin
--   apex_mail.prepare_template (
--     p_static_id    => 'ORDER',
--     p_placeholders => '{ "ORDER_NUMBER": 5321, "ORDER_DATE": "01-Feb-2018", "ORDER_TOTAL": "$12,000" }',
--     p_subject      => l_subject,
--     p_html         => l_html,
--     p_text         => l_text );
--
--   apex_mail.send (
--     p_to        => 'some_user@somewhere.com',   -- change to your email address
--     p_from      => 'some_sender@somewhere.com', -- change to a real senders email address
--     p_body      => l_text,
--     p_body_html => l_html,
--     p_subj      => l_subject );
-- end;
--==============================================================================
procedure prepare_template (
    p_static_id          in     varchar2,
    p_placeholders       in     clob,
    p_application_id     in     number default wwv_flow_security.g_flow_id,
    p_subject               out varchar2,
    p_html                  out clob,
    p_text                  out clob,
    p_language_override  in     varchar2   default null );
--
end wwv_flow_mail_api;
/
show errors

set define '^'
