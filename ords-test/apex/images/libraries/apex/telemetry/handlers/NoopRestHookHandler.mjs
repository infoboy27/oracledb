export class NoopRestHookHandler {
    handlePreFetchHook() {
      return Promise.resolve();
    }
    handleRequestHook( request ) {
      return Promise.resolve( request );
    }
    handleResponseHook( response ) {
      return Promise.resolve( response );
    }
    handlePostFetchHook() {
      return Promise.resolve();
    }
    handlePostFetchErrorHook() {
      return Promise.resolve();
    }
  }
  