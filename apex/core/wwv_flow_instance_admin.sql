set define '^' verify off
prompt ...wwv_flow_instance_admin
create or replace package wwv_flow_instance_admin as
--------------------------------------------------------------------------------
--
--  Copyright (c) 2007, 2024, Oracle and/or its affiliates.
--
--    NAME
--      wwv_flow_instance_admin.sql - APEX_INSTANCE_ADMIN
--
--    DESCRIPTION
--      The APEX_INSTANCE_ADMIN package provides utilities for managing an
--      Oracle APEX runtime environment. You use the
--      APEX_INSTANCE_ADMIN package to get and set email settings, Oracle
--      Wallet settings, report printing settings and to manage schema to
--      workspace mappings. APEX_INSTANCE_ADMIN can be executed by the SYS,
--      SYSTEM, and APEX_050000 database users and any database user granted
--      the role APEX_ADMINISTRATOR_ROLE.
--
--    INSTANCE PARAMETERS
--      Parameter Name                          Description
--      --------------------------------------- --------------------------------------------------------------------------------------------------
--      ACCOUNT_LIFETIME_DAYS                   The maximum number of days an end-user account password may be used before the account is expired.
--      ADMIN_DIGEST_DEFAULT_REPORTING_PERIOD   Default reporting period in days, for APEX Administrator Digest.
--      ADMIN_DIGEST_MAX_REPORTING_PERIOD       Maximum reporting period in days, for APEX Administrator Digest, older data is removed from the metrics tables.
--      ALLOW_DB_MONITOR                        If set to Y, database monitoring within SQL Workshop is enabled. If set
--                                              to N, the default, it is disabled.
--      ALLOW_HASH_FUNCTIONS                    Comma-separated list of hash algorithms that are supported. The default is SH256,SH384,SH512.
--      ALLOW_HOSTNAMES                         If set, users can only navigate to an application if the URL's hostname part contains this
--                                              value. Instance administrators can configure more specific values at workspace level.
--      ALLOW_PERSISTENT_AUTHENTICATION         If set to Y, the persistent authentication API is enabled for all applications
--      ALLOW_PUBLIC_FILE_UPLOAD                If set to Y, file uploads are allowed without user authentication. If set to N, the default, they
--                                              are not allowed.
--      ALLOW_RAS                               If set to Y, enable Real Application Security support for applications. If set to N (the default),
--                                              RAS can not be used.
--      ALLOW_REST                              If set to Y, the default, developers are allowed to expose report regions as RESTful services. If
--                                              set to N, they are not allowed.
--      ALLOW_SQL_DEVELOPER_WEB                 If set to Y, developers are allowed to open SQL Developer Web for DB schemas associated with their
--                                              workspace from the Builder menu. Default is N.
--      APEX_BUILDER_AUTHENTICATION             Controls the authentication scheme for the internal builder applications. Valid parameter values are
--                                              * APEX: Oracle APEX workspace accounts authentication (default)
--                                              * DB: Database accounts authentication
--                                              * HEADER: HTTP header variable based authentication
--                                              * SSO: Oracle Single Sign-On authentication
--                                              * LDAP: LDAP authentication
--                                              * SOCIAL: Social Sign-In authentication (OpenID / OAuth2)
--                                              * SAML: SAML authentication
--      APPLICATION_ACTIVITY_LOGGING            Controls instance wide setting of application activity log ([A]lways, [N]ever, [U]se application
--                                              settings,[O]ff for New Applications)
--      APPLICATION_ID_MIN                      The smallest possible ID for a database application
--      APPLICATION_ID_MAX                      The largest possible ID for a database application
--      AUDIT_LOG_RETENTION                     Number of days to keep audit log entries.
--      AUTHENTICATION_SUBSTITUTIONS            Allows to specify substitutions which are visible to all authentication schemes in the APEX instance.
--                                              The parameter value is a JSON format with a flat structure. Substitutions can be used for all authentication
--                                              scheme attributes, by using #SUBSTITUTION_NAME#. Example: {"SUBST_NAME":"SOME_VALUE","SUBST_NAME_2":"VALUE_2"}.
--      AUTOEXTEND_TABLESPACES                  If set to Y, the default, provisioned tablespaces will autoextend up to a maximum size. If set to
--                                              N tablespaces will not autoextend.
--      BACKGROUND_PROCESS_JOB_CLASS            Defines the DBMS_SCHEDULER job class to use for background execution of page processes.
--      BACKGROUND_JOB_CLASS                    Defines the DBMS_SCHEDULER job class to use for Automations,
--                                              REST Data Source synchronizations and Interactive Report notifications.
--      BACKGROUND_MIN_EXECUTION_CADENCE        Defines the minimum execution cadence for background jobs like REST data source
--                                              synchronizations or automations. The configured amount of minutes must pass
--                                              between two executions.
--      CHECKSUM_HASH_FUNCTION                  Defines the algorithm that is used to create one way hashes for URL checksums.
--                                              Valid values are MD5 (deprecated), SH1 (deprecated), SH256 (SHA-2, 256 bit), SH384 (SHA-2, 384 bit),
--                                              SH512 (SHA-2, 512 bit) and null.
--                                              The SHA-2 algorithms are only available on Oracle 12g and later. A null value evaluates to the
--                                              most secure algorithm available and is the default.
--      CHECK_FOR_UPDATES                       If set to N, the check for Oracle APEX and Oracle REST Data Services product
--                                              updates is disabled for the entire instance, regardless of preferences specified by
--                                              individual developers. The default is Y.
--      CONTENT_CACHE_SIZE_TARGET               The target size for the content cache, per workspace.
--      CONTENT_CACHE_MAX_FILE_SIZE             The individual file entry size limit for the content cache, per workspace.
--      CSV_DOWNLOAD_ESCAPE_FORMULAS            If set to Y, apex_escape.csv will escape formula cells by prepending a space.
--      CSV_DOWNLOAD_WITH_BOM_ENABLED           If set to Y, CSV downloads will include a BOM (Byte order mark) to help MS Excel to recognize
--                                              the character set of CSV file. Default is null.
--      DB_SIGNATURE                            This parameter can be used to automatically disable sending of emails on
--                                              cloned databases. If the value is not null and differs from
--                                              APEX_INSTANCE_ADMIN.DB_SIGNATURE, features are disabled. The default
--                                              value is null, i.e. nothing is disabled. See also functions DB_SIGNATURE
--                                              and IS_DB_SIGNATURE_VALID.
--      DEBUG_MESSAGE_PAGE_VIEW_LIMIT           Maximum number of debug messages for a single page view. Default is 50000.
--      DELETE_UPLOADED_FILES_AFTER_DAYS        Uploaded files like application export files, spreadsheet data load files
--                                              will be automatically deleted after this number of days. Default is 14.
--      DISABLE_ADMIN_LOGIN                     If set to Y, administration services are disabled. If set to N, the default, they are not
--                                              disabled.
--      DISABLE_WORKSPACE_LOGIN                 If set to Y, the workspace login is disabled. If set to N, the default, the login is not disabled.
--      DISABLE_APPS_LOGIN                      If set to Y, the login to all customer-created apps is disabled. If set to a comma sparated list of
--                                              application IDs only the login to those applications is disabled. If set to N, the default, the
--                                              login to customer-created apps is not disabled.
--      DISABLE_WS_PROV                         If set to Y, the workspace creation is disabled for requests sent out via e-mail notification. If
--                                              set to N, the default, they are not disabled.
--      DISABLE_WS_MSG                          The message displayed to end users when they attempt to provision a workspace via email provisioning,
--                                              and workspace provisiong is disabled (via DIABLE_WS_PROV).
--      EMAIL_ATTACHMENT_MAX_SIZE_MB            Maximum size, in megabytes, of a single email attachment sent via APEX_MAIL.
--      EMAIL_IMAGES_URL                        Specifies the full URL to the images directory of Oracle APEX instance, including the
--                                              trailing slash after the images directory. For example: http://your_server/i/. This setting used
--                                              for Oracle APEX system-generated emails.
--      EMAIL_INSTANCE_URL                      Specifies the URL to Oracle APEX instance, including the trailing slash after the Database
--                                              Access Descriptor. For example: http://your_server/pls/apex/. This setting used
--                                              for Oracle APEX system-generated emails.
--
--      ENABLE_LEGACY_WEB_ENTRY_POINTS          If Y (default is N), procedures that were used in older APEX versions (e.g.
--                                              HTMLDB_UTIL.%) can be called in the URL.
--      ENABLE_TRANSACTIONAL_SQL                If set to Y, the default, transactional SQL commands are enabled on this instance. If set to N,
--                                              transactional SQL commands are not enabled.
--      EXPIRE_FND_USER_ACCOUNTS                If set to Y, expiration of APEX accounts is enabled. If set to N, they are not enabled.
--      CLONE_SESSION_ENABLED                   If set to Y, the default, users can create multiple sessions in the browser.
--      GALLERY_FILE_URLS                       URLs which will be used as a installation source for Oracle APEX application gallery.
--                                              The URLs should point to valid endpoints returning JSON format, which describe the sample or starter apps to list.
--                                              Substitution string #APEX_BASE_VERSION# can be used to link to version dependent endpoints.
--      GALLERY_BACKGROUND_INSTALL              If set to Y, the default, gallery applications are installed in the background. So users don't have to wait until installation
--                                              finishes and can proceed with their work without interruption.
--      HEADER_AUTH_CALLBACK                    Callback procedure name for HTTP header based authentication, defaults to apex_authentication.callback.
--      HTTP_RESPONSE_HEADERS                   List of http response headers, separated by newline (chr(10)). APEX writes these headers on each
--                                              request, before rendering the page. The substitution string #CDN# within the headers will be replaced
--                                              by the content delivery networks that are known to APEX.
--      HTTP_ERROR_STATUS_ON_ERROR_PAGE_ENABLED If set to Y, when an unhandled exception occurs in the APEX engine, simply return
--                                              an HTTP 400 status code instead of showing the exception details on the page.
--      HTTP_TRUSTED_ORIGINS                    List of remote HTTP origins that can access resources, separated by newline. Set this parameter in combination
--                                              with the ORDS parameter security.externalSessionTrustedOrigins.
--      HTTP_STS_MAX_AGE                        This parameter is only relevant if REQUIRE_HTTPS is set to "A". Then, APEX emits a
--                                              Strict-Transport-Security: max-age=<value>
--                                              header on HTTPS requests if HTTP_STS_MAX_AGE has a value greater than 0. It also redirects to a
--                                              HTTPS URL if the request protocol is HTTP, instead of processing the request.
--      IGNORED_FRIENDLY_URL_PARAMETERS         Comma-separated list of parameter names which are ignored when parsing friendly URLs.
--                                              Default: utm_campaign,utm_source,utm_medium,utm_term,utm_content,fbclid
--      IMAGE_PREFIX                            The image prefix of the APEX instance, such as /i/
--      INBOUND_PROXIES                         Comma-separated list of IP addresses for proxy servers through which requests come in.
--      INSTANCE_DBMS_CREDENTIAL_ENABLED        If set to Y, database credentials, which are accessible to the APEX engine (APEX_NNNNNN schema), can be used in
--                                              all workspaces on this instance.
--      AI_BUILDER_PROXY                        The proxy server for all outbound HTTP(s) traffic to Generative AI Services from APEX Builder.
--      INSTANCE_PROXY                          The proxy server for all outbound HTTP(s) traffic. If INSTANCE_PROXY is set, it overrides any application specific proxy server definition.
--      INSTANCE_TABLESPACE                     If specified, comma-separated list tablespaces to use for the database user for all new workspaces.
--      KEEP_SESSIONS_ON_UPGRADE                This flag affects application upgrades. If set to N, the default, delete
--                                              sessions associated with the application. If set to Y, leave sessions
--                                              unaffected.
--      LOGIN_MESSAGE                           The text to be displayed on the login page.  This text can include HTML.
--      LOGIN_THROTTLE_DELAY                    The flag which determines the time increase in seconds after failed logins
--      LOGIN_THROTTLE_METHODS                  The methods to count failed logins. Colon-separated list of USERNAME_IP, USERNAME, IP
--      MAX_APPLICATION_BACKUPS                 The maximum number of backups kept for each application. Default is 10. Zero (0) disables automated backups.
--      MAX_LOGIN_FAILURES                      The maximum number of consecutive unsuccessful authentication attempts allowed before a developer or
--                                              administrator account is locked.
--      MAX_PROCESS_SCHEDULER_JOBS_DEFAULT      Default maximum value of scheduler jobs for background processing.
--                                              The default value is 4.
--      MAX_SESSION_IDLE_SEC                    The number of seconds an internal application may be idle.
--      MAX_SESSION_LENGTH_SEC                  The number of seconds an internal application session may exist.
--      SESSION_TIMEOUT_WARNING_SEC             The number of seconds before session timeout a warning is displayed, for internal applications.
--      MAX_WEBSERVICE_REQUESTS                 The maximum number of outbound web service requests allowed for each
--                                              workspace in a rolling 24-hour period. Default is 1000.
--      MLE_LANGUAGES                           Comma-separated list of MLE languages available for application development. If the parameter contains
--                                              no language, only SQL and PL/SQL can be used. Default: JAVASCRIPT
--                                              Notes:
--                                                  To use MLE, workspace schemas still need the necessary MLE grants:
--                                                    >=21c: grant EXECUTE DYNAMIC MLE to schema
--                                                    >=21c: grant EXECUTE ON sys.JAVASCRIPT to schema
--                                                  To create environments and modules:
--                                                    >=23ai: grant CREATE MLE to schema
--      PASSWORD_ALPHA_CHARACTERS               The alphabetic characters used for password complexity rules. Default list of alphabetic characters
--                                              include the following:
--                                              abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ
--      PASSWORD_HASH_FUNCTION                  Defines the algorithm that is used to create one way hashes for workspace user passwords.
--                                              Valid values are MD5 (deprecated), SH1 (deprecated), SH256 (SHA-2, 256 bit), SH384 (SHA-2, 384 bit),
--                                              SH512 (SHA-2, 512 bit) and null.
--                                              The SHA-2 algorithms are only available on Oracle 12g and later. A null value evaluates to the
--                                              most secure algorithm available and is the default.
--      PASSWORD_HASH_ITERATIONS                Defines the number of iterations for the PASSWORD_HASH_FUNCTION (default 10000)
--      PASSWORD_HISTORY_DAYS                   Defines the maximum number of days a developer or administrator account password may be used before
--                                              the account expires. The default value is 45 days.
--      PASSWORD_MIN_LENGTH                     A positive integer or 0 which specifies the minimum character length for passwords for instance
--                                              administrators, workspace administrators, developers, and end user Oracle APEX accounts.
--      PASSWORD_NEW_DIFFERS_BY                 A positive integer or 0 which specifies the number of differences required between old and new
--                                              passwords. The passwords are compared character by character, and each difference that occurs in
--                                              any position counts toward the required minimum difference. This setting applies to accounts for
--                                              instance administrators, workspace administrators, developers, and end user Oracle APEX
--                                              accounts.
--      PASSWORD_NOT_LIKE_USERNAME              If Y (the default is N), prevent workspace administrator, developer, and end user account
--                                              passwords from containing the username.
--      PASSWORD_NOT_LIKE_WORDS                 Enter words, separated by colons, that workspace administrator, developer, and end user account
--                                              passwords must not contain. These words may not appear in the password in any combination of
--                                              upper- or lowercase.
--      PASSWORD_NOT_LIKE_WS_NAME               Set to Y to prevent workspace administrator, developer, and end user account passwords from
--                                              containing the workspace name.
--      PASSWORD_ONE_ALPHA                      Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one alphabetic character as specified in PASSWORD_ALPHA_CHARACTERS.
--      PASSWORD_ONE_LOWER_CASE                 Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one lowercase alphabetic character.
--      PASSWORD_ONE_NUMERIC                    Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one Arabic numeric character (0-9).
--      PASSWORD_ONE_PUNCTUATION                Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one punctuation character as specified in PASSWORD_PUNCTUATION_CHARACTERS.
--      PASSWORD_ONE_UPPER_CASE                 Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one uppercase alphabetic character.
--      PASSWORD_PUNCTUATION_CHARACTERS         The punctuation characters used for password complexity rules. Default list of punctuation
--                                              characters include the following:
--                                              !"#$%&()``*+,-/:;<=>?_
--      PATH_PREFIX                             The unique URI path prefix used to access RESTful Services in a workspace. The default path prefix
--                                              value is the name of the workspace. Note that this is a workspace parameter, it can not be set at
--                                              instance level.
--      PERSISTENT_AUTHENTICATION_MAX_DAYS      Number of days after which persistent authentication expires and user has to sign in again.
--      PLSQL_EDITING                           If set to Y, the default, the SQL Workshop Object Browser is enabled to allow users to edit and
--                                              compile PL/SQL. If set to N, users are not allowed.
--      PRINT_BIB_LICENSED                      Specify the external print server.
--                                              * STANDARD      - requires Apache FOP
--                                              * ADVANCED      - requires Oracle BI Publisher
--                                              * APEX_LISTENER - requires Oracle Rest Data Services (ORDS, formerly APEX Listener)
--                                              * AOP           - requires APEX Office Print
--                                              * NONE          - Native APEX printing
--      PRINT_SVR_PROTOCOL                      Valid values include:
--                                              * http
--                                              * https
--      PRINT_SVR_HOST                          Specifies the host address of the print server converting engine, for example, localhost. Enter the
--                                              appropriate host address if the print server is installed at another location.
--      PRINT_SVR_PORT                          Defines the port of the print server engine, for example 8888. Value must be a positive integer.
--      PRINT_SVR_SCRIPT                        Defines the script that is the print server engine, for example:
--                                              /xmlpserver/convert
--      DOCGEN_CREDENTIAL                        Specifies the cloud credential to use for Oracle Object Storage bucket management and use of the
--                                              Oracle Document Generator Pre-built function.
--      DOCGEN_OS_NAMESPACE                     OCI system assigned namespace name for Object Storage.
--      DOCGEN_OS_BUCKET_COMPARTMENT_OCID       The unique ID of the OCI compartment for bucket management and Oracle Document Generator Pre-built
--                                              function access.
--      DOCGEN_OS_ENDPOINT                      The base enpoint URL for buckets in Object Storage.
--      DOCGEN_FUNCTION_OCID                    The unique ID of the Oracle Document Generator Pre-built function.
--      DOCGEN_INVOKE_ENDPOINT                  The base enpoint URL to access the Oracle Document Generator Pre-built function.
--      DOCGEN_INSTANCEID_OVERRIDE              Overrides the instance ID used for the bucket name in Object Storage.
--      PROTECTED_COOKIES                       Comma-separated list of cookie names that APEX should filter from the OWA arrays.
--      QOS_MAX_SESSION_KILL_TIMEOUT            Nr of seconds that an active old session can live, when qos_max_session_requests has been reached.
--                                              The oldest DB session with last_call_et > qos_max_session_kill_timeout will be killed.
--      QOS_MAX_SESSION_REQUESTS                Nr of allowed concurrent requests to one session associated with this workspace.
--      QOS_MAX_WORKSPACE_REQUESTS              Nr of allowed concurrent requests to sessions in this workspace.
--      REJOIN_EXISTING_SESSIONS                If N, session rejoining is disabled for the whole instance.
--                                              If P (the default), it is supported for non-authenticated users and public pages.
--                                              If Y, it is also supported for authenticated users and protected pages.
--                                              Session rejoining explicitly has to be enabled at application or page level. A more restrictive
--                                              setting at instance level with this instance parameter overrides application and page settings.
--                                              Unconditionally enabling session rejoining has serious security implications. Attackers could
--                                              take over sessions via XSS or if they have development access to a workspace.
--      REQUIRE_HTTPS                           Set to A, to enforce HTTPS for the whole APEX instance. Set to I to enforce HTTPS
--                                              within the Oracle APEX development and administration applications. Select N to allow
--                                              all application be used when the protocol is either HTTP or HTTPS (HTTPS can be enforced at
--                                              application level).
--      REQUIRE_OUT_HTTPS                       If set to Y, all outbound HTTP traffic has to use the HTTPS protocol.
--      REQUIRE_OUT_LDAPS                       If set to Y, all outbound LDAP traffic has to use TLS.
--      REQ_NEW_SCHEMA                          If set to Y, the option for new schema for new workspace requests is enabled. If set to N, the
--                                              default, the option is disabled.
--      RESTFUL_SERVICES_ENABLED                If set to Y, the default, RESTful services development is enabled. If set to N, RESTful services
--                                              are not enabled.
--      RESTRICT_APPS_HEADER                    To restrict access to a specific list of applications, enter a HTTP request header name.
--                                              If the header exists, login to the application is only allowed if the application ID is
--                                              contained in the comma-delimited list of applications in the header.
--      RESTRICT_DEV_HEADER                     To restrict access to the Oracle APEX development environment, enter a HTTP request header
--                                              name. If the header exists, login to the development environment will be disabled.
--      RESTRICT_IP_RANGE                       To restrict access to the Oracle APEX development environment to a specific range of
--                                              IP addresses, enter a comma-delimited list of IP addresses. If necessary, you can use an
--                                              asterisk (*) as a wildcard, but do not include additional numeric values after wildcard
--                                              characters. For example, 138.*.41.2 is not a valid value.
--      RESTRICT_RESPONSE_HEADERS               If Y or null (the default), show HTTP 500 when a page contains unsupported HTTP response headers.
--                                              These include status codes 301, 308 and 410, as well as cache headers for POST requests.
--      RM_CONSUMER_GROUP                       If set, this is the resource manager consumer group to be used for all page events. A more specific
--                                              group can be configured at workspace level.
--      SAMESITE_COOKIE                         Default value of the cookie attribute "samesite".
--      SAML_APEX_CALLBACK_URLS                 SAML authentication: Supported URLs for apex_authentication.saml_callback, separated by newlines. If
--                                              set, APEX verifies that the domain in the browser is part of this list and sends it's index (starting
--                                              at 0) in authentication requests as AssertionConsumerServiceIndex.
--      SAML_APEX_CERTIFICATE                   SAML authentication: The primary certificate of the APEX side.
--      SAML_APEX_CERTIFICATE2                  SAML authentication: The alternative certificate of the APEX side (optional).
--      SAML_APEX_PRIVATE_KEY                   SAML authentication: The private key of the APEX side.
--      SAML_APEX_PRIVATE_KEY2                  SAML authentication: The alternative private key of the APEX side (optional).
--      SAML_C14N_SKIP_UNUSED_INCLUSIVE_NS      SAML authentication: If Y (default null), skip unused InclusiveNamespaces when canonicalizing XML.
--      SAML_C14N_SKIP_UTILIZED_XMLNS           SAML authentication: If Y (default null), skip superfluous xmlns from the root node when extracting
--                                              the Assertion from a SAML Response, when canonicalizing XML.
--      SAML_ENABLED                            SAML authentication: Y if workspace applications should be able to use SAML authentication.
--      SAML_NAMEID_FORMAT                      SAML authentication: The NameID format that APEX expects. Defaults to
--                                              urn:oasis:names:tc:SAML:2.0:nameid-format:persistent when null.
--      SAML_IP_ISSUER                          SAML authentication: Issuer attribute from the identity provider's metadata.
--      SAML_IP_SIGNING_CERTIFICATE             SAML authentication: The certificate from the identity provider's metadata.
--      SAML_IP_SIGNING_CERTIFICATE2            SAML authentication: An alternative certificate from the identity provider's metadata (optional).
--      SAML_SIGN_IN_URL                        SAML authentication: The identity provider's sign in URL.
--      SAML_SIGN_OUT_URL                       SAML authentication: The identity provider's sign out URL (optional).
--      SAML_SP_ISSUER                          SAML authentication: The "issuer" attribute that APEX sends (defaults to the callback URL).
--      SAML_USERNAME_ATTRIBUTE                 SAML authentication: Responses can contain additional attributes about the user. If set, APEX uses
--                                              that attribute's value as the username (defaults to the assertion subject's NameID attribute).
--      SOCIAL_AUTH_CALLBACK                    Callback procedure name for Social Sign-In, defaults to apex_authentication.callback.
--      SWAGGER_UI_URL                          Defines a URL pointing to the SWAGGER UI server to be used by the ORDS REST Workshop when generating
--                                              documation for a module. If a URL is specified, the URI to the web service swagger doc will be passed
--                                              to the Swagger server. If a there is no URL specified, raw JSON will be produced.
--      SELF_SERVICE_SCHEMA_PREFIX              If set, all schemas created during self service workspace provisioning will be prefixed with
--                                              this value.
--      SERVICE_ADMIN_PASSWORD_MIN_LENGTH       A positive integer or 0 which specifies the minimum character length for passwords for instance
--                                              administrators, workspace administrators, developers, and end user Oracle APEX accounts,
--                                              when the strong password rules are enabled (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_NEW_DIFFERS_BY   A positive integer or 0 which specifies the number of differences required between old and new
--                                              passwords. The passwords are compared character by character, and each difference that occurs in
--                                              any position counts toward the required minimum difference. This setting applies to accounts for
--                                              instance administrators, workspace administrators, developers, and end user Oracle APEX
--                                              accounts, when the strong password rules are enabled (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_ONE_ALPHA        Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one alphabetic character as specified in PASSWORD_ALPHA_CHARACTERS, when the
--                                              strong password rules are enabled (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_ONE_NUMERIC      Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one Arabic numeric character (0-9), when the strong password rules are enabled
--                                              (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_ONE_PUNCTUATION  Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one punctuation character as specified in PASSWORD_PUNCTUATION_CHARACTERS, when
--                                              the strong password rules are enabled (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_ONE_UPPER_CASE   Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one uppercase alphabetic character, when the strong password rules are enabled
--                                              (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_ONE_LOWER_CASE   Set to Y to require that workspace administrator, developer, and end user account passwords
--                                              contain at least one lowercase alphabetic character, when the strong password rules are enabled
--                                              (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_NOT_LIKE_USERNAME If Y, prevent workspace administrator, developer, and end user account passwords from containing
--                                              the username, when the strong password rules are enabled (see STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_NOT_LIKE_WS_NAME Set to Y to prevent workspace administrator, developer, and end user account passwords from
--                                              containing the workspace name, when the strong password rules are enabled (see
--                                              STRONG_SITE_ADMIN_PASSWORD).
--      SERVICE_ADMIN_PASSWORD_NOT_LIKE_WORDS   Enter words, separated by colons, that workspace administrator, developer, and end user account
--                                              passwords must not contain, when the strong password rules are enabled (see
--                                              STRONG_SITE_ADMIN_PASSWORD). These words may not appear in the password in any combination of
--                                              upper- or lowercase.
--      SERVICE_REQUESTS_ENABLED                If set to Y, the default, workspace service requests for schemas, storage, and termination is
--                                              enabled. If set to N, these requests are disabled.
--      SERVICE_REQUEST_FLOW                    Determines default provisioning mode. Default is MANUAL.
--      SMTP_CONNECTION_REUSE_COUNT             Number of mails that the mail job processes, before re-opening the SMTP connection (default 1).
--      SMTP_ENVELOPE_FROM                      Defines the "MAIL FROM" SMTP envelope address. If not set, APEX_MAIL will use the p_from address.
--      SMTP_FROM                               Defines the "from" address for administrative tasks that generate email, such as approving a
--                                              provision request or resetting a password.  Enter a valid email address, for example:
--                                              someone@somewhere.com
--      SMTP_HOST_ADDRESS                       Defines the server address of the SMTP server. If you are using another server as an SMTP relay,
--                                              change this parameter to that server's address.
--                                              Default setting: localhost
--      SMTP_HOST_PORT                          Defines the port the SMTP server listens to for mail requests.
--                                              Default setting: 25
--      SMTP_PASSWORD                           Defines the password APEX takes to authenticate itself against the SMTP server, in conjunction
--                                              with the parameter SMTP_USERNAME.
--      SMTP_REST_EMAIL_MODE                    Controls whether mail deliver is done via SMTP relay (the default, 'N') or if mail
--                                              delivery is done via the Oracle Cloud Notification Service.
--      SMTP_REST_EMAIL_URL                     URL to be used for mail delivery via the Oracle Cloud Notification Service.  This setting is only
--                                              relevant when SMTP_REST_EMAIL_MODE = 'Y'
--                                              delivery is done via the Oracle Cloud Notification Service.
--      SMTP_RETRY_PERMANENT_ERROR_PATTERNS     Defines a linefeed-delimited list of regex patterns to determine which "permanent errors" returned by
--                                              an SMTP server are to be actually treated as temporary. If an error message is treated as temporary, the
--                                              mail will be sent again when the job executes next time. If the error is treated as permanent, the mail
--                                              will be removed from the queue immediately. Defaults to ".*" (means that all errors are treated as temporary)
--                                              for backwards compatibility.
--      SMTP_SECURE_HOST                        Specify allowable hosts presented by certificate when TLS is used.
--      SMTP_TLS_MODE                           Defines whether or not APEX opens an encrypted connection to the SMTP server. Encryption is only
--                                              supported on database versions 11.2.0.2 and later. On earlier database versions, the connection
--                                              is not encrypted.
--                                              If set to N, the connection is unencrypted (default).
--                                              If set to Y, the connection is encrypted before data is sent.
--                                              If STARTTLS, Apex sends the SMTP commands EHLO <SMTP_HOST_ADDRESS> and STARTTLS before encrypting
--                                              the connection.
--      SMTP_USERNAME                           Defines the username APEX takes to authenticate itself against the SMTP server (default is null).
--                                              Starting with database version 11.2.0.2, APEX uses UTL_MAIL's AUTH procedure for authentication.
--                                              This procedure negotiates an authentication mode with the SMTP server. With earlier database versions,
--                                              the authentication mode is always AUTH LOGIN. If SMTP_USERNAME is null, no authentication is used.
--      SQL_SCRIPT_MAX_OUTPUT_SIZE              The maximum allowable size for an individual script result. Default is 200000.
--      SSO_LOGOUT_URL                          The URL Oracle APEX redirects to in order to trigger a logout from the Single Sign-On server.
--                                              Oracle APEX automatically appends "?p_done_url=...login url...".
--      STRONG_SITE_ADMIN_PASSWORD              If set to Y, the default, the apex_admin password must conform to the default set of strong complexity
--                                              rules. If set to N, the password is not required to follow the strong complexity rules.
--      SYSTEM_DEBUG_LEVEL                      Defines a default debug level for all incoming requests (null, 1-9) The sqlplus script
--                                              utilities/debug/d0.sql can be used to switch between null (disabled) and level 9.
--      SYSTEM_HELP_URL                         Location of the help and documentation accessed from the Help link within the development environment.
--                                              Default is http://apex.oracle.com/doc41.
--      SYSTEM_MESSAGE                          The text to be displayed on the development environment home page. This text can include HTML.
--      GETTING_STARTED_ENABLED                 If set to Y, getting started information will be shown on the homepage and other pages
--      TASK_RETENTION_PERIOD_DAYS              Specifies the retention period for Tasks in Completed state in days. After the retention period, tasks will  be
--                                              archived in a JSON zip file and purged from the table(s).
--      TRACE_HEADER_NAME                       This parameter contains a HTTP request header name and defaults to ECID-CONTEXT. The name
--                                              must be in upper case. APEX writes the HTTP header value to the activity log's ECID column.
--      TRACING_ENABLED                         If set to Y (the default), an application with Debug enabled can also generate server-side db trace
--                                              files using "&p_trace=YES" on the URL. If set to N, the request to create a trace file will be ignored.
--      UPGRADE_DEFERRED                        If set to Y, the upgrade will be deferred in cloud services. Default is N.
--      USERNAME_VALIDATION                     The regular expression used to validate a username of workspace developers and administrators. The
--                                              value '*' means no validation, which is the default.
--      WALLET_PATH                             The path to the wallet on the file system, for example: file:/home/<username>/wallets
--      WALLET_PWD                              The password associated with the wallet.
--      WEBSERVICE_LOGGING                      Controls instance wide setting of web service activity log ([A]lways, [N]ever, [U]se workspace
--                                              settings.
--
--      WORKFLOW_RETENTION_PERIOD_DAYS          Specifies the retention period for Workflows in Completed state in days. After the retention period, workflows
--                                              will be purged from the table(s).
--      WORKSPACE_EMAIL_MAXIMUM                 Maximum number of emails allowed to be sent via APEX_MAIL per workspace in a 24 hour period. Default
--                                              is 1000.
--      MAX_MAIL_QUEUE_ROWS                     Defines the number of email messages that will be processed from the queue per workspace during each invocation
--                                              of the ORACLE_APEX_MAIL_QUEUE scheduler job.
--      WORKSPACE_FREE_SPACE_LIMIT              Workspace free space - percentage limit, if the space is lower that the value set here, a report
--                                              lists them for the APEX Administrator Digest.
--      WORKSPACE_MAX_FILE_BYTES                The maximum number of bytes for uploaded files for a workspace. A setting at workspace level overrides
--                                              the instance level setting.
--      WORKSPACE_MAX_OUTPUT_SIZE               The maximum space allocated for script results. Default is 2000000.
--      WORKSPACE_NAME_USER_COOKIE              If set to Y or null (the default), APEX sends persistent cookies for workspace name and
--                                              username during login, as well as for language selection. If N, the cookies are not sent.
--      WORKSPACE_PROVISION_DEMO_OBJECTS        If set to Y, the default, demonstration applications and database objects are created in new workspaces.
--                                              If set to N, they are not created in the current workspace.
--      WORKSPACE_TEAM_DEV_FILES_YN             If set to Y, the default, new workspaces will allow file uploads into Team Development. If set to N, new
--                                              workspaces will not allow file uploads into Team Development, thereby disabling the ability to upload "feature",
--                                              "bug", and "feedback" attachments.
--      WORKSPACE_TEAM_DEV_FS_LIMIT             The maximum per upload file size of a Team Development file ("feature", "bug", and "feedback" attachments).
--                                              Default value is 15728640 (15 MB). All possible options are listed below:
--                                              5 MB - 5242880 | 10 MB - 10485760 | 15 MB - 15728640 | 20 MB - 20971520 | 25 MB - 26214400
--      WORKSPACE_ISSUE_FILES_YN                If set to Y, the default, new workspaces will allow file uploads into the Issues applicaiton. If set to N, new
--                                              workspaces will not allow file uploads into Issues, thereby disabling the ability to upload attachments for an issue.
--      WORKSPACE_ISSUE_FS_LIMIT                The maximum per upload file size of an Issue file attachment.
--                                              Default value is 15728640 (15 MB). All possible options are listed below:
--                                              5 MB - 5242880 | 10 MB - 10485760 | 15 MB - 15728640 | 20 MB - 20971520 | 25 MB - 26214400
--      ENV_BANNER_ENABLE                       If set to Y (default is N),
--                                              the environment banner displays in the APEX development environment to visually flag the environment.
--      ENV_BANNER_LABEL                        Defines the label for the environment banner.
--      ENV_BANNER_COLOR                        Defines the color class name for the environment banner color.
--                                              Use accent-1, accent-2, accent-3, (and so on). Maximum of 16 color classes.
--      ENV_BANNER_POS                          Defines the display position for the environment banner. Options: LEFT or TOP.
--      PWA_PUSH_NOTIFICATIONS_ALLOWED_ENDPOINTS Defines an optional list of additional allowed URLs for push notification services. By default the APEX engine supports
--                                              the following URLs: android.googleapis.com
--                                                                  fcm.googleapis.com
--                                                                  updates.push.services.mozilla.com
--                                                                  notify.windows.com
--                                                                  push.apple.com
--      AI_IS_ENABLED                           If set to Y (default), then AI Services can be enabled and configured for workspaces.
--                                              If set to N, AI functionality is disabled for all workspaces.                
--
--
--    WORKSPACE PARAMETERS
--      Parameter Name                          Description
--      --------------------------------------- --------------------------------------------------------------------------------------------------
--      OPENTELEMETRY_CLS_URL                   The external Client Logging Service (CLS) URL that is obtained during telemetry provisioning.
--      OPENTELEMETRY_TOKEN_RELAY_URL           The REST service that obtains an access token for the currently logged in user. The token is used for authentication when calling the CLS.  
--
--
--    RUNTIME DEPLOYMENT: YES
--
--    MODIFIED    (MM/DD/YYYY)
--      jstraub    08/10/2007 - Created
--
--------------------------------------------------------------------------------

--##############################################################################
--#
--# I N S T A N C E   P A R A M E T E R S
--#
--##############################################################################

--==============================================================================
-- Set an instance parameter value
--
-- NOTE: You must commit the transaction after calling this procedure for the
-- change to take effect.
--
-- ARGUMENTS
-- * p_parameter Parameter name.
-- * p_value     Parameter value.
-- * p_force     If true (default false), accept the value even if it is missing
--               some quality criteria. Basic data type validation (numeric,
--               Y/N, etc) still happens, but APEX will accept more values.
--               Credentials can for example be SHA-1 and shorter than 2048
--               bit. Note that the ALLOW_HASH_FUNCTIONS parameter will need to
--               support SHA-1, too.
--==============================================================================
procedure set_parameter(
    p_parameter           in varchar2,
    p_value               in varchar2 default 'N',
    p_force               in boolean  default false );

--==============================================================================
-- Get an instance parameter value
--
-- ARGUMENTS
-- * p_parameter parameter name
--
-- RETURNS
-- the parameter value
--==============================================================================
function get_parameter(
    p_parameter           in varchar2 )
    return varchar2;

--==============================================================================
-- Check whether an instance parameter exists
--
-- ARGUMENTS
-- * p_parameter parameter name
--
-- RETURNS
-- true if the parameter exists, false otherwise
--==============================================================================
function exists_parameter (
    p_parameter            in varchar2 )
    return boolean;

--##############################################################################
--#
--# D A T A B A S E   S I G N A T U R E
--#
--##############################################################################

--==============================================================================
-- Compute the current database signature value.
--
-- EXAMPLE
--
--   Enable DB_SIGNATURE parameter on the production instance. On a clone of
--   production, the function result differs from the parameter value, so
--   features are disabled.
--
--     begin
--         apex_instance_admin.set_parameter (
--             p_parameter => 'DB_SIGNATURE',
--             p_value     => apex_instance_admin.db_signature );
--     end;
--
-- SEE ALSO
--   is_db_signature_valid, parameter DB_SIGNATURE.
--==============================================================================
function db_signature
    return varchar2;

--==============================================================================
-- Return whether the instance parameter DB_SIGNATURE matches the value of the
-- function db_signature. If the instance parameter is not set (the default),
-- also return true.
--
-- EXAMPLE
--   Print whether the signature is valid.
--
--     begin
--         sys.dbms_output.put_line (
--             case when apex_instance_admin.is_db_signature_valid
--             then 'signature is valid, features are enabled'
--             else 'signature differs (cloned db), features are disabled'
--             end );
--     end;
--
-- SEE ALSO
--   db_signature, parameter DB_SIGNATURE
--==============================================================================
function is_db_signature_valid
    return boolean;

--##############################################################################
--#
--# W O R K S P A C E   M A N A G E M E N T
--#
--##############################################################################

--==============================================================================
procedure add_workspace(
    p_workspace_id           in number   default null,
    p_workspace              in varchar2,
    p_source_identifier      in varchar2 default null,
    p_primary_schema         in varchar2,
    p_additional_schemas     in varchar2 default null,
    p_rm_consumer_group      in varchar2 default null,
    p_cloud_group_name       in varchar2 default null,
    p_cloud_service_name     in varchar2 default null,
    p_host_prefix            in varchar2 default null,
    p_workspace_type         in varchar2 default null );

--==============================================================================
procedure remove_workspace(
    p_workspace           in varchar2,
    p_drop_users          in varchar2 default 'N',
    p_drop_tablespaces    in varchar2 default 'N' );

--==============================================================================
procedure remove_application(
    p_application_id      in number );

--==============================================================================
function get_schemas(
    p_workspace           in varchar2 )
return varchar2;

--==============================================================================
procedure add_schema(
    p_workspace             in varchar2,
    p_schema                in varchar2,
    p_grant_apex_privileges in boolean default false );

--==============================================================================
procedure remove_schema(
    p_workspace           in varchar2,
    p_schema              in varchar2 );

--==============================================================================
-- set a Resource Manager Consumer Group to a workspace
--==============================================================================
procedure set_workspace_consumer_group(
    p_workspace           in varchar2,
    p_rm_consumer_group   in varchar2 );

--==============================================================================
-- set a workspace parameter
--
-- ARGUMENTS
-- * p_workspace          the workspace name
-- * p_parameter          the parameter name, one of
--                        - ACCOUNT_LIFETIME_DAYS
--                        - AI_IS_ENABLED
--                        - ALLOW_HOSTING_EXTENSIONS
--                        - ALLOW_HOSTNAMES
--                        - CONTENT_CACHE_MAX_FILE_SIZE
--                        - CONTENT_CACHE_SIZE_TARGET
--                        - EXPIRE_FND_USER_ACCOUNTS
--                        - MAX_LOGIN_FAILURES
--                        - MAX_SESSION_IDLE_SEC
--                        - MAX_SESSION_LENGTH_SEC
--                        - MAX_WEBSERVICE_REQUESTS
--                        - OPENTELEMETRY_CLS_URL
--                        - OPENTELEMETRY_TOKEN_RELAY_URL
--                        - PATH_PREFIX
--                        - QOS_MAX_SESSION_KILL_TIMEOUT
--                        - QOS_MAX_SESSION_REQUESTS
--                        - QOS_MAX_WORKSPACE_REQUESTS
--                        - RM_CONSUMER_GROUP
--                        - SESSION_TIMEOUT_WARNING_SEC
--                        - WEBSERVICE_LOGGING
--                        - WORKSPACE_EMAIL_MAXIMUM
--                        - WORKSPACE_MAX_FILE_BYTES
--                        that overrides the instance parameter value of the
--                        same name for this workspace.
-- * p_value              the parameter value
--
-- EXAMPLE
--   Restrict URLs for accessing applications in the HR workspace to have
--   "hr.example.com" in the hostname / domain name part.
--
--   begin
--       apex_instance_admin.set_workspace_parameter (
--           p_workspace => 'HR',
--           p_parameter => 'ALLOW_HOSTNAMES',
--           p_value     => 'hr.example.com' );
--   end;
--==============================================================================
procedure set_workspace_parameter(
    p_workspace           in varchar2,
    p_parameter           in varchar2,
    p_value               in varchar2 );

--==============================================================================
-- get a workspace parameter
--
-- ARGUMENTS
-- * p_workspace          the workspace name
-- * p_parameter          the parameter name, one of
--                        - ACCOUNT_LIFETIME_DAYS
--                        - ALLOW_HOSTNAMES
--                        - CONTENT_CACHE_MAX_FILE_SIZE
--                        - CONTENT_CACHE_SIZE_TARGET
--                        - EXPIRE_FND_USER_ACCOUNTS
--                        - MAX_LOGIN_FAILURES
--                        - MAX_SESSION_IDLE_SEC
--                        - MAX_SESSION_LENGTH_SEC
--                        - MAX_WEBSERVICE_REQUESTS
--                        - OPENTELEMETRY_CLS_URL
--                        - OPENTELEMETRY_TOKEN_RELAY_URL
--                        - PATH_PREFIX
--                        - QOS_MAX_SESSION_KILL_TIMEOUT
--                        - QOS_MAX_SESSION_REQUESTS
--                        - QOS_MAX_WORKSPACE_REQUESTS
--                        - RM_CONSUMER_GROUP
--                        - SESSION_TIMEOUT_WARNING_SEC
--                        - WEBSERVICE_LOGGING
--                        - WORKSPACE_EMAIL_MAXIMUM
--                        - WORKSPACE_MAX_FILE_BYTES
--                        that overrides the instance parameter value of the
--                        same name for this workspace.
--
-- EXAMPLE
--   Print the value of ALLOW_HOSTNAMES for the HR workspace.
--   "hr.example.com" in the hostname / domain name part.
--
--   begin
--       dbms_output.put_line (
--           apex_instance_admin.get_workspace_parameter (
--               p_workspace => 'HR',
--               p_parameter => 'ALLOW_HOSTNAMES' ));
--   end;
--==============================================================================
function get_workspace_parameter(
    p_workspace           in varchar2,
    p_parameter           in varchar2 )
    return varchar2;

--==============================================================================
procedure disable_workspace(
    p_workspace        in varchar2 default null );

--==============================================================================
procedure enable_workspace(
    p_workspace        in varchar2 default null );

--##############################################################################
--#
--# W O R K S P A C E   A R C H I V I N G
--#
--##############################################################################

--==============================================================================
procedure archive_workspace(
    p_workspace        in varchar2 default null,
    p_schema           in varchar2 default null,
    p_apps_only        in varchar2 default 'N');

procedure purge_archives(
    p_workspace        in varchar2 default null,
    p_schema           in varchar2 default null);

procedure purge_archive_versions(
    p_workspace                 in varchar2 default null,
    p_schema                    in varchar2 default null,
    p_max_versions_to_retain    in number);

--##############################################################################
--#
--# A P P L I C A T I O N   I D   R A N G E
--#
--##############################################################################

--==============================================================================
-- This procedure permanently reserves the IDs of database
-- applications in a given workspace. Even if the workspace and it's
-- applications get removed, developers can not create other applications with
-- one of these IDs.
--
-- Together with the parameters APPLICATION_ID_MIN and APPLICATION_ID_MAX, this
-- procedure can be used to support moving workspaces between Application
-- Express instances, without the risk of having duplicate application IDs.
--
-- ARGUMENTS
-- * p_workspace_id: The unique id of a workspace.
--
-- EXAMPLE
--   After setting up Oracle APEX instance 1, ensure that
--   application IDs are between 100000 and 199999:
--
--   begin
--     apex_instance_admin.set_parameter('APPLICATION_ID_MIN', 100000);
--     apex_instance_admin.set_parameter('APPLICATION_ID_MAX', 199999);
--   end;
--
--   After setting up Oracle APEX instance 2, ensure that
--   application IDs are between 200000 and 299999:
--
--   begin
--     apex_instance_admin.set_parameter('APPLICATION_ID_MIN', 200000);
--     apex_instance_admin.set_parameter('APPLICATION_ID_MAX', 299999);
--   end;
--
--   Later, the operations team decides that workspace MY_WORKSPACE with
--   ID 1234567890 should be moved from instance 1 to instance 2. The
--   required steps are:
--   1. Export the workspace, applications and data on instance 1 (not shown
--      here)
--   2. Ensure that no other application on instance 1 can reuse application
--      IDs of this workspace
--
--   begin
--     apex_instance_admin.reserve_workspace_app_ids(1234567890);
--   end;
--
--   3. Drop workspace, accompanying data and users on instance 1
--
--   begin
--     apex_instance_admin.remove_workspace('MY_WORKSPACE');
--   end;
--
--   4. Import the workspace, applications and data on instance 2 (not shown
--      here)
--==============================================================================
procedure reserve_workspace_app_ids (
    p_workspace_id in number );

--==============================================================================
-- This procedure removes the reservation of application IDs for a given
-- workspace id. Use this procedure to undo a reservation with
-- reserve_workspace_app_ids, when the reservation is not necessary anymore
-- because it happened by mistake or the workspace does not exist anymore.
--
-- ARGUMENTS
-- * p_workspace_id: The unique id of a workspace.
--
-- EXAMPLE
--   begin
--     apex_instance_admin.free_workspace_app_ids(1234567890);
--   end;
--==============================================================================
procedure free_workspace_app_ids (
    p_workspace_id in number );

--##############################################################################
--#
--# I N T E R A C T I V E   R E P O R T S
--#
--##############################################################################

--==============================================================================
procedure remove_saved_reports(
    p_application_id      in number default null );

--==============================================================================
procedure remove_saved_report(
    p_application_id      in number,
    p_report_id           in number);

--==============================================================================
procedure remove_subscription (
    p_subscription_id     in number);

--##############################################################################
--#
--# A U T H O R I Z E D   U R L S
--#
--##############################################################################

--==============================================================================
procedure add_authorized_url(
    p_url                 in varchar2,
    p_description         in varchar2 default null );

--==============================================================================
procedure remove_authorized_url(
    p_url                 in varchar2 );

--==============================================================================
function get_authorized_urls return wwv_flow_global.vc_arr2;

--##############################################################################
--#
--# R E S T R I C T E D   S C H E M A S
--#
--##############################################################################

--==============================================================================
-- Revoke the privilege to assign a schema to workspaces
--
-- ARGUMENTS
-- * p_schema               the schema
--
-- EXAMPLE
--   Revoke the privilege to assign schema HR to workspaces
--
--   begin
--       apex_instance_admin.restrict_schema(p_schema => 'HR');
--       commit;
--   end;
--
-- SEE ALSO
--   unrestrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_schema_exceptions, remove_workspace_exceptions
--==============================================================================
procedure restrict_schema (
    p_schema in varchar2 );

--==============================================================================
-- Re-grant the privilege to assign a schema to workspaces, if it has been
-- revoked before.
--
-- ARGUMENTS
-- * p_schema               the schema
--
-- EXAMPLE
--   Re-grant the privilege to assign schema HR to workspaces
--
--   begin
--       apex_instance_admin.unrestrict_schema(p_schema => 'HR');
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_schema_exceptions,  remove_workspace_exceptions
--==============================================================================
procedure unrestrict_schema (
    p_schema in varchar2 );

--==============================================================================
-- Create an exception which allows to assign a restricted schema to a specific
-- workspace.
--
-- ARGUMENTS
-- * p_schema               the schema
-- * p_workspace            the workspace
--
-- EXAMPLE
--   Allow assigning restricted schema HR to workspace HR_WORKSPACE
--
--   begin
--       apex_instance_admin.create_schema_exception (
--           p_schema    => 'HR',
--           p_workspace => 'HR_WORKSPACE' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   remove_schema_exception,
--   remove_schema_exceptions,  remove_workspace_exceptions
--==============================================================================
procedure create_schema_exception (
    p_schema    in varchar2,
    p_workspace in varchar2 );

--==============================================================================
-- Remove an exception which allowed to assign a restricted schema to a specific
-- workspace.
--
-- ARGUMENTS
-- * p_schema               the schema
-- * p_workspace            the workspace
--
-- EXAMPLE
--   Remove exception which allowed to assign HR to HR_WORKSPACE
--
--   begin
--       apex_instance_admin.remove_schema_exception (
--           p_schema    => 'HR',
--           p_workspace => 'HR_WORKSPACE' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   create_schema_exception,
--   remove_schema_exceptions,  remove_workspace_exceptions
--==============================================================================
procedure remove_schema_exception (
    p_schema    in varchar2,
    p_workspace in varchar2 );

--==============================================================================
-- Remove all exceptions which allowed to assign a given restricted schema to
-- workspaces.
--
-- ARGUMENTS
-- * p_schema               the schema
--
-- EXAMPLE
--   Remove all exceptions which allowed assigning HR to workspaces
--
--   begin
--       apex_instance_admin.remove_schema_exceptions (
--           p_schema    => 'HR' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_workspace_exceptions
--==============================================================================
procedure remove_schema_exceptions (
    p_schema    in varchar2 );


--==============================================================================
-- Remove all exceptions which allowed to assign restricted schemas to a
-- given workspace.
--
-- ARGUMENTS
-- * p_workspace            the workspace
--
-- EXAMPLE
--   Remove exception to assign restricted schemas to HR_WORKSPACE
--
--   begin
--       apex_instance_admin.remove_workspace_exceptions (
--           p_workspace => 'HR_WORKSPACE' );
--       commit;
--   end;
--
-- SEE ALSO
--   restrict_schema, unrestrict_schema,
--   create_schema_exception, remove_schema_exception,
--   remove_schema_exceptions
--==============================================================================
procedure remove_workspace_exceptions (
    p_workspace    in varchar2 );

--##############################################################################
--#
--# USER MANAGEMENT
--#
--##############################################################################

--==============================================================================
-- Unlock an APEX workspace user account and optionally also change the user's
-- password.
--
-- Parameters:
-- * p_workspace: Workspace of the user.
-- * p_username:  Name of the user.
-- * p_password:  New password. If not set, only unlock the account.
--
-- Example:
--   Unlock ADMIN in the instance administration workspace and change the
--   password.
--
--     begin
--         apex_instance_admin.unlock_user (
--             p_workspace => 'INTERNAL',
--             p_username  => 'ADMIN',
--             p_password  => 'example password' );
--         commit;
--     end;
--
--   Unlock EXAMPLE_USER in SOME_WORKSPACE, but keep the password.
--
--     begin
--         apex_instance_admin.unlock_user (
--             p_workspace => 'SOME_WORKSPACE',
--             p_username  => 'EXAMPLE_USER' );
--         commit;
--     end;
--==============================================================================
procedure unlock_user (
   p_workspace in varchar2,
   p_username  in varchar2,
   p_password  in varchar2 default null );

--=============================================================================
-- Creates a new DBMS_CLOUD OCI API Key credential. The procedure
-- creates a credential in DBMS_CLOUD using DBMS_CLOUD.CREATE_CREDENTIAL.
--
-- PARAMETERS:
-- * p_credential_name:       name for credential
-- * p_user_ocid:             Oracle Cloud identifier (OCID) for the user
-- * p_tenancy_ocid:          Oracle Cloud identifier (OCID) for the tenancy
-- * p_private_key:           Private key
-- * p_fingerprint:           Fingerprint for the API key
--
--=============================================================================
procedure create_cloud_credential(
    p_credential_name       in varchar2,
    p_user_ocid             in varchar2,
    p_tenancy_ocid          in varchar2,
    p_private_key           in varchar2,
    p_fingerprint           in varchar2 );

--=============================================================================
-- Drops an existing DBMS_CLOUD OCI API Key credential. The procedure
-- drops a credential in DBMS_CLOUD using DBMS_CLOUD.DROP_CREDENTIAL.
--
-- PARAMETERS:
-- * p_credential_name:       name for credential
--
--=============================================================================
procedure drop_cloud_credential(
    p_credential_name       in varchar2 );

--==============================================================================
-- Create an instance administration user account (i.e. a user in the INTERNAL
-- workspace). If the account already exists, unlock it, plus update email and
-- password.
-- This is the procedural equivalent of calling the apxchpwd.sql script.
--
-- Parameters:
-- * p_username: The username.
-- * p_email:    The user's email address.
-- * p_password: The user's new password.
--
-- Example:
--   Create or update user ADMIN.
--
--     begin
--         apex_instance_admin.create_or_update_admin_user (
--             p_username => 'ADMIN',
--             p_email    => 'admin@example.com',
--             p_password => 'example password' );
--         commit;
--     end;
--==============================================================================
procedure create_or_update_admin_user (
    p_username in varchar2,
    p_email    in varchar2,
    p_password in varchar2 );

--==============================================================================
-- Create an instance administration user account (i.e. a user in the INTERNAL
-- workspace). If the account already exists, unlock it. This creates or updates
-- the account with a random password, which is not needed when the builder
-- authentication is Database Accounts.
--
-- Parameters:
-- * p_username: The username.
--
-- Example:
--   Create or update user ADMIN.
--
--     begin
--         apex_instance_admin.create_or_update_admin_user (
--             p_username => 'ADMIN' );
--         commit;
--     end;
--==============================================================================
procedure create_or_update_admin_user (
    p_username in varchar2 );

--##############################################################################
--#
--# W E B   E N T R Y   P O I N T S
--#
--##############################################################################

--==============================================================================
-- Add a public procedure to the list of objects that can be called via the URL.
--
-- The parsing schema (typically APEX_PUBLIC_USER) must have privileges to
-- execute the procedure. You therefore need to grant EXECUTE to PUBLIC or the
-- parsing schema.
--
-- ARGUMENTS
-- * p_name                 The procedure name, prefixed by package name and
--                          schema, unless a public synonym exists.
-- * p_methods              The colon-separated HTTP request methods (GET, POST,
--                          ...), default GET.
--
--                          NOTE: p_methods is deprecated.
--
-- EXAMPLE
--   Enable myschema.mypkg.proc to be called via GET and POST requests, i.e. as
--   https://www.example.com/apex/myschema.mypkg.proc.
--
--   begin
--       apex_instance_admin.add_web_entry_point (
--           p_name    => 'MYSCHEMA.MYPKG.PROC',
--           p_methods => 'GET:POST' );
--       commit;
--   end;
--==============================================================================
procedure add_web_entry_point (
    p_name    in varchar2,
    p_methods in varchar2 default 'GET' );

--==============================================================================
-- Remove a public procedure from the list of objects that can be called via the
-- URL.
--
-- ARGUMENTS
-- * p_name                 The procedure name, prefixed by package name and
--                          schema, unless a public synonym exists.
--
-- EXAMPLE
--   Prevent myschema.mypkg.proc from being called via POST requests.
--
--   begin
--       apex_instance_admin.remove_web_entry_point (
--           p_name   => 'MYSCHEMA.MYPKG.PROC' );
--       commit;
--   end;
--==============================================================================
procedure remove_web_entry_point (
    p_name   in varchar2 );

--##############################################################################
--#
--# L O G S
--#
--##############################################################################

--==============================================================================
procedure set_log_switch_interval(
   p_log_name              in varchar2,
   p_log_switch_after_days in number );

--==============================================================================
procedure truncate_log(
    p_log                 in varchar2 );

--==============================================================================
-- Attempt to establish connection with the configured SMTP server (SMTP_HOST_ADDRESS, etc). An error is returned if
-- connection is unsuccessful, which can indicate incorrect SMTP instance parameters, missing Network ACL, or missing
-- SSL certificate in the Oracle Wallet. This procedure will not return anything if successful.
--==============================================================================
procedure validate_email_config;

--==============================================================================
--##############################################################################
--#
--# AUTO/SELF PROVISIONING WORKSPACE
--#
--##############################################################################

--==============================================================================
-- Adds blocking email pattern(s) when an instance has
-- auto/self-provisioning enabled for workspaces.
-- In case the auto/self provisioning is disabled, the procedure can still
-- be used, however, it will not have any runtime effect.
--
-- Parameters:
-- * p_block_email_patterns    add one or more email patterns to be blocked
--
-- Example:
--
--   begin
--       apex_instance_admin.add_auto_prov_restrictions (
--           p_block_email_patterns => apex_t_varchar2('%@gmail.com','%@foo.com') );
--   end;
--==============================================================================
procedure add_auto_prov_restrictions (
    p_block_email_patterns in wwv_flow_t_varchar2 default null );

--==============================================================================
-- Removes blocking email pattern(s) when an instance has
-- auto/self-provisioning enabled for workspaces.
-- In case the auto/self provisioning is disabled, the procedure can still
-- be used, however, it will not have any runtime effect.
--
-- Parameters:
-- * p_block_email_patterns   add one or more email patterns to be removed
--                            from the wwv_flow_prov_email_pattern table
--
-- Example:
--
--   begin
--       apex_instance_admin.remove_auto_prov_restrictions (
--           p_block_email_patterns => apex_t_varchar2('%@gmail.com','%@foo.com') );
--   end;
--==============================================================================
procedure remove_auto_prov_restrictions (
    p_block_email_patterns in wwv_flow_t_varchar2 default null );

--==============================================================================
-- Check whether the email address used to provision a workspace is valid
-- or used to validate the email address when creating/updating a user
--
-- Parameters:
-- * p_email                 email address
--
-- Example:
--
--   begin
--       if wwv_flow_instance_admin.is_valid_provisioning_email (
--           p_email => 'example@example.com' ) then sys.htp.p('YES');
--       else sys.htp.p('NO');
--       end if;
--   end;
--==============================================================================
function is_valid_provisioning_email(
    p_email            in varchar2 )
    return boolean;

--==============================================================================
-- Grants (read) access for a workspace to an extension workspace.
-- Builder extension menu links of the extension workspace will appear
-- in the grantor workspace's extension menu.
--
-- Parameters:
-- * p_from_workspace:      Name of workspace granting access.
-- * p_to_workspace:        Name of extension workspace.
-- * p_read_access:         If true (default false), the extension workspace
--                          has read access to the grantors repository views
-- * p_menu_label:          Optional extension menu parent label overwrite.
--                          Otherwise shows the name of the extension workspace.
--
-- Example:
-- Grant extension workspace EXTENSIONS read access to workspace MY_WORKSPACE
-- and overwrite the extension menu parent label with 'Tools'
--
-- begin
--     apex_instance_admin.grant_extension_workspace(
--         p_from_workspace      => 'MY_WORKSPACE',
--         p_to_workspace        => 'EXTENSIONS',
--         p_read_access         => true,
--         p_menu_label          => 'Tools' );
-- end;
--==============================================================================
procedure grant_extension_workspace(
    p_from_workspace      in varchar2,
    p_to_workspace        in varchar2,
    p_read_access         in boolean  default false,
    p_menu_label          in varchar2 default null );

--==============================================================================
-- Revokes an existing grant from an extension workspace.
--
-- Parameters:
-- * p_from_workspace:  Name of workspace granting access.
-- * p_to_workspace:    Name of extension workspace.
--
-- Example:
-- Revoke grant from extension workspace EXTENSIONS to workspace MY_WORKSPACE
--
-- begin
--     apex_instance_admin.revoke_extension_workspace(
--         p_from_workspace      => 'MY_WORKSPACE',
--         p_to_workspace        => 'EXTENSIONS' );
-- end;
--==============================================================================
procedure revoke_extension_workspace(
    p_from_workspace      in varchar2,
    p_to_workspace        in varchar2 );

--==============================================================================
-- Subscribes and grants all existing workspaces to an extension workspace.
--
-- Parameters:
-- * p_to_workspace_id:    provisioning_company_id of extension workspace.
--
-- Example:
-- Subscribe and grant read access from all workspaces to extension workspace
-- with provisioning_company_id 12345678
--
-- begin
--     apex_instance_admin.autogrant_extension_workspace(
--         p_to_workspace_id        => 12345678 );
--==============================================================================
procedure autogrant_extension_workspace(
    p_to_workspace_id   in number);

--==============================================================================
-- Subscribes and grants a workspace to all auto subscribe extension workspaces.
--
-- Parameters:
-- * p_from_workspace_id:    provisioning_company_id of extension workspace.
--
-- Example:
-- Subscribe and grant read access to all extension workspaces from workspace
-- with provisioning_company_id 12345678
--
-- begin
--     apex_instance_admin.grant_all_auto_extensions(
--         p_from_workspace_id      => 12345678 );
--==============================================================================
procedure grant_all_auto_extensions(
    p_from_workspace_id in number);
end wwv_flow_instance_admin;

/
show err
