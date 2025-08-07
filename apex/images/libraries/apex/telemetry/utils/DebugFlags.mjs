const FLAG_PREFIX = 'apex.redwood.otel.options.';
const CLS_COMPRESSION_ENABLED = `${ FLAG_PREFIX }cls_compression_enabled`;
const CONSOLE_EXPORTER_ENABLED = `${ FLAG_PREFIX }console_exporter_enabled`;

export class DebugFlags {
  static isClsCompressionEnabled() {
    return localStorage.getItem( CLS_COMPRESSION_ENABLED ) !== 'false';
  }

  static isConsoleExporterEnabled() {
    return localStorage.getItem( CONSOLE_EXPORTER_ENABLED ) === 'true';
  }
}
