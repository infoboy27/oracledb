Rem  Copyright (c) 2021, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      wwv_sample_dmls_health.sql
Rem
Rem    DESCRIPTION
Rem      Insert Sample datasets during APEX installation
Rem
Rem    IMPORTANT: If DML lengh > 4000, DML cannot exceed 255 chars per line.
Rem               When DML > 4000, install uses varchar2 255 array to execute DDL.
Rem

Rem    MODIFIED     (MM/DD/YYYY)
Rem    dpeake        03/17/2021 - Created

set define '^'
prompt ...Oracle APEX Sample installation of datasets

prompt
prompt ...insert into wwv_sample_dmls - Health
prompt

declare
  l_clob clob;
begin
    -- Insert into JSON Table
    delete from wwv_sample_json
    where wwv_sample_dataset_id = 7;

    -- English JSON
    l_clob :=q'~{
"application": {
  "name": "Demonstration - Health",
  "appShortDescription": "Generated based on a Sample Dataset!",
  "appDescription": "This application was generated directly from Sample Datasets. Go to SQL Workshop, Utilities, Sample Datasets to install tables and then create an application based on those tables.",
  "features": {
    "progressiveWebApp": true,
    "pushNotifications": true,
    "accessControl": true,
    "activityReporting": true,
    "configurationOptions": true,
    "feedback": true,
    "helpPages": true,
    "themeSelection": true
    },
  "appearance": {
    "themeStyle": "Vista",
    "navigation": "MEGA",
    "icon": "app-icon-shield",
    "iconBackgroundClass": "app-color-8",
    "iconColorHEX": "#6E8598"
    },
  "settings": {
    "baseTablePrefix": "HEALTH_",
    "primaryLanguage": "en",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "Home",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ],
  "generalSettings": {
    "builtWithLove": false,
    "learnAppDefaults": false,
    "version": "Release 1.0",
    "logging": true,
    "debugging": true
    },
  "securitySettings": {
    "deepLinking": false,
    "maximumSessionSeconds": "",
    "maximumSessionIdleSeconds": ""
    }
  }
}~';

    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  7, 'en', l_clob);

    commit;

    -- Insert into DML Table
    delete from wwv_sample_dmls
    where wwv_sample_dataset_id = 7;

    l_clob :=q'~declare
type t_health_states is table of health_states%rowtype index by binary_integer;
l_health_states t_health_states;
procedure h (  p_state         in varchar2
             , p_code          in varchar2
             , p_state_region  in varchar2
             , p_state_type    in varchar2
             , p_population    in number
            ) is
  begin
    l_health_states(l_health_states.count + 1).state     := p_state;
    l_health_states(l_health_states.count).code          := p_code;
    l_health_states(l_health_states.count).state_region  := p_state_region;
    l_health_states(l_health_states.count).state_type    := p_state_type;
    l_health_states(l_health_states.count).population    := p_population;
  end;
begin
h ('Alabama', 'AL', 'Southeast', 'state', 4921532);
h ('Alaska', 'AK', 'Pacific', 'state', 731158 );
h ('Arizona','AZ','Southwest','state', 7421401 );
h ('Arkansas','AR','Midwest','state', 3030522 );
h ('California','CA','Pacific','state', 39368078 );
h ('Colorado','CO','Rocky Mountains','state', 5807719 );
h ('Connecticut','CT','Northeast','state', 3557006 );
h ('Delaware','DE','Northeast','state', 986809 );
h ('Dist. of Columbia','DC','Northeast','district', 712816 );
h ('Florida','FL','Southeast','state', 21733312 );
h ('Georgia','GA','Southeast','state', 10710017 );
h ('Guam','GU','Pacific Islands','territory', 168485 );
h ('Hawaii','HI','Pacific','state', 1407006 );
h ('Idaho','ID','Rocky Mountains','state', 1826913 );
h ('Illinois','IL','Midwest','state', 12587530 );
h ('Indiana','IN','Midwest','state', 6754953 );
h ('Iowa','IA','Midwest','state', 3163561 );
h ('Kansas','KS','Midwest','state', 2913805 );
h ('Kentucky','KY','Southeast','state', 4477251 );
h ('Louisiana','LA','Southeast','state', 4645318 );
h ('Maine','ME','Northeast','state', 1350141 );
h ('Maryland','MD','Northeast','state', 6055802 );
h ('Marshall Islands','MH','Pacific Islands','territory', 58791 );
h ('Massachusetts','MA','Northeast','state', 6893574 );
h ('Michigan','MI','Midwest','state', 9966555 );
h ('Micronesia','FM','Pacific Islands','territory', 104468 );
h ('Minnesota','MN','Midwest','state', 5657342 );
h ('Mississippi','MS','Southeast','state', 2966786 );
h ('Missouri','MO','Midwest','state', 6151548 );
h ('Montana','MT','Rocky Mountains','state', 1080577 );
h ('Nebraska','NE','Midwest','state', 1937552 );
h ('Nevada','NV','Rocky Mountains','state', 3138259 );
h ('New Hampshire','NH','Northeast','state', 1366275 );
h ('New Jersey','NJ','Northeast','state', 8882371 );
h ('New Mexico','NM','Western','state', 2106319 );
h ('New York','NY','Northeast','state', 19336776 );
h ('North Carolina','NC','Southeast','state', 10600823 );
h ('North Dakota','ND','Midwest','state', 765309 );
h ('Northern Marianas','MP','Pacific Islands','territory', 51433 );
h ('Ohio','OH','Midwest','state', 11693217 );
h ('Oklahoma','OK','Southwest','state', 3980783 );
h ('Oregon','OR','Pacific','territory', 4241507 );
h ('Palau','PW','Pacific Islands','state', 17907 );
h ('Pennsylvania','PA','Northeast','state', 12783254 );
h ('Puerto Rico','PR','Caribbean','territory', 3189068 );
h ('Rhode Island','RI','Northeast','state', 1057125 );
h ('South Carolina','SC','Southeast','state', 5218040 );
h ('South Dakota','SD','Midwest','state', 892717 );
h ('Tennessee','TN','Southeast','state', 6886834 );
h ('Texas','TX','South Central','state', 29360759 );
h ('Utah','UT','Rocky Mountains','state', 3205958 );
h ('Vermont','VT','Northeast','state', 623347 );
h ('Virginia','VA','Southeast','state', 8590563 );
h ('Virgin Islands','VI','Caribbean','territory', 106235 );
h ('Washington','WA','Pacific','state', 7693612 );
h ('West Virginia','WV','Southeast','state', 1784787 );
h ('Wisconsin','WI','Midwest','state', 5832655 );
h ('Wyoming','WY','Rocky Mountains','state', 582328);
forall i in indices of l_health_states
  insert into health_states values l_health_states(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  7, 'en', 'Insert Health States', 10, l_clob);

    l_clob :=q'~declare
    l_output      blob;
    l_err_out     clob;
    l_clob        clob;
    l_file_ext    varchar2(2000);
    l_mime_type   varchar2(2000);
    l_bp_name     varchar2(200) := 'PATIENT STATUS';
    l_table1      varchar2(200) := 'health_patients';
    l_table2      varchar2(200) := 'health_status_updates';
    l_format      varchar2(2000) := 'FAST INSERT INTO';
    l_dob_start   date default sysdate - 34500;
    l_dob_end     date default sysdate - 6570;
    l_date_start  date default sysdate - 14;
    l_date_end    date default sysdate;
    l_id          number;
begin

    begin
        apex_dg_data_gen.remove_blueprint(
            p_name                  => l_bp_name
            );
    exception when no_data_found then null;
    end;

    apex_dg_data_gen.add_blueprint(
        p_name                  => l_bp_name,
        p_description           => 'Patient Status Updates',
        p_default_schema        => sys_context('USERENV','CURRENT_USER'),
        p_blueprint_id          => l_id
        );

    apex_dg_data_gen.add_table(
        p_blueprint             => l_bp_name,
        p_sequence              => 10,
        p_table_name            => l_table1,
        p_display_name          => 'Patients',
        p_singular_name         => 'patient',
        p_plural_name           => 'Patients',
        p_rows                  => 200,
        p_table_id              => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 10,
        p_table_name            => l_table1,
        p_column_name           => 'patient_id',
        p_data_source_type      => 'SEQUENCE',
        p_max_numeric_value     => 1000000000000000,
        p_sequence_start_with   => 1000,
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 20,
        p_table_name            => l_table1,
        p_column_name           => 'first_name',
        p_display_name          => 'First Name',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'person.first_name',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 30,
        p_table_name            => l_table1,
        p_column_name           => 'last_name',
        p_display_name          => 'Last Name',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'person.last_name',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 35,
        p_table_name            => l_table1,
        p_column_name           => 'cell_phone',
        p_display_name          => 'Cell Phone',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'phone.us_phone_number',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 40,
        p_table_name            => l_table1,
        p_column_name           => 'email_address',
        p_display_name          => 'Email Address',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'person.email',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 50,
        p_table_name            => l_table1,
        p_column_name           => 'city',
        p_display_name          => 'City',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'location.city',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 60,
        p_table_name            => l_table1,
        p_column_name           => 'longitude',
        p_display_name          => 'Longitude',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'location.longitude',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 70,
        p_table_name            => l_table1,
        p_column_name           => 'latitude',
        p_display_name          => 'Latitude',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'location.latitude',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 80,
        p_table_name            => l_table1,
        p_column_name           => 'state',
        p_display_name          => 'State',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'location.state_name',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 90,
        p_table_name            => l_table1,
        p_column_name           => 'postal_code',
        p_display_name          => 'Postal Code',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'location.zip_vc',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 100,
        p_table_name            => l_table1,
        p_column_name           => 'county',
        p_display_name          => 'County',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'location.county_name',
        p_column_id             => l_id
        );

   apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 110,
        p_table_name            => l_table1,
        p_column_name           => 'dob',
        p_display_name          => 'Date of Birth',
        p_data_source_type      => 'BUILTIN', --in varchar2,
        p_data_source           => 'date.date_between_min_and_max',
        p_min_date_value        => l_dob_start,
        p_max_date_value        => l_dob_end,
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 120,
        p_table_name            => l_table1,
        p_column_name           => 'sex',
        p_display_name          => 'Sex',
        p_data_source_type      => 'INLINE',
        p_data_source           => 'Male,52;Female,48',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_table(
        p_blueprint             => l_bp_name,
        p_sequence              => 20,
        p_table_name            => l_table2,
        p_display_name          => 'Status Updates',
        p_singular_name         => 'Status Update',
        p_plural_name           => 'Status Updates',
        p_rows                  => 2500,
        p_table_id              => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 10,
        p_table_name            => l_table2,
        p_column_name           => 'status_update_id',
        p_data_source_type      => 'SEQUENCE',
        p_max_numeric_value     => 1000000000000000000,
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 20,
        p_table_name            => l_table2,
        p_column_name           => 'patient_id',
        p_data_source_type      => 'BLUEPRINT',
        p_data_source           => 'health_patients.patient_id',
        p_column_id             => l_id
        );

   apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 30,
        p_table_name            => l_table2,
        p_column_name           => 'date_provided',
        p_display_name          => 'Date Provided',
        p_data_source_type      => 'BUILTIN', --in varchar2,
        p_data_source           => 'date.date_between_min_and_max',
        p_min_date_value        => l_date_start,
        p_max_date_value        => l_date_end,
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 40,
        p_table_name            => l_table2,
        p_column_name           => 'feeling_today',
        p_display_name          => 'Feeling Today',
        p_data_source_type      => 'INLINE',
        p_data_source           => 'Good,83;Fair,13;Poor,4',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 50,
        p_table_name            => l_table2,
        p_column_name           => 'feverish_today',
        p_display_name          => 'Feverish Today',
        p_data_source_type      => 'INLINE',
        p_data_source           => 'Yes,9;No,91',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 60,
        p_table_name            => l_table2,
        p_column_name           => 'impact',
        p_display_name          => 'Impact',
        p_multi_value           => 'Y',
        p_mv_delimiter          => ':',
        p_mv_min_entries        => 1,
        p_mv_max_entries        => 3,
        p_data_source_type      => 'INLINE',
        p_data_source           => 'Be unable to work,5;Be unable to do normal activities,3;Be unable to get care from a healthcare professional,2',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 70,
        p_table_name            => l_table2,
        p_column_name           => 'injection_site_symptoms',
        p_display_name          => 'Injection Site Symtoms',
        p_data_source_type      => 'INLINE',
        p_data_source           => 'Pain,4;Redness,3;Swelling,2;Itching,1',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 80,
        p_table_name            => l_table2,
        p_column_name           => 'general_symptoms',
        p_display_name          => 'General Symtoms',
        p_multi_value           => 'Y',
        p_mv_delimiter          => ':',
        p_mv_min_entries        => 1,
        p_mv_max_entries        => 3,
        p_data_source_type      => 'INLINE',
        p_data_source           => 'Chills,10;Headache,20;Joint pains,10;Muscle or body aches,10;Fatigue or tiredness,10;Nausea,10;Vomiting,10;Diarrhea,5;Abdominal pain,5;Rash near injection site,10',
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 90,
        p_table_name            => l_table2,
        p_column_name           => 'highest_temp',
        p_display_name          => 'Highest Temp',
        p_data_source_type      => 'BUILTIN',
        p_data_source           => 'number.random',
        p_min_numeric_value     => 99,
        p_max_numeric_value     => 105,
        p_numeric_precision     => 1,
        p_column_id             => l_id
        );

    apex_dg_data_gen.add_column(
        p_blueprint             => l_bp_name,
        p_sequence              => 100,
        p_table_name            => l_table2,
        p_column_name           => 'healthcare_visit',
        p_display_name          => 'Healthcare Visit',
        p_data_source_type      => 'INLINE',
        p_data_source           => 'Telehealth / virtual health,4;Outpatient visit,3;Emergency room visit,2;Hospitalization,1',
        p_column_id             => l_id
        );

    commit;


    apex_dg_data_gen.generate_data (
        p_blueprint            => l_bp_name,
        p_format               => l_format,
        p_file_ext             => l_file_ext,
        p_mime_type            => l_mime_type,
        p_output               => l_output,
        p_errors               => l_err_out
        );

end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  7, 'en', 'Populate Health Patients and Status Updates', 20, l_clob);

    commit;
end;
/
