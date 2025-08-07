set define '^' verify off
--------------------------------------------------------------------------------
--
--  Copyright (c) 2024, Oracle and/or its affiliates.
--
--  NAME
--    object_dependencies_triggers.sql
--
--  DESCRIPTION
--    Create triggers for Object Dependency reports
--
--  MODIFIED   (MM/DD/YYYY)
--  JPKEMP      02/19/2024 - Created
--
--------------------------------------------------------------------------------

prompt ... Create APEX Object Dependency triggers

--------------------------------------------------------------------------------

prompt ...trigger used_db_objects_t1
create or replace trigger used_db_objects_t1
    before insert on wwv_flow_used_db_objects
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
end;
/
show err

prompt ...trigger used_obj_comp_props_t1
create or replace trigger used_obj_comp_props_t1
    before insert or update on wwv_flow_used_obj_comp_props
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := wwv_flow_id.next_val;
        end if;
        if :new.security_group_id is null then
            :new.security_group_id := wwv_flow_security.g_security_group_id;
        end if;
    end if;
    if (inserting and :new.code_fragment_hash is null)
       or updating
    then
        :new.code_fragment_hash := wwv_flow_crypto.hash_raw (
                                       p_src      => :new.code_fragment,
                                       p_function => wwv_flow_crypto.c_hash_sh256 );
    end if;
end;
/
show err

prompt ...trigger used_obj_dependencies_t1
create or replace trigger used_obj_dependencies_t1
    before insert on wwv_flow_used_obj_dependencies
    for each row
begin
    if :new.id is null then
        :new.id := wwv_flow_id.next_val;
    end if;
    if :new.security_group_id is null then
        :new.security_group_id := wwv_flow_security.g_security_group_id;
    end if;
end;
/
show err

--------------------------------------------------------------------------------

prompt ...done creating APEX Object Dependency triggers

set define '^'