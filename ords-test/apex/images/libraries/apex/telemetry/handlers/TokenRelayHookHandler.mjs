import { NoopRestHookHandler } from './NoopRestHookHandler.mjs';
export class TokenRelayHookHandler extends NoopRestHookHandler {
  constructor( tokenRelayUrl ) {
    super();
    this.tokenRelayUrl = tokenRelayUrl;
    this.currentToken = null;
    this.currentTokenExpiresAt = null; // PATCHED
  }

  handleRequestHook( request ) {
    if ( request.url === this.tokenRelayUrl ) {
      return Promise.resolve( request );
    }
    if ( this.currentToken ) {
      if ( this.currentTokenExpiresAt <= Date.now() ) { // PATCHED
        this.currentToken = null;
      } else {
        let newReq = request.clone();
        newReq.headers.set( 'Authorization', `Bearer ${ this.currentToken.access_token }` );
        return Promise.resolve( newReq );
      }
    }
    return fetch( this.tokenRelayUrl, {
      keepalive: true, // PATCHED
    } )
      .then( ( rsp ) => {
        if ( rsp.ok ) {
          return rsp.json()
            .then( ( json ) => {
              if ( json.access_token ) {
                this.currentToken = json;
                this.currentTokenExpiresAt = Date.now() + ( this.currentToken.expires_in * 1000 ); // PATCHED -- oauth token expiry is expressed in seconds
                let newReq = request.clone();
                newReq.headers.set( 'Authorization', `Bearer ${ this.currentToken.access_token }` );
                return Promise.resolve( newReq );
              } else {
                return Promise.reject( new Error( 'Invalid token response: ' + JSON.stringify( json ) ) );
              }
            } )
            .catch( ( /* err */ ) => {
              return Promise.reject( new Error( 'Invalid JSON response' ) );
            } );
        } else {
          return Promise.reject( new Error( 'Token relay failed: ' + rsp.status + ' ' + rsp.statusText ) );
        }
      } ).catch( ( err ) => {
        return Promise.reject( err );
      } );
  }
}
