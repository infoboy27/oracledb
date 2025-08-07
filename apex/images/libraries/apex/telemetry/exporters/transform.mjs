import { RandomIdGenerator } from '@apexthirdparty/opentelemetry-sdk-trace-base';
import { hrTimeToMilliseconds, hrTimeDuration } from '@apexthirdparty/opentelemetry-core';
const idGenerator = new RandomIdGenerator();
/**
 * Converts a span to a pair of CLS Logs
 * @param span
 */
export function toClsLogs( span ) {
  let retval = [];
  const endMessageType = extractEndMessageType( span );
  const startTime = hrTimeToMilliseconds( span.startTime );
  const endTime = hrTimeToMilliseconds( span.endTime );
  const coreMsg = {
    span_id: span.spanContext().spanId,
    trace_id: span.spanContext().traceId,
    parent_span_id: span.parentSpanId || null,
    reference_type: span.parentSpanId ? 'childOf' : null,
    level: 'trace',
    event: span.name,
  };
  const attributes = parseAttributes( span );
  // Start message
  // const startMsg = {
  //   ...coreMsg,
  //   ts: startTime,
  //   start_time: startTime,
  //   message_type: endMessageType.replace( 'end', 'start' ),
  //   msg: attributes.msg ? attributes.msg.replace( 'end', 'start' ) : `starting span ${ span.name }`,
  //   ...( attributes ), // PATCHED -- should be last
  // }; // PATCHED -- we don't need start messages going forward, but they could be optionally enabled in a debug mode
  // End message
  const endMsg = {
    ...coreMsg,
    ts: endTime,
    start_time: startTime,
    end_time: endTime,
    duration: hrTimeToMilliseconds( span.duration ),
    message_type: endMessageType,
    msg: attributes.msg ? attributes.msg : `ending span ${ span.name }`, // PATCHED -- end msg was missing
    ...( attributes ),
  };
    // Push start log unless a boosted span
  if ( !span.attributes[ 'priority.boosted' ] ) {
    // retval.push( startMsg ); // PATCHED -- we don't need start messages going forward, but they could be optionally enabled in a debug mode
  }
  // Convert span events
  span.events.forEach( evt => {
    if ( shouldPromote( evt ) ) {
      retval.push( eventToClsLog( span, attributes, evt ) );
    }
  } );
  // Push end log
  retval.push( endMsg );
  return retval;
}
/**
 * Map of promotable events
 */
const eventMap = {
  'heroRendered': 1,
  'heroReady': 1,
  'allHeroesReady': 1,
  'allHeroesRendered': 1,
};
/**
 * Determine if this event should be promoted to a span
 * @param evt
 */
function shouldPromote( evt ) {
  return eventMap[ evt.name ] !== undefined;
}
/**
 * Extract attributes, doing any conversion necessary
 * @param span
 */
function parseAttributes( span ) {
  const attrs = {
    ...( span.attributes ),
    // ...(span.resource.attributes)
  };
  return attrs;
}
/**
 * Attributes inherited by resources etc. on newly
 * created child spans
 */
const inheritedSpanAttributes = {
  'container.path': 1,
  'container.type': 1,
  'container.id': 1,
  'container.parent_id': 1,
  'session_id': 1,
  'component': 1,
  'user.guid': 1,
  'product.name': 1,
  'product.family': 1,
};
/**
 * Returns the end message type for the CLS log
 * @param span
 * @returns
 */
function extractEndMessageType( span ) {
  return span.parentSpanId ? 'span/end' : 'span/end/root/browser';
}
/**
 * Converts a span event to a CLS log as a child of the given span
 * @param span
 */
function eventToClsLog( span, spanAttributes, evt ) {
  const ts = hrTimeToMilliseconds( evt.time );
  // Inherit certain span attributes
  const inheritedAttributes = {};
  Object.keys( spanAttributes )
    .filter( key => inheritedSpanAttributes[ key ] !== undefined )
    .forEach( key => inheritedAttributes[ key ] = spanAttributes[ key ] );
  return {
    trace_id: span.spanContext().traceId,
    span_id: idGenerator.generateSpanId(),
    event: `metric/${ evt.name }`,
    parent_span_id: span.spanContext().spanId,
    reference_type: 'childOf',
    message_type: 'span/end',
    start_time: hrTimeToMilliseconds( span.startTime ),
    duration: hrTimeToMilliseconds( hrTimeDuration( span.startTime, evt.time ) ),
    end_time: ts,
    ts,
    level: 'trace',
    ...( inheritedAttributes ),
    ...( evt.attributes ),
  };
}
