(() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __esm = (fn, res) => function __init() {
    return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
  };
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
  var __export = (target, all) => {
    for (var name in all)
      __defProp(target, name, { get: all[name], enumerable: true });
  };
  var __copyProps = (to, from, except, desc) => {
    if (from && typeof from === "object" || typeof from === "function") {
      for (let key of __getOwnPropNames(from))
        if (!__hasOwnProp.call(to, key) && key !== except)
          __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
    }
    return to;
  };
  var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
    // If the importer is in node compatibility mode or this is not an ESM
    // file that has been converted to a CommonJS file using a Babel-
    // compatible transform (i.e. "__esModule" has not been set), then set
    // "default" to the CommonJS "module.exports" for node compatibility.
    isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
    mod
  ));
  var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

  // node_modules/@opentelemetry/api/build/esm/platform/browser/globalThis.js
  var _globalThis;
  var init_globalThis = __esm({
    "node_modules/@opentelemetry/api/build/esm/platform/browser/globalThis.js"() {
      _globalThis = typeof globalThis === "object" ? globalThis : typeof self === "object" ? self : typeof window === "object" ? window : typeof global === "object" ? global : {};
    }
  });

  // node_modules/@opentelemetry/api/build/esm/platform/browser/index.js
  var init_browser = __esm({
    "node_modules/@opentelemetry/api/build/esm/platform/browser/index.js"() {
      init_globalThis();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/version.js
  var VERSION;
  var init_version = __esm({
    "node_modules/@opentelemetry/api/build/esm/version.js"() {
      VERSION = "1.9.0";
    }
  });

  // node_modules/@opentelemetry/api/build/esm/internal/semver.js
  function _makeCompatibilityCheck(ownVersion) {
    var acceptedVersions = /* @__PURE__ */ new Set([ownVersion]);
    var rejectedVersions = /* @__PURE__ */ new Set();
    var myVersionMatch = ownVersion.match(re);
    if (!myVersionMatch) {
      return function() {
        return false;
      };
    }
    var ownVersionParsed = {
      major: +myVersionMatch[1],
      minor: +myVersionMatch[2],
      patch: +myVersionMatch[3],
      prerelease: myVersionMatch[4]
    };
    if (ownVersionParsed.prerelease != null) {
      return function isExactmatch(globalVersion) {
        return globalVersion === ownVersion;
      };
    }
    function _reject(v) {
      rejectedVersions.add(v);
      return false;
    }
    function _accept(v) {
      acceptedVersions.add(v);
      return true;
    }
    return function isCompatible3(globalVersion) {
      if (acceptedVersions.has(globalVersion)) {
        return true;
      }
      if (rejectedVersions.has(globalVersion)) {
        return false;
      }
      var globalVersionMatch = globalVersion.match(re);
      if (!globalVersionMatch) {
        return _reject(globalVersion);
      }
      var globalVersionParsed = {
        major: +globalVersionMatch[1],
        minor: +globalVersionMatch[2],
        patch: +globalVersionMatch[3],
        prerelease: globalVersionMatch[4]
      };
      if (globalVersionParsed.prerelease != null) {
        return _reject(globalVersion);
      }
      if (ownVersionParsed.major !== globalVersionParsed.major) {
        return _reject(globalVersion);
      }
      if (ownVersionParsed.major === 0) {
        if (ownVersionParsed.minor === globalVersionParsed.minor && ownVersionParsed.patch <= globalVersionParsed.patch) {
          return _accept(globalVersion);
        }
        return _reject(globalVersion);
      }
      if (ownVersionParsed.minor <= globalVersionParsed.minor) {
        return _accept(globalVersion);
      }
      return _reject(globalVersion);
    };
  }
  var re, isCompatible;
  var init_semver = __esm({
    "node_modules/@opentelemetry/api/build/esm/internal/semver.js"() {
      init_version();
      re = /^(\d+)\.(\d+)\.(\d+)(-(.+))?$/;
      isCompatible = _makeCompatibilityCheck(VERSION);
    }
  });

  // node_modules/@opentelemetry/api/build/esm/internal/global-utils.js
  function registerGlobal(type, instance, diag3, allowOverride) {
    var _a2;
    if (allowOverride === void 0) {
      allowOverride = false;
    }
    var api = _global[GLOBAL_OPENTELEMETRY_API_KEY] = (_a2 = _global[GLOBAL_OPENTELEMETRY_API_KEY]) !== null && _a2 !== void 0 ? _a2 : {
      version: VERSION
    };
    if (!allowOverride && api[type]) {
      var err2 = new Error("@opentelemetry/api: Attempted duplicate registration of API: " + type);
      diag3.error(err2.stack || err2.message);
      return false;
    }
    if (api.version !== VERSION) {
      var err2 = new Error("@opentelemetry/api: Registration of version v" + api.version + " for " + type + " does not match previously registered API v" + VERSION);
      diag3.error(err2.stack || err2.message);
      return false;
    }
    api[type] = instance;
    diag3.debug("@opentelemetry/api: Registered a global for " + type + " v" + VERSION + ".");
    return true;
  }
  function getGlobal(type) {
    var _a2, _b;
    var globalVersion = (_a2 = _global[GLOBAL_OPENTELEMETRY_API_KEY]) === null || _a2 === void 0 ? void 0 : _a2.version;
    if (!globalVersion || !isCompatible(globalVersion)) {
      return;
    }
    return (_b = _global[GLOBAL_OPENTELEMETRY_API_KEY]) === null || _b === void 0 ? void 0 : _b[type];
  }
  function unregisterGlobal(type, diag3) {
    diag3.debug("@opentelemetry/api: Unregistering a global for " + type + " v" + VERSION + ".");
    var api = _global[GLOBAL_OPENTELEMETRY_API_KEY];
    if (api) {
      delete api[type];
    }
  }
  var major, GLOBAL_OPENTELEMETRY_API_KEY, _global;
  var init_global_utils = __esm({
    "node_modules/@opentelemetry/api/build/esm/internal/global-utils.js"() {
      init_browser();
      init_version();
      init_semver();
      major = VERSION.split(".")[0];
      GLOBAL_OPENTELEMETRY_API_KEY = Symbol.for("opentelemetry.js.api." + major);
      _global = _globalThis;
    }
  });

  // node_modules/@opentelemetry/api/build/esm/diag/ComponentLogger.js
  function logProxy(funcName, namespace, args) {
    var logger = getGlobal("diag");
    if (!logger) {
      return;
    }
    args.unshift(namespace);
    return logger[funcName].apply(logger, __spreadArray([], __read(args), false));
  }
  var __read, __spreadArray, DiagComponentLogger;
  var init_ComponentLogger = __esm({
    "node_modules/@opentelemetry/api/build/esm/diag/ComponentLogger.js"() {
      init_global_utils();
      __read = function(o, n) {
        var m = typeof Symbol === "function" && o[Symbol.iterator];
        if (!m) return o;
        var i = m.call(o), r, ar = [], e;
        try {
          while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
        } catch (error) {
          e = { error };
        } finally {
          try {
            if (r && !r.done && (m = i["return"])) m.call(i);
          } finally {
            if (e) throw e.error;
          }
        }
        return ar;
      };
      __spreadArray = function(to, from, pack) {
        if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
          if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
          }
        }
        return to.concat(ar || Array.prototype.slice.call(from));
      };
      DiagComponentLogger = /** @class */
      function() {
        function DiagComponentLogger3(props) {
          this._namespace = props.namespace || "DiagComponentLogger";
        }
        DiagComponentLogger3.prototype.debug = function() {
          var args = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
          }
          return logProxy("debug", this._namespace, args);
        };
        DiagComponentLogger3.prototype.error = function() {
          var args = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
          }
          return logProxy("error", this._namespace, args);
        };
        DiagComponentLogger3.prototype.info = function() {
          var args = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
          }
          return logProxy("info", this._namespace, args);
        };
        DiagComponentLogger3.prototype.warn = function() {
          var args = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
          }
          return logProxy("warn", this._namespace, args);
        };
        DiagComponentLogger3.prototype.verbose = function() {
          var args = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
          }
          return logProxy("verbose", this._namespace, args);
        };
        return DiagComponentLogger3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/diag/types.js
  var DiagLogLevel;
  var init_types = __esm({
    "node_modules/@opentelemetry/api/build/esm/diag/types.js"() {
      (function(DiagLogLevel3) {
        DiagLogLevel3[DiagLogLevel3["NONE"] = 0] = "NONE";
        DiagLogLevel3[DiagLogLevel3["ERROR"] = 30] = "ERROR";
        DiagLogLevel3[DiagLogLevel3["WARN"] = 50] = "WARN";
        DiagLogLevel3[DiagLogLevel3["INFO"] = 60] = "INFO";
        DiagLogLevel3[DiagLogLevel3["DEBUG"] = 70] = "DEBUG";
        DiagLogLevel3[DiagLogLevel3["VERBOSE"] = 80] = "VERBOSE";
        DiagLogLevel3[DiagLogLevel3["ALL"] = 9999] = "ALL";
      })(DiagLogLevel || (DiagLogLevel = {}));
    }
  });

  // node_modules/@opentelemetry/api/build/esm/diag/internal/logLevelLogger.js
  function createLogLevelDiagLogger(maxLevel, logger) {
    if (maxLevel < DiagLogLevel.NONE) {
      maxLevel = DiagLogLevel.NONE;
    } else if (maxLevel > DiagLogLevel.ALL) {
      maxLevel = DiagLogLevel.ALL;
    }
    logger = logger || {};
    function _filterFunc(funcName, theLevel) {
      var theFunc = logger[funcName];
      if (typeof theFunc === "function" && maxLevel >= theLevel) {
        return theFunc.bind(logger);
      }
      return function() {
      };
    }
    return {
      error: _filterFunc("error", DiagLogLevel.ERROR),
      warn: _filterFunc("warn", DiagLogLevel.WARN),
      info: _filterFunc("info", DiagLogLevel.INFO),
      debug: _filterFunc("debug", DiagLogLevel.DEBUG),
      verbose: _filterFunc("verbose", DiagLogLevel.VERBOSE)
    };
  }
  var init_logLevelLogger = __esm({
    "node_modules/@opentelemetry/api/build/esm/diag/internal/logLevelLogger.js"() {
      init_types();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/api/diag.js
  var __read2, __spreadArray2, API_NAME, DiagAPI;
  var init_diag = __esm({
    "node_modules/@opentelemetry/api/build/esm/api/diag.js"() {
      init_ComponentLogger();
      init_logLevelLogger();
      init_types();
      init_global_utils();
      __read2 = function(o, n) {
        var m = typeof Symbol === "function" && o[Symbol.iterator];
        if (!m) return o;
        var i = m.call(o), r, ar = [], e;
        try {
          while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
        } catch (error) {
          e = { error };
        } finally {
          try {
            if (r && !r.done && (m = i["return"])) m.call(i);
          } finally {
            if (e) throw e.error;
          }
        }
        return ar;
      };
      __spreadArray2 = function(to, from, pack) {
        if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
          if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
          }
        }
        return to.concat(ar || Array.prototype.slice.call(from));
      };
      API_NAME = "diag";
      DiagAPI = /** @class */
      function() {
        function DiagAPI3() {
          function _logProxy(funcName) {
            return function() {
              var args = [];
              for (var _i = 0; _i < arguments.length; _i++) {
                args[_i] = arguments[_i];
              }
              var logger = getGlobal("diag");
              if (!logger)
                return;
              return logger[funcName].apply(logger, __spreadArray2([], __read2(args), false));
            };
          }
          var self2 = this;
          var setLogger = function(logger, optionsOrLogLevel) {
            var _a2, _b, _c;
            if (optionsOrLogLevel === void 0) {
              optionsOrLogLevel = { logLevel: DiagLogLevel.INFO };
            }
            if (logger === self2) {
              var err2 = new Error("Cannot use diag as the logger for itself. Please use a DiagLogger implementation like ConsoleDiagLogger or a custom implementation");
              self2.error((_a2 = err2.stack) !== null && _a2 !== void 0 ? _a2 : err2.message);
              return false;
            }
            if (typeof optionsOrLogLevel === "number") {
              optionsOrLogLevel = {
                logLevel: optionsOrLogLevel
              };
            }
            var oldLogger = getGlobal("diag");
            var newLogger = createLogLevelDiagLogger((_b = optionsOrLogLevel.logLevel) !== null && _b !== void 0 ? _b : DiagLogLevel.INFO, logger);
            if (oldLogger && !optionsOrLogLevel.suppressOverrideMessage) {
              var stack = (_c = new Error().stack) !== null && _c !== void 0 ? _c : "<failed to generate stacktrace>";
              oldLogger.warn("Current logger will be overwritten from " + stack);
              newLogger.warn("Current logger will overwrite one already registered from " + stack);
            }
            return registerGlobal("diag", newLogger, self2, true);
          };
          self2.setLogger = setLogger;
          self2.disable = function() {
            unregisterGlobal(API_NAME, self2);
          };
          self2.createComponentLogger = function(options) {
            return new DiagComponentLogger(options);
          };
          self2.verbose = _logProxy("verbose");
          self2.debug = _logProxy("debug");
          self2.info = _logProxy("info");
          self2.warn = _logProxy("warn");
          self2.error = _logProxy("error");
        }
        DiagAPI3.instance = function() {
          if (!this._instance) {
            this._instance = new DiagAPI3();
          }
          return this._instance;
        };
        return DiagAPI3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/baggage/internal/baggage-impl.js
  var __read3, __values, BaggageImpl;
  var init_baggage_impl = __esm({
    "node_modules/@opentelemetry/api/build/esm/baggage/internal/baggage-impl.js"() {
      __read3 = function(o, n) {
        var m = typeof Symbol === "function" && o[Symbol.iterator];
        if (!m) return o;
        var i = m.call(o), r, ar = [], e;
        try {
          while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
        } catch (error) {
          e = { error };
        } finally {
          try {
            if (r && !r.done && (m = i["return"])) m.call(i);
          } finally {
            if (e) throw e.error;
          }
        }
        return ar;
      };
      __values = function(o) {
        var s = typeof Symbol === "function" && Symbol.iterator, m = s && o[s], i = 0;
        if (m) return m.call(o);
        if (o && typeof o.length === "number") return {
          next: function() {
            if (o && i >= o.length) o = void 0;
            return { value: o && o[i++], done: !o };
          }
        };
        throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
      };
      BaggageImpl = /** @class */
      function() {
        function BaggageImpl2(entries) {
          this._entries = entries ? new Map(entries) : /* @__PURE__ */ new Map();
        }
        BaggageImpl2.prototype.getEntry = function(key) {
          var entry = this._entries.get(key);
          if (!entry) {
            return void 0;
          }
          return Object.assign({}, entry);
        };
        BaggageImpl2.prototype.getAllEntries = function() {
          return Array.from(this._entries.entries()).map(function(_a2) {
            var _b = __read3(_a2, 2), k = _b[0], v = _b[1];
            return [k, v];
          });
        };
        BaggageImpl2.prototype.setEntry = function(key, entry) {
          var newBaggage = new BaggageImpl2(this._entries);
          newBaggage._entries.set(key, entry);
          return newBaggage;
        };
        BaggageImpl2.prototype.removeEntry = function(key) {
          var newBaggage = new BaggageImpl2(this._entries);
          newBaggage._entries.delete(key);
          return newBaggage;
        };
        BaggageImpl2.prototype.removeEntries = function() {
          var e_1, _a2;
          var keys = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            keys[_i] = arguments[_i];
          }
          var newBaggage = new BaggageImpl2(this._entries);
          try {
            for (var keys_1 = __values(keys), keys_1_1 = keys_1.next(); !keys_1_1.done; keys_1_1 = keys_1.next()) {
              var key = keys_1_1.value;
              newBaggage._entries.delete(key);
            }
          } catch (e_1_1) {
            e_1 = { error: e_1_1 };
          } finally {
            try {
              if (keys_1_1 && !keys_1_1.done && (_a2 = keys_1.return)) _a2.call(keys_1);
            } finally {
              if (e_1) throw e_1.error;
            }
          }
          return newBaggage;
        };
        BaggageImpl2.prototype.clear = function() {
          return new BaggageImpl2();
        };
        return BaggageImpl2;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/baggage/internal/symbol.js
  var baggageEntryMetadataSymbol;
  var init_symbol = __esm({
    "node_modules/@opentelemetry/api/build/esm/baggage/internal/symbol.js"() {
      baggageEntryMetadataSymbol = Symbol("BaggageEntryMetadata");
    }
  });

  // node_modules/@opentelemetry/api/build/esm/baggage/utils.js
  function createBaggage(entries) {
    if (entries === void 0) {
      entries = {};
    }
    return new BaggageImpl(new Map(Object.entries(entries)));
  }
  function baggageEntryMetadataFromString(str) {
    if (typeof str !== "string") {
      diag.error("Cannot create baggage metadata from unknown type: " + typeof str);
      str = "";
    }
    return {
      __TYPE__: baggageEntryMetadataSymbol,
      toString: function() {
        return str;
      }
    };
  }
  var diag;
  var init_utils = __esm({
    "node_modules/@opentelemetry/api/build/esm/baggage/utils.js"() {
      init_diag();
      init_baggage_impl();
      init_symbol();
      diag = DiagAPI.instance();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/context/context.js
  function createContextKey(description) {
    return Symbol.for(description);
  }
  var BaseContext, ROOT_CONTEXT;
  var init_context = __esm({
    "node_modules/@opentelemetry/api/build/esm/context/context.js"() {
      BaseContext = /** @class */
      /* @__PURE__ */ function() {
        function BaseContext3(parentContext) {
          var self2 = this;
          self2._currentContext = parentContext ? new Map(parentContext) : /* @__PURE__ */ new Map();
          self2.getValue = function(key) {
            return self2._currentContext.get(key);
          };
          self2.setValue = function(key, value) {
            var context2 = new BaseContext3(self2._currentContext);
            context2._currentContext.set(key, value);
            return context2;
          };
          self2.deleteValue = function(key) {
            var context2 = new BaseContext3(self2._currentContext);
            context2._currentContext.delete(key);
            return context2;
          };
        }
        return BaseContext3;
      }();
      ROOT_CONTEXT = new BaseContext();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/diag/consoleLogger.js
  var consoleMap, DiagConsoleLogger;
  var init_consoleLogger = __esm({
    "node_modules/@opentelemetry/api/build/esm/diag/consoleLogger.js"() {
      consoleMap = [
        { n: "error", c: "error" },
        { n: "warn", c: "warn" },
        { n: "info", c: "info" },
        { n: "debug", c: "debug" },
        { n: "verbose", c: "trace" }
      ];
      DiagConsoleLogger = /** @class */
      /* @__PURE__ */ function() {
        function DiagConsoleLogger2() {
          function _consoleFunc(funcName) {
            return function() {
              var args = [];
              for (var _i = 0; _i < arguments.length; _i++) {
                args[_i] = arguments[_i];
              }
              if (console) {
                var theFunc = console[funcName];
                if (typeof theFunc !== "function") {
                  theFunc = console.log;
                }
                if (typeof theFunc === "function") {
                  return theFunc.apply(console, args);
                }
              }
            };
          }
          for (var i = 0; i < consoleMap.length; i++) {
            this[consoleMap[i].n] = _consoleFunc(consoleMap[i].c);
          }
        }
        return DiagConsoleLogger2;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/metrics/NoopMeter.js
  function createNoopMeter() {
    return NOOP_METER;
  }
  var __extends, NoopMeter, NoopMetric, NoopCounterMetric, NoopUpDownCounterMetric, NoopGaugeMetric, NoopHistogramMetric, NoopObservableMetric, NoopObservableCounterMetric, NoopObservableGaugeMetric, NoopObservableUpDownCounterMetric, NOOP_METER, NOOP_COUNTER_METRIC, NOOP_GAUGE_METRIC, NOOP_HISTOGRAM_METRIC, NOOP_UP_DOWN_COUNTER_METRIC, NOOP_OBSERVABLE_COUNTER_METRIC, NOOP_OBSERVABLE_GAUGE_METRIC, NOOP_OBSERVABLE_UP_DOWN_COUNTER_METRIC;
  var init_NoopMeter = __esm({
    "node_modules/@opentelemetry/api/build/esm/metrics/NoopMeter.js"() {
      __extends = /* @__PURE__ */ function() {
        var extendStatics = function(d, b) {
          extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
            d2.__proto__ = b2;
          } || function(d2, b2) {
            for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
          };
          return extendStatics(d, b);
        };
        return function(d, b) {
          if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
          extendStatics(d, b);
          function __() {
            this.constructor = d;
          }
          d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
        };
      }();
      NoopMeter = /** @class */
      function() {
        function NoopMeter2() {
        }
        NoopMeter2.prototype.createGauge = function(_name, _options) {
          return NOOP_GAUGE_METRIC;
        };
        NoopMeter2.prototype.createHistogram = function(_name, _options) {
          return NOOP_HISTOGRAM_METRIC;
        };
        NoopMeter2.prototype.createCounter = function(_name, _options) {
          return NOOP_COUNTER_METRIC;
        };
        NoopMeter2.prototype.createUpDownCounter = function(_name, _options) {
          return NOOP_UP_DOWN_COUNTER_METRIC;
        };
        NoopMeter2.prototype.createObservableGauge = function(_name, _options) {
          return NOOP_OBSERVABLE_GAUGE_METRIC;
        };
        NoopMeter2.prototype.createObservableCounter = function(_name, _options) {
          return NOOP_OBSERVABLE_COUNTER_METRIC;
        };
        NoopMeter2.prototype.createObservableUpDownCounter = function(_name, _options) {
          return NOOP_OBSERVABLE_UP_DOWN_COUNTER_METRIC;
        };
        NoopMeter2.prototype.addBatchObservableCallback = function(_callback, _observables) {
        };
        NoopMeter2.prototype.removeBatchObservableCallback = function(_callback) {
        };
        return NoopMeter2;
      }();
      NoopMetric = /** @class */
      /* @__PURE__ */ function() {
        function NoopMetric2() {
        }
        return NoopMetric2;
      }();
      NoopCounterMetric = /** @class */
      function(_super) {
        __extends(NoopCounterMetric2, _super);
        function NoopCounterMetric2() {
          return _super !== null && _super.apply(this, arguments) || this;
        }
        NoopCounterMetric2.prototype.add = function(_value, _attributes) {
        };
        return NoopCounterMetric2;
      }(NoopMetric);
      NoopUpDownCounterMetric = /** @class */
      function(_super) {
        __extends(NoopUpDownCounterMetric2, _super);
        function NoopUpDownCounterMetric2() {
          return _super !== null && _super.apply(this, arguments) || this;
        }
        NoopUpDownCounterMetric2.prototype.add = function(_value, _attributes) {
        };
        return NoopUpDownCounterMetric2;
      }(NoopMetric);
      NoopGaugeMetric = /** @class */
      function(_super) {
        __extends(NoopGaugeMetric2, _super);
        function NoopGaugeMetric2() {
          return _super !== null && _super.apply(this, arguments) || this;
        }
        NoopGaugeMetric2.prototype.record = function(_value, _attributes) {
        };
        return NoopGaugeMetric2;
      }(NoopMetric);
      NoopHistogramMetric = /** @class */
      function(_super) {
        __extends(NoopHistogramMetric2, _super);
        function NoopHistogramMetric2() {
          return _super !== null && _super.apply(this, arguments) || this;
        }
        NoopHistogramMetric2.prototype.record = function(_value, _attributes) {
        };
        return NoopHistogramMetric2;
      }(NoopMetric);
      NoopObservableMetric = /** @class */
      function() {
        function NoopObservableMetric2() {
        }
        NoopObservableMetric2.prototype.addCallback = function(_callback) {
        };
        NoopObservableMetric2.prototype.removeCallback = function(_callback) {
        };
        return NoopObservableMetric2;
      }();
      NoopObservableCounterMetric = /** @class */
      function(_super) {
        __extends(NoopObservableCounterMetric2, _super);
        function NoopObservableCounterMetric2() {
          return _super !== null && _super.apply(this, arguments) || this;
        }
        return NoopObservableCounterMetric2;
      }(NoopObservableMetric);
      NoopObservableGaugeMetric = /** @class */
      function(_super) {
        __extends(NoopObservableGaugeMetric2, _super);
        function NoopObservableGaugeMetric2() {
          return _super !== null && _super.apply(this, arguments) || this;
        }
        return NoopObservableGaugeMetric2;
      }(NoopObservableMetric);
      NoopObservableUpDownCounterMetric = /** @class */
      function(_super) {
        __extends(NoopObservableUpDownCounterMetric2, _super);
        function NoopObservableUpDownCounterMetric2() {
          return _super !== null && _super.apply(this, arguments) || this;
        }
        return NoopObservableUpDownCounterMetric2;
      }(NoopObservableMetric);
      NOOP_METER = new NoopMeter();
      NOOP_COUNTER_METRIC = new NoopCounterMetric();
      NOOP_GAUGE_METRIC = new NoopGaugeMetric();
      NOOP_HISTOGRAM_METRIC = new NoopHistogramMetric();
      NOOP_UP_DOWN_COUNTER_METRIC = new NoopUpDownCounterMetric();
      NOOP_OBSERVABLE_COUNTER_METRIC = new NoopObservableCounterMetric();
      NOOP_OBSERVABLE_GAUGE_METRIC = new NoopObservableGaugeMetric();
      NOOP_OBSERVABLE_UP_DOWN_COUNTER_METRIC = new NoopObservableUpDownCounterMetric();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/metrics/Metric.js
  var ValueType;
  var init_Metric = __esm({
    "node_modules/@opentelemetry/api/build/esm/metrics/Metric.js"() {
      (function(ValueType2) {
        ValueType2[ValueType2["INT"] = 0] = "INT";
        ValueType2[ValueType2["DOUBLE"] = 1] = "DOUBLE";
      })(ValueType || (ValueType = {}));
    }
  });

  // node_modules/@opentelemetry/api/build/esm/propagation/TextMapPropagator.js
  var defaultTextMapGetter, defaultTextMapSetter;
  var init_TextMapPropagator = __esm({
    "node_modules/@opentelemetry/api/build/esm/propagation/TextMapPropagator.js"() {
      defaultTextMapGetter = {
        get: function(carrier, key) {
          if (carrier == null) {
            return void 0;
          }
          return carrier[key];
        },
        keys: function(carrier) {
          if (carrier == null) {
            return [];
          }
          return Object.keys(carrier);
        }
      };
      defaultTextMapSetter = {
        set: function(carrier, key, value) {
          if (carrier == null) {
            return;
          }
          carrier[key] = value;
        }
      };
    }
  });

  // node_modules/@opentelemetry/api/build/esm/context/NoopContextManager.js
  var __read4, __spreadArray3, NoopContextManager;
  var init_NoopContextManager = __esm({
    "node_modules/@opentelemetry/api/build/esm/context/NoopContextManager.js"() {
      init_context();
      __read4 = function(o, n) {
        var m = typeof Symbol === "function" && o[Symbol.iterator];
        if (!m) return o;
        var i = m.call(o), r, ar = [], e;
        try {
          while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
        } catch (error) {
          e = { error };
        } finally {
          try {
            if (r && !r.done && (m = i["return"])) m.call(i);
          } finally {
            if (e) throw e.error;
          }
        }
        return ar;
      };
      __spreadArray3 = function(to, from, pack) {
        if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
          if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
          }
        }
        return to.concat(ar || Array.prototype.slice.call(from));
      };
      NoopContextManager = /** @class */
      function() {
        function NoopContextManager3() {
        }
        NoopContextManager3.prototype.active = function() {
          return ROOT_CONTEXT;
        };
        NoopContextManager3.prototype.with = function(_context, fn, thisArg) {
          var args = [];
          for (var _i = 3; _i < arguments.length; _i++) {
            args[_i - 3] = arguments[_i];
          }
          return fn.call.apply(fn, __spreadArray3([thisArg], __read4(args), false));
        };
        NoopContextManager3.prototype.bind = function(_context, target) {
          return target;
        };
        NoopContextManager3.prototype.enable = function() {
          return this;
        };
        NoopContextManager3.prototype.disable = function() {
          return this;
        };
        return NoopContextManager3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/api/context.js
  var __read5, __spreadArray4, API_NAME2, NOOP_CONTEXT_MANAGER, ContextAPI;
  var init_context2 = __esm({
    "node_modules/@opentelemetry/api/build/esm/api/context.js"() {
      init_NoopContextManager();
      init_global_utils();
      init_diag();
      __read5 = function(o, n) {
        var m = typeof Symbol === "function" && o[Symbol.iterator];
        if (!m) return o;
        var i = m.call(o), r, ar = [], e;
        try {
          while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
        } catch (error) {
          e = { error };
        } finally {
          try {
            if (r && !r.done && (m = i["return"])) m.call(i);
          } finally {
            if (e) throw e.error;
          }
        }
        return ar;
      };
      __spreadArray4 = function(to, from, pack) {
        if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
          if (ar || !(i in from)) {
            if (!ar) ar = Array.prototype.slice.call(from, 0, i);
            ar[i] = from[i];
          }
        }
        return to.concat(ar || Array.prototype.slice.call(from));
      };
      API_NAME2 = "context";
      NOOP_CONTEXT_MANAGER = new NoopContextManager();
      ContextAPI = /** @class */
      function() {
        function ContextAPI3() {
        }
        ContextAPI3.getInstance = function() {
          if (!this._instance) {
            this._instance = new ContextAPI3();
          }
          return this._instance;
        };
        ContextAPI3.prototype.setGlobalContextManager = function(contextManager) {
          return registerGlobal(API_NAME2, contextManager, DiagAPI.instance());
        };
        ContextAPI3.prototype.active = function() {
          return this._getContextManager().active();
        };
        ContextAPI3.prototype.with = function(context2, fn, thisArg) {
          var _a2;
          var args = [];
          for (var _i = 3; _i < arguments.length; _i++) {
            args[_i - 3] = arguments[_i];
          }
          return (_a2 = this._getContextManager()).with.apply(_a2, __spreadArray4([context2, fn, thisArg], __read5(args), false));
        };
        ContextAPI3.prototype.bind = function(context2, target) {
          return this._getContextManager().bind(context2, target);
        };
        ContextAPI3.prototype._getContextManager = function() {
          return getGlobal(API_NAME2) || NOOP_CONTEXT_MANAGER;
        };
        ContextAPI3.prototype.disable = function() {
          this._getContextManager().disable();
          unregisterGlobal(API_NAME2, DiagAPI.instance());
        };
        return ContextAPI3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/trace_flags.js
  var TraceFlags;
  var init_trace_flags = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/trace_flags.js"() {
      (function(TraceFlags3) {
        TraceFlags3[TraceFlags3["NONE"] = 0] = "NONE";
        TraceFlags3[TraceFlags3["SAMPLED"] = 1] = "SAMPLED";
      })(TraceFlags || (TraceFlags = {}));
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/invalid-span-constants.js
  var INVALID_SPANID, INVALID_TRACEID, INVALID_SPAN_CONTEXT;
  var init_invalid_span_constants = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/invalid-span-constants.js"() {
      init_trace_flags();
      INVALID_SPANID = "0000000000000000";
      INVALID_TRACEID = "00000000000000000000000000000000";
      INVALID_SPAN_CONTEXT = {
        traceId: INVALID_TRACEID,
        spanId: INVALID_SPANID,
        traceFlags: TraceFlags.NONE
      };
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/NonRecordingSpan.js
  var NonRecordingSpan;
  var init_NonRecordingSpan = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/NonRecordingSpan.js"() {
      init_invalid_span_constants();
      NonRecordingSpan = /** @class */
      function() {
        function NonRecordingSpan3(_spanContext) {
          if (_spanContext === void 0) {
            _spanContext = INVALID_SPAN_CONTEXT;
          }
          this._spanContext = _spanContext;
        }
        NonRecordingSpan3.prototype.spanContext = function() {
          return this._spanContext;
        };
        NonRecordingSpan3.prototype.setAttribute = function(_key, _value) {
          return this;
        };
        NonRecordingSpan3.prototype.setAttributes = function(_attributes) {
          return this;
        };
        NonRecordingSpan3.prototype.addEvent = function(_name, _attributes) {
          return this;
        };
        NonRecordingSpan3.prototype.addLink = function(_link) {
          return this;
        };
        NonRecordingSpan3.prototype.addLinks = function(_links) {
          return this;
        };
        NonRecordingSpan3.prototype.setStatus = function(_status) {
          return this;
        };
        NonRecordingSpan3.prototype.updateName = function(_name) {
          return this;
        };
        NonRecordingSpan3.prototype.end = function(_endTime) {
        };
        NonRecordingSpan3.prototype.isRecording = function() {
          return false;
        };
        NonRecordingSpan3.prototype.recordException = function(_exception, _time) {
        };
        return NonRecordingSpan3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/context-utils.js
  function getSpan(context2) {
    return context2.getValue(SPAN_KEY) || void 0;
  }
  function getActiveSpan() {
    return getSpan(ContextAPI.getInstance().active());
  }
  function setSpan(context2, span) {
    return context2.setValue(SPAN_KEY, span);
  }
  function deleteSpan(context2) {
    return context2.deleteValue(SPAN_KEY);
  }
  function setSpanContext(context2, spanContext) {
    return setSpan(context2, new NonRecordingSpan(spanContext));
  }
  function getSpanContext(context2) {
    var _a2;
    return (_a2 = getSpan(context2)) === null || _a2 === void 0 ? void 0 : _a2.spanContext();
  }
  var SPAN_KEY;
  var init_context_utils = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/context-utils.js"() {
      init_context();
      init_NonRecordingSpan();
      init_context2();
      SPAN_KEY = createContextKey("OpenTelemetry Context Key SPAN");
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/spancontext-utils.js
  function isValidTraceId(traceId) {
    return VALID_TRACEID_REGEX.test(traceId) && traceId !== INVALID_TRACEID;
  }
  function isValidSpanId(spanId) {
    return VALID_SPANID_REGEX.test(spanId) && spanId !== INVALID_SPANID;
  }
  function isSpanContextValid(spanContext) {
    return isValidTraceId(spanContext.traceId) && isValidSpanId(spanContext.spanId);
  }
  function wrapSpanContext(spanContext) {
    return new NonRecordingSpan(spanContext);
  }
  var VALID_TRACEID_REGEX, VALID_SPANID_REGEX;
  var init_spancontext_utils = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/spancontext-utils.js"() {
      init_invalid_span_constants();
      init_NonRecordingSpan();
      VALID_TRACEID_REGEX = /^([0-9a-f]{32})$/i;
      VALID_SPANID_REGEX = /^[0-9a-f]{16}$/i;
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/NoopTracer.js
  function isSpanContext(spanContext) {
    return typeof spanContext === "object" && typeof spanContext["spanId"] === "string" && typeof spanContext["traceId"] === "string" && typeof spanContext["traceFlags"] === "number";
  }
  var contextApi, NoopTracer;
  var init_NoopTracer = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/NoopTracer.js"() {
      init_context2();
      init_context_utils();
      init_NonRecordingSpan();
      init_spancontext_utils();
      contextApi = ContextAPI.getInstance();
      NoopTracer = /** @class */
      function() {
        function NoopTracer3() {
        }
        NoopTracer3.prototype.startSpan = function(name, options, context2) {
          if (context2 === void 0) {
            context2 = contextApi.active();
          }
          var root = Boolean(options === null || options === void 0 ? void 0 : options.root);
          if (root) {
            return new NonRecordingSpan();
          }
          var parentFromContext = context2 && getSpanContext(context2);
          if (isSpanContext(parentFromContext) && isSpanContextValid(parentFromContext)) {
            return new NonRecordingSpan(parentFromContext);
          } else {
            return new NonRecordingSpan();
          }
        };
        NoopTracer3.prototype.startActiveSpan = function(name, arg2, arg3, arg4) {
          var opts;
          var ctx;
          var fn;
          if (arguments.length < 2) {
            return;
          } else if (arguments.length === 2) {
            fn = arg2;
          } else if (arguments.length === 3) {
            opts = arg2;
            fn = arg3;
          } else {
            opts = arg2;
            ctx = arg3;
            fn = arg4;
          }
          var parentContext = ctx !== null && ctx !== void 0 ? ctx : contextApi.active();
          var span = this.startSpan(name, opts, parentContext);
          var contextWithSpanSet = setSpan(parentContext, span);
          return contextApi.with(contextWithSpanSet, fn, void 0, span);
        };
        return NoopTracer3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/ProxyTracer.js
  var NOOP_TRACER, ProxyTracer;
  var init_ProxyTracer = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/ProxyTracer.js"() {
      init_NoopTracer();
      NOOP_TRACER = new NoopTracer();
      ProxyTracer = /** @class */
      function() {
        function ProxyTracer3(_provider, name, version, options) {
          this._provider = _provider;
          this.name = name;
          this.version = version;
          this.options = options;
        }
        ProxyTracer3.prototype.startSpan = function(name, options, context2) {
          return this._getTracer().startSpan(name, options, context2);
        };
        ProxyTracer3.prototype.startActiveSpan = function(_name, _options, _context, _fn) {
          var tracer = this._getTracer();
          return Reflect.apply(tracer.startActiveSpan, tracer, arguments);
        };
        ProxyTracer3.prototype._getTracer = function() {
          if (this._delegate) {
            return this._delegate;
          }
          var tracer = this._provider.getDelegateTracer(this.name, this.version, this.options);
          if (!tracer) {
            return NOOP_TRACER;
          }
          this._delegate = tracer;
          return this._delegate;
        };
        return ProxyTracer3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/NoopTracerProvider.js
  var NoopTracerProvider;
  var init_NoopTracerProvider = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/NoopTracerProvider.js"() {
      init_NoopTracer();
      NoopTracerProvider = /** @class */
      function() {
        function NoopTracerProvider3() {
        }
        NoopTracerProvider3.prototype.getTracer = function(_name, _version, _options) {
          return new NoopTracer();
        };
        return NoopTracerProvider3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/ProxyTracerProvider.js
  var NOOP_TRACER_PROVIDER, ProxyTracerProvider;
  var init_ProxyTracerProvider = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/ProxyTracerProvider.js"() {
      init_ProxyTracer();
      init_NoopTracerProvider();
      NOOP_TRACER_PROVIDER = new NoopTracerProvider();
      ProxyTracerProvider = /** @class */
      function() {
        function ProxyTracerProvider3() {
        }
        ProxyTracerProvider3.prototype.getTracer = function(name, version, options) {
          var _a2;
          return (_a2 = this.getDelegateTracer(name, version, options)) !== null && _a2 !== void 0 ? _a2 : new ProxyTracer(this, name, version, options);
        };
        ProxyTracerProvider3.prototype.getDelegate = function() {
          var _a2;
          return (_a2 = this._delegate) !== null && _a2 !== void 0 ? _a2 : NOOP_TRACER_PROVIDER;
        };
        ProxyTracerProvider3.prototype.setDelegate = function(delegate) {
          this._delegate = delegate;
        };
        ProxyTracerProvider3.prototype.getDelegateTracer = function(name, version, options) {
          var _a2;
          return (_a2 = this._delegate) === null || _a2 === void 0 ? void 0 : _a2.getTracer(name, version, options);
        };
        return ProxyTracerProvider3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/SamplingResult.js
  var SamplingDecision;
  var init_SamplingResult = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/SamplingResult.js"() {
      (function(SamplingDecision3) {
        SamplingDecision3[SamplingDecision3["NOT_RECORD"] = 0] = "NOT_RECORD";
        SamplingDecision3[SamplingDecision3["RECORD"] = 1] = "RECORD";
        SamplingDecision3[SamplingDecision3["RECORD_AND_SAMPLED"] = 2] = "RECORD_AND_SAMPLED";
      })(SamplingDecision || (SamplingDecision = {}));
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/span_kind.js
  var SpanKind;
  var init_span_kind = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/span_kind.js"() {
      (function(SpanKind2) {
        SpanKind2[SpanKind2["INTERNAL"] = 0] = "INTERNAL";
        SpanKind2[SpanKind2["SERVER"] = 1] = "SERVER";
        SpanKind2[SpanKind2["CLIENT"] = 2] = "CLIENT";
        SpanKind2[SpanKind2["PRODUCER"] = 3] = "PRODUCER";
        SpanKind2[SpanKind2["CONSUMER"] = 4] = "CONSUMER";
      })(SpanKind || (SpanKind = {}));
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/status.js
  var SpanStatusCode;
  var init_status = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/status.js"() {
      (function(SpanStatusCode2) {
        SpanStatusCode2[SpanStatusCode2["UNSET"] = 0] = "UNSET";
        SpanStatusCode2[SpanStatusCode2["OK"] = 1] = "OK";
        SpanStatusCode2[SpanStatusCode2["ERROR"] = 2] = "ERROR";
      })(SpanStatusCode || (SpanStatusCode = {}));
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/internal/tracestate-validators.js
  function validateKey(key) {
    return VALID_KEY_REGEX.test(key);
  }
  function validateValue(value) {
    return VALID_VALUE_BASE_REGEX.test(value) && !INVALID_VALUE_COMMA_EQUAL_REGEX.test(value);
  }
  var VALID_KEY_CHAR_RANGE, VALID_KEY, VALID_VENDOR_KEY, VALID_KEY_REGEX, VALID_VALUE_BASE_REGEX, INVALID_VALUE_COMMA_EQUAL_REGEX;
  var init_tracestate_validators = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/internal/tracestate-validators.js"() {
      VALID_KEY_CHAR_RANGE = "[_0-9a-z-*/]";
      VALID_KEY = "[a-z]" + VALID_KEY_CHAR_RANGE + "{0,255}";
      VALID_VENDOR_KEY = "[a-z0-9]" + VALID_KEY_CHAR_RANGE + "{0,240}@[a-z]" + VALID_KEY_CHAR_RANGE + "{0,13}";
      VALID_KEY_REGEX = new RegExp("^(?:" + VALID_KEY + "|" + VALID_VENDOR_KEY + ")$");
      VALID_VALUE_BASE_REGEX = /^[ -~]{0,255}[!-~]$/;
      INVALID_VALUE_COMMA_EQUAL_REGEX = /,|=/;
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/internal/tracestate-impl.js
  var MAX_TRACE_STATE_ITEMS, MAX_TRACE_STATE_LEN, LIST_MEMBERS_SEPARATOR, LIST_MEMBER_KEY_VALUE_SPLITTER, TraceStateImpl;
  var init_tracestate_impl = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/internal/tracestate-impl.js"() {
      init_tracestate_validators();
      MAX_TRACE_STATE_ITEMS = 32;
      MAX_TRACE_STATE_LEN = 512;
      LIST_MEMBERS_SEPARATOR = ",";
      LIST_MEMBER_KEY_VALUE_SPLITTER = "=";
      TraceStateImpl = /** @class */
      function() {
        function TraceStateImpl2(rawTraceState) {
          this._internalState = /* @__PURE__ */ new Map();
          if (rawTraceState)
            this._parse(rawTraceState);
        }
        TraceStateImpl2.prototype.set = function(key, value) {
          var traceState = this._clone();
          if (traceState._internalState.has(key)) {
            traceState._internalState.delete(key);
          }
          traceState._internalState.set(key, value);
          return traceState;
        };
        TraceStateImpl2.prototype.unset = function(key) {
          var traceState = this._clone();
          traceState._internalState.delete(key);
          return traceState;
        };
        TraceStateImpl2.prototype.get = function(key) {
          return this._internalState.get(key);
        };
        TraceStateImpl2.prototype.serialize = function() {
          var _this = this;
          return this._keys().reduce(function(agg, key) {
            agg.push(key + LIST_MEMBER_KEY_VALUE_SPLITTER + _this.get(key));
            return agg;
          }, []).join(LIST_MEMBERS_SEPARATOR);
        };
        TraceStateImpl2.prototype._parse = function(rawTraceState) {
          if (rawTraceState.length > MAX_TRACE_STATE_LEN)
            return;
          this._internalState = rawTraceState.split(LIST_MEMBERS_SEPARATOR).reverse().reduce(function(agg, part) {
            var listMember = part.trim();
            var i = listMember.indexOf(LIST_MEMBER_KEY_VALUE_SPLITTER);
            if (i !== -1) {
              var key = listMember.slice(0, i);
              var value = listMember.slice(i + 1, part.length);
              if (validateKey(key) && validateValue(value)) {
                agg.set(key, value);
              } else {
              }
            }
            return agg;
          }, /* @__PURE__ */ new Map());
          if (this._internalState.size > MAX_TRACE_STATE_ITEMS) {
            this._internalState = new Map(Array.from(this._internalState.entries()).reverse().slice(0, MAX_TRACE_STATE_ITEMS));
          }
        };
        TraceStateImpl2.prototype._keys = function() {
          return Array.from(this._internalState.keys()).reverse();
        };
        TraceStateImpl2.prototype._clone = function() {
          var traceState = new TraceStateImpl2();
          traceState._internalState = new Map(this._internalState);
          return traceState;
        };
        return TraceStateImpl2;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace/internal/utils.js
  function createTraceState(rawTraceState) {
    return new TraceStateImpl(rawTraceState);
  }
  var init_utils2 = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace/internal/utils.js"() {
      init_tracestate_impl();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/context-api.js
  var context;
  var init_context_api = __esm({
    "node_modules/@opentelemetry/api/build/esm/context-api.js"() {
      init_context2();
      context = ContextAPI.getInstance();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/diag-api.js
  var diag2;
  var init_diag_api = __esm({
    "node_modules/@opentelemetry/api/build/esm/diag-api.js"() {
      init_diag();
      diag2 = DiagAPI.instance();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/metrics/NoopMeterProvider.js
  var NoopMeterProvider, NOOP_METER_PROVIDER;
  var init_NoopMeterProvider = __esm({
    "node_modules/@opentelemetry/api/build/esm/metrics/NoopMeterProvider.js"() {
      init_NoopMeter();
      NoopMeterProvider = /** @class */
      function() {
        function NoopMeterProvider2() {
        }
        NoopMeterProvider2.prototype.getMeter = function(_name, _version, _options) {
          return NOOP_METER;
        };
        return NoopMeterProvider2;
      }();
      NOOP_METER_PROVIDER = new NoopMeterProvider();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/api/metrics.js
  var API_NAME3, MetricsAPI;
  var init_metrics = __esm({
    "node_modules/@opentelemetry/api/build/esm/api/metrics.js"() {
      init_NoopMeterProvider();
      init_global_utils();
      init_diag();
      API_NAME3 = "metrics";
      MetricsAPI = /** @class */
      function() {
        function MetricsAPI2() {
        }
        MetricsAPI2.getInstance = function() {
          if (!this._instance) {
            this._instance = new MetricsAPI2();
          }
          return this._instance;
        };
        MetricsAPI2.prototype.setGlobalMeterProvider = function(provider) {
          return registerGlobal(API_NAME3, provider, DiagAPI.instance());
        };
        MetricsAPI2.prototype.getMeterProvider = function() {
          return getGlobal(API_NAME3) || NOOP_METER_PROVIDER;
        };
        MetricsAPI2.prototype.getMeter = function(name, version, options) {
          return this.getMeterProvider().getMeter(name, version, options);
        };
        MetricsAPI2.prototype.disable = function() {
          unregisterGlobal(API_NAME3, DiagAPI.instance());
        };
        return MetricsAPI2;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/metrics-api.js
  var metrics;
  var init_metrics_api = __esm({
    "node_modules/@opentelemetry/api/build/esm/metrics-api.js"() {
      init_metrics();
      metrics = MetricsAPI.getInstance();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/propagation/NoopTextMapPropagator.js
  var NoopTextMapPropagator;
  var init_NoopTextMapPropagator = __esm({
    "node_modules/@opentelemetry/api/build/esm/propagation/NoopTextMapPropagator.js"() {
      NoopTextMapPropagator = /** @class */
      function() {
        function NoopTextMapPropagator2() {
        }
        NoopTextMapPropagator2.prototype.inject = function(_context, _carrier) {
        };
        NoopTextMapPropagator2.prototype.extract = function(context2, _carrier) {
          return context2;
        };
        NoopTextMapPropagator2.prototype.fields = function() {
          return [];
        };
        return NoopTextMapPropagator2;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/baggage/context-helpers.js
  function getBaggage(context2) {
    return context2.getValue(BAGGAGE_KEY) || void 0;
  }
  function getActiveBaggage() {
    return getBaggage(ContextAPI.getInstance().active());
  }
  function setBaggage(context2, baggage) {
    return context2.setValue(BAGGAGE_KEY, baggage);
  }
  function deleteBaggage(context2) {
    return context2.deleteValue(BAGGAGE_KEY);
  }
  var BAGGAGE_KEY;
  var init_context_helpers = __esm({
    "node_modules/@opentelemetry/api/build/esm/baggage/context-helpers.js"() {
      init_context2();
      init_context();
      BAGGAGE_KEY = createContextKey("OpenTelemetry Baggage Key");
    }
  });

  // node_modules/@opentelemetry/api/build/esm/api/propagation.js
  var API_NAME4, NOOP_TEXT_MAP_PROPAGATOR, PropagationAPI;
  var init_propagation = __esm({
    "node_modules/@opentelemetry/api/build/esm/api/propagation.js"() {
      init_global_utils();
      init_NoopTextMapPropagator();
      init_TextMapPropagator();
      init_context_helpers();
      init_utils();
      init_diag();
      API_NAME4 = "propagation";
      NOOP_TEXT_MAP_PROPAGATOR = new NoopTextMapPropagator();
      PropagationAPI = /** @class */
      function() {
        function PropagationAPI2() {
          this.createBaggage = createBaggage;
          this.getBaggage = getBaggage;
          this.getActiveBaggage = getActiveBaggage;
          this.setBaggage = setBaggage;
          this.deleteBaggage = deleteBaggage;
        }
        PropagationAPI2.getInstance = function() {
          if (!this._instance) {
            this._instance = new PropagationAPI2();
          }
          return this._instance;
        };
        PropagationAPI2.prototype.setGlobalPropagator = function(propagator) {
          return registerGlobal(API_NAME4, propagator, DiagAPI.instance());
        };
        PropagationAPI2.prototype.inject = function(context2, carrier, setter) {
          if (setter === void 0) {
            setter = defaultTextMapSetter;
          }
          return this._getGlobalPropagator().inject(context2, carrier, setter);
        };
        PropagationAPI2.prototype.extract = function(context2, carrier, getter) {
          if (getter === void 0) {
            getter = defaultTextMapGetter;
          }
          return this._getGlobalPropagator().extract(context2, carrier, getter);
        };
        PropagationAPI2.prototype.fields = function() {
          return this._getGlobalPropagator().fields();
        };
        PropagationAPI2.prototype.disable = function() {
          unregisterGlobal(API_NAME4, DiagAPI.instance());
        };
        PropagationAPI2.prototype._getGlobalPropagator = function() {
          return getGlobal(API_NAME4) || NOOP_TEXT_MAP_PROPAGATOR;
        };
        return PropagationAPI2;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/propagation-api.js
  var propagation;
  var init_propagation_api = __esm({
    "node_modules/@opentelemetry/api/build/esm/propagation-api.js"() {
      init_propagation();
      propagation = PropagationAPI.getInstance();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/api/trace.js
  var API_NAME5, TraceAPI;
  var init_trace = __esm({
    "node_modules/@opentelemetry/api/build/esm/api/trace.js"() {
      init_global_utils();
      init_ProxyTracerProvider();
      init_spancontext_utils();
      init_context_utils();
      init_diag();
      API_NAME5 = "trace";
      TraceAPI = /** @class */
      function() {
        function TraceAPI3() {
          this._proxyTracerProvider = new ProxyTracerProvider();
          this.wrapSpanContext = wrapSpanContext;
          this.isSpanContextValid = isSpanContextValid;
          this.deleteSpan = deleteSpan;
          this.getSpan = getSpan;
          this.getActiveSpan = getActiveSpan;
          this.getSpanContext = getSpanContext;
          this.setSpan = setSpan;
          this.setSpanContext = setSpanContext;
        }
        TraceAPI3.getInstance = function() {
          if (!this._instance) {
            this._instance = new TraceAPI3();
          }
          return this._instance;
        };
        TraceAPI3.prototype.setGlobalTracerProvider = function(provider) {
          var success = registerGlobal(API_NAME5, this._proxyTracerProvider, DiagAPI.instance());
          if (success) {
            this._proxyTracerProvider.setDelegate(provider);
          }
          return success;
        };
        TraceAPI3.prototype.getTracerProvider = function() {
          return getGlobal(API_NAME5) || this._proxyTracerProvider;
        };
        TraceAPI3.prototype.getTracer = function(name, version) {
          return this.getTracerProvider().getTracer(name, version);
        };
        TraceAPI3.prototype.disable = function() {
          unregisterGlobal(API_NAME5, DiagAPI.instance());
          this._proxyTracerProvider = new ProxyTracerProvider();
        };
        return TraceAPI3;
      }();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/trace-api.js
  var trace;
  var init_trace_api = __esm({
    "node_modules/@opentelemetry/api/build/esm/trace-api.js"() {
      init_trace();
      trace = TraceAPI.getInstance();
    }
  });

  // node_modules/@opentelemetry/api/build/esm/index.js
  var esm_exports = {};
  __export(esm_exports, {
    DiagConsoleLogger: () => DiagConsoleLogger,
    DiagLogLevel: () => DiagLogLevel,
    INVALID_SPANID: () => INVALID_SPANID,
    INVALID_SPAN_CONTEXT: () => INVALID_SPAN_CONTEXT,
    INVALID_TRACEID: () => INVALID_TRACEID,
    ProxyTracer: () => ProxyTracer,
    ProxyTracerProvider: () => ProxyTracerProvider,
    ROOT_CONTEXT: () => ROOT_CONTEXT,
    SamplingDecision: () => SamplingDecision,
    SpanKind: () => SpanKind,
    SpanStatusCode: () => SpanStatusCode,
    TraceFlags: () => TraceFlags,
    ValueType: () => ValueType,
    baggageEntryMetadataFromString: () => baggageEntryMetadataFromString,
    context: () => context,
    createContextKey: () => createContextKey,
    createNoopMeter: () => createNoopMeter,
    createTraceState: () => createTraceState,
    default: () => esm_default,
    defaultTextMapGetter: () => defaultTextMapGetter,
    defaultTextMapSetter: () => defaultTextMapSetter,
    diag: () => diag2,
    isSpanContextValid: () => isSpanContextValid,
    isValidSpanId: () => isValidSpanId,
    isValidTraceId: () => isValidTraceId,
    metrics: () => metrics,
    propagation: () => propagation,
    trace: () => trace
  });
  var esm_default;
  var init_esm = __esm({
    "node_modules/@opentelemetry/api/build/esm/index.js"() {
      init_utils();
      init_context();
      init_consoleLogger();
      init_types();
      init_NoopMeter();
      init_Metric();
      init_TextMapPropagator();
      init_ProxyTracer();
      init_ProxyTracerProvider();
      init_SamplingResult();
      init_span_kind();
      init_status();
      init_trace_flags();
      init_utils2();
      init_spancontext_utils();
      init_invalid_span_constants();
      init_context_api();
      init_diag_api();
      init_metrics_api();
      init_propagation_api();
      init_trace_api();
      esm_default = {
        context,
        diag: diag2,
        metrics,
        propagation,
        trace
      };
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/suppress-tracing.js
  var require_suppress_tracing = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/suppress-tracing.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.isTracingSuppressed = exports.unsuppressTracing = exports.suppressTracing = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var SUPPRESS_TRACING_KEY = (0, api_1.createContextKey)("OpenTelemetry SDK Context Key SUPPRESS_TRACING");
      function suppressTracing2(context2) {
        return context2.setValue(SUPPRESS_TRACING_KEY, true);
      }
      exports.suppressTracing = suppressTracing2;
      function unsuppressTracing(context2) {
        return context2.deleteValue(SUPPRESS_TRACING_KEY);
      }
      exports.unsuppressTracing = unsuppressTracing;
      function isTracingSuppressed2(context2) {
        return context2.getValue(SUPPRESS_TRACING_KEY) === true;
      }
      exports.isTracingSuppressed = isTracingSuppressed2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/baggage/constants.js
  var require_constants = __commonJS({
    "node_modules/@opentelemetry/core/build/src/baggage/constants.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.BAGGAGE_MAX_TOTAL_LENGTH = exports.BAGGAGE_MAX_PER_NAME_VALUE_PAIRS = exports.BAGGAGE_MAX_NAME_VALUE_PAIRS = exports.BAGGAGE_HEADER = exports.BAGGAGE_ITEMS_SEPARATOR = exports.BAGGAGE_PROPERTIES_SEPARATOR = exports.BAGGAGE_KEY_PAIR_SEPARATOR = void 0;
      exports.BAGGAGE_KEY_PAIR_SEPARATOR = "=";
      exports.BAGGAGE_PROPERTIES_SEPARATOR = ";";
      exports.BAGGAGE_ITEMS_SEPARATOR = ",";
      exports.BAGGAGE_HEADER = "baggage";
      exports.BAGGAGE_MAX_NAME_VALUE_PAIRS = 180;
      exports.BAGGAGE_MAX_PER_NAME_VALUE_PAIRS = 4096;
      exports.BAGGAGE_MAX_TOTAL_LENGTH = 8192;
    }
  });

  // node_modules/@opentelemetry/core/build/src/baggage/utils.js
  var require_utils = __commonJS({
    "node_modules/@opentelemetry/core/build/src/baggage/utils.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.parseKeyPairsIntoRecord = exports.parsePairKeyValue = exports.getKeyPairs = exports.serializeKeyPairs = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var constants_1 = require_constants();
      function serializeKeyPairs(keyPairs) {
        return keyPairs.reduce((hValue, current) => {
          const value = `${hValue}${hValue !== "" ? constants_1.BAGGAGE_ITEMS_SEPARATOR : ""}${current}`;
          return value.length > constants_1.BAGGAGE_MAX_TOTAL_LENGTH ? hValue : value;
        }, "");
      }
      exports.serializeKeyPairs = serializeKeyPairs;
      function getKeyPairs(baggage) {
        return baggage.getAllEntries().map(([key, value]) => {
          let entry = `${encodeURIComponent(key)}=${encodeURIComponent(value.value)}`;
          if (value.metadata !== void 0) {
            entry += constants_1.BAGGAGE_PROPERTIES_SEPARATOR + value.metadata.toString();
          }
          return entry;
        });
      }
      exports.getKeyPairs = getKeyPairs;
      function parsePairKeyValue(entry) {
        const valueProps = entry.split(constants_1.BAGGAGE_PROPERTIES_SEPARATOR);
        if (valueProps.length <= 0)
          return;
        const keyPairPart = valueProps.shift();
        if (!keyPairPart)
          return;
        const separatorIndex = keyPairPart.indexOf(constants_1.BAGGAGE_KEY_PAIR_SEPARATOR);
        if (separatorIndex <= 0)
          return;
        const key = decodeURIComponent(keyPairPart.substring(0, separatorIndex).trim());
        const value = decodeURIComponent(keyPairPart.substring(separatorIndex + 1).trim());
        let metadata;
        if (valueProps.length > 0) {
          metadata = (0, api_1.baggageEntryMetadataFromString)(valueProps.join(constants_1.BAGGAGE_PROPERTIES_SEPARATOR));
        }
        return { key, value, metadata };
      }
      exports.parsePairKeyValue = parsePairKeyValue;
      function parseKeyPairsIntoRecord(value) {
        if (typeof value !== "string" || value.length === 0)
          return {};
        return value.split(constants_1.BAGGAGE_ITEMS_SEPARATOR).map((entry) => {
          return parsePairKeyValue(entry);
        }).filter((keyPair) => keyPair !== void 0 && keyPair.value.length > 0).reduce((headers, keyPair) => {
          headers[keyPair.key] = keyPair.value;
          return headers;
        }, {});
      }
      exports.parseKeyPairsIntoRecord = parseKeyPairsIntoRecord;
    }
  });

  // node_modules/@opentelemetry/core/build/src/baggage/propagation/W3CBaggagePropagator.js
  var require_W3CBaggagePropagator = __commonJS({
    "node_modules/@opentelemetry/core/build/src/baggage/propagation/W3CBaggagePropagator.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.W3CBaggagePropagator = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var suppress_tracing_1 = require_suppress_tracing();
      var constants_1 = require_constants();
      var utils_1 = require_utils();
      var W3CBaggagePropagator2 = class {
        inject(context2, carrier, setter) {
          const baggage = api_1.propagation.getBaggage(context2);
          if (!baggage || (0, suppress_tracing_1.isTracingSuppressed)(context2))
            return;
          const keyPairs = (0, utils_1.getKeyPairs)(baggage).filter((pair) => {
            return pair.length <= constants_1.BAGGAGE_MAX_PER_NAME_VALUE_PAIRS;
          }).slice(0, constants_1.BAGGAGE_MAX_NAME_VALUE_PAIRS);
          const headerValue = (0, utils_1.serializeKeyPairs)(keyPairs);
          if (headerValue.length > 0) {
            setter.set(carrier, constants_1.BAGGAGE_HEADER, headerValue);
          }
        }
        extract(context2, carrier, getter) {
          const headerValue = getter.get(carrier, constants_1.BAGGAGE_HEADER);
          const baggageString = Array.isArray(headerValue) ? headerValue.join(constants_1.BAGGAGE_ITEMS_SEPARATOR) : headerValue;
          if (!baggageString)
            return context2;
          const baggage = {};
          if (baggageString.length === 0) {
            return context2;
          }
          const pairs = baggageString.split(constants_1.BAGGAGE_ITEMS_SEPARATOR);
          pairs.forEach((entry) => {
            const keyPair = (0, utils_1.parsePairKeyValue)(entry);
            if (keyPair) {
              const baggageEntry = { value: keyPair.value };
              if (keyPair.metadata) {
                baggageEntry.metadata = keyPair.metadata;
              }
              baggage[keyPair.key] = baggageEntry;
            }
          });
          if (Object.entries(baggage).length === 0) {
            return context2;
          }
          return api_1.propagation.setBaggage(context2, api_1.propagation.createBaggage(baggage));
        }
        fields() {
          return [constants_1.BAGGAGE_HEADER];
        }
      };
      exports.W3CBaggagePropagator = W3CBaggagePropagator2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/common/anchored-clock.js
  var require_anchored_clock = __commonJS({
    "node_modules/@opentelemetry/core/build/src/common/anchored-clock.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.AnchoredClock = void 0;
      var AnchoredClock2 = class {
        /**
         * Create a new AnchoredClock anchored to the current time returned by systemClock.
         *
         * @param systemClock should be a clock that returns the number of milliseconds since January 1 1970 such as Date
         * @param monotonicClock should be a clock that counts milliseconds monotonically such as window.performance or perf_hooks.performance
         */
        constructor(systemClock, monotonicClock) {
          this._monotonicClock = monotonicClock;
          this._epochMillis = systemClock.now();
          this._performanceMillis = monotonicClock.now();
        }
        /**
         * Returns the current time by adding the number of milliseconds since the
         * AnchoredClock was created to the creation epoch time
         */
        now() {
          const delta = this._monotonicClock.now() - this._performanceMillis;
          return this._epochMillis + delta;
        }
      };
      exports.AnchoredClock = AnchoredClock2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/common/attributes.js
  var require_attributes = __commonJS({
    "node_modules/@opentelemetry/core/build/src/common/attributes.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.isAttributeValue = exports.isAttributeKey = exports.sanitizeAttributes = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      function sanitizeAttributes3(attributes) {
        const out = {};
        if (typeof attributes !== "object" || attributes == null) {
          return out;
        }
        for (const [key, val] of Object.entries(attributes)) {
          if (!isAttributeKey(key)) {
            api_1.diag.warn(`Invalid attribute key: ${key}`);
            continue;
          }
          if (!isAttributeValue2(val)) {
            api_1.diag.warn(`Invalid attribute value set for key: ${key}`);
            continue;
          }
          if (Array.isArray(val)) {
            out[key] = val.slice();
          } else {
            out[key] = val;
          }
        }
        return out;
      }
      exports.sanitizeAttributes = sanitizeAttributes3;
      function isAttributeKey(key) {
        return typeof key === "string" && key.length > 0;
      }
      exports.isAttributeKey = isAttributeKey;
      function isAttributeValue2(val) {
        if (val == null) {
          return true;
        }
        if (Array.isArray(val)) {
          return isHomogeneousAttributeValueArray(val);
        }
        return isValidPrimitiveAttributeValue(val);
      }
      exports.isAttributeValue = isAttributeValue2;
      function isHomogeneousAttributeValueArray(arr) {
        let type;
        for (const element of arr) {
          if (element == null)
            continue;
          if (!type) {
            if (isValidPrimitiveAttributeValue(element)) {
              type = typeof element;
              continue;
            }
            return false;
          }
          if (typeof element === type) {
            continue;
          }
          return false;
        }
        return true;
      }
      function isValidPrimitiveAttributeValue(val) {
        switch (typeof val) {
          case "number":
          case "boolean":
          case "string":
            return true;
        }
        return false;
      }
    }
  });

  // node_modules/@opentelemetry/core/build/src/common/logging-error-handler.js
  var require_logging_error_handler = __commonJS({
    "node_modules/@opentelemetry/core/build/src/common/logging-error-handler.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.loggingErrorHandler = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      function loggingErrorHandler() {
        return (ex) => {
          api_1.diag.error(stringifyException(ex));
        };
      }
      exports.loggingErrorHandler = loggingErrorHandler;
      function stringifyException(ex) {
        if (typeof ex === "string") {
          return ex;
        } else {
          return JSON.stringify(flattenException(ex));
        }
      }
      function flattenException(ex) {
        const result = {};
        let current = ex;
        while (current !== null) {
          Object.getOwnPropertyNames(current).forEach((propertyName) => {
            if (result[propertyName])
              return;
            const value = current[propertyName];
            if (value) {
              result[propertyName] = String(value);
            }
          });
          current = Object.getPrototypeOf(current);
        }
        return result;
      }
    }
  });

  // node_modules/@opentelemetry/core/build/src/common/global-error-handler.js
  var require_global_error_handler = __commonJS({
    "node_modules/@opentelemetry/core/build/src/common/global-error-handler.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.globalErrorHandler = exports.setGlobalErrorHandler = void 0;
      var logging_error_handler_1 = require_logging_error_handler();
      var delegateHandler = (0, logging_error_handler_1.loggingErrorHandler)();
      function setGlobalErrorHandler(handler) {
        delegateHandler = handler;
      }
      exports.setGlobalErrorHandler = setGlobalErrorHandler;
      function globalErrorHandler6(ex) {
        try {
          delegateHandler(ex);
        } catch (_a2) {
        }
      }
      exports.globalErrorHandler = globalErrorHandler6;
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/sampling.js
  var require_sampling = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/sampling.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.TracesSamplerValues = void 0;
      var TracesSamplerValues2;
      (function(TracesSamplerValues3) {
        TracesSamplerValues3["AlwaysOff"] = "always_off";
        TracesSamplerValues3["AlwaysOn"] = "always_on";
        TracesSamplerValues3["ParentBasedAlwaysOff"] = "parentbased_always_off";
        TracesSamplerValues3["ParentBasedAlwaysOn"] = "parentbased_always_on";
        TracesSamplerValues3["ParentBasedTraceIdRatio"] = "parentbased_traceidratio";
        TracesSamplerValues3["TraceIdRatio"] = "traceidratio";
      })(TracesSamplerValues2 = exports.TracesSamplerValues || (exports.TracesSamplerValues = {}));
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/environment.js
  var require_environment = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/environment.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.parseEnvironment = exports.DEFAULT_ENVIRONMENT = exports.DEFAULT_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT = exports.DEFAULT_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT = exports.DEFAULT_ATTRIBUTE_COUNT_LIMIT = exports.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var sampling_1 = require_sampling();
      var DEFAULT_LIST_SEPARATOR = ",";
      var ENVIRONMENT_BOOLEAN_KEYS = ["OTEL_SDK_DISABLED"];
      function isEnvVarABoolean(key) {
        return ENVIRONMENT_BOOLEAN_KEYS.indexOf(key) > -1;
      }
      var ENVIRONMENT_NUMBERS_KEYS = [
        "OTEL_BSP_EXPORT_TIMEOUT",
        "OTEL_BSP_MAX_EXPORT_BATCH_SIZE",
        "OTEL_BSP_MAX_QUEUE_SIZE",
        "OTEL_BSP_SCHEDULE_DELAY",
        "OTEL_BLRP_EXPORT_TIMEOUT",
        "OTEL_BLRP_MAX_EXPORT_BATCH_SIZE",
        "OTEL_BLRP_MAX_QUEUE_SIZE",
        "OTEL_BLRP_SCHEDULE_DELAY",
        "OTEL_ATTRIBUTE_VALUE_LENGTH_LIMIT",
        "OTEL_ATTRIBUTE_COUNT_LIMIT",
        "OTEL_SPAN_ATTRIBUTE_VALUE_LENGTH_LIMIT",
        "OTEL_SPAN_ATTRIBUTE_COUNT_LIMIT",
        "OTEL_LOGRECORD_ATTRIBUTE_VALUE_LENGTH_LIMIT",
        "OTEL_LOGRECORD_ATTRIBUTE_COUNT_LIMIT",
        "OTEL_SPAN_EVENT_COUNT_LIMIT",
        "OTEL_SPAN_LINK_COUNT_LIMIT",
        "OTEL_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT",
        "OTEL_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT",
        "OTEL_EXPORTER_OTLP_TIMEOUT",
        "OTEL_EXPORTER_OTLP_TRACES_TIMEOUT",
        "OTEL_EXPORTER_OTLP_METRICS_TIMEOUT",
        "OTEL_EXPORTER_OTLP_LOGS_TIMEOUT",
        "OTEL_EXPORTER_JAEGER_AGENT_PORT"
      ];
      function isEnvVarANumber(key) {
        return ENVIRONMENT_NUMBERS_KEYS.indexOf(key) > -1;
      }
      var ENVIRONMENT_LISTS_KEYS = [
        "OTEL_NO_PATCH_MODULES",
        "OTEL_PROPAGATORS"
      ];
      function isEnvVarAList(key) {
        return ENVIRONMENT_LISTS_KEYS.indexOf(key) > -1;
      }
      exports.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT = Infinity;
      exports.DEFAULT_ATTRIBUTE_COUNT_LIMIT = 128;
      exports.DEFAULT_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT = 128;
      exports.DEFAULT_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT = 128;
      exports.DEFAULT_ENVIRONMENT = {
        OTEL_SDK_DISABLED: false,
        CONTAINER_NAME: "",
        ECS_CONTAINER_METADATA_URI_V4: "",
        ECS_CONTAINER_METADATA_URI: "",
        HOSTNAME: "",
        KUBERNETES_SERVICE_HOST: "",
        NAMESPACE: "",
        OTEL_BSP_EXPORT_TIMEOUT: 3e4,
        OTEL_BSP_MAX_EXPORT_BATCH_SIZE: 512,
        OTEL_BSP_MAX_QUEUE_SIZE: 2048,
        OTEL_BSP_SCHEDULE_DELAY: 5e3,
        OTEL_BLRP_EXPORT_TIMEOUT: 3e4,
        OTEL_BLRP_MAX_EXPORT_BATCH_SIZE: 512,
        OTEL_BLRP_MAX_QUEUE_SIZE: 2048,
        OTEL_BLRP_SCHEDULE_DELAY: 5e3,
        OTEL_EXPORTER_JAEGER_AGENT_HOST: "",
        OTEL_EXPORTER_JAEGER_AGENT_PORT: 6832,
        OTEL_EXPORTER_JAEGER_ENDPOINT: "",
        OTEL_EXPORTER_JAEGER_PASSWORD: "",
        OTEL_EXPORTER_JAEGER_USER: "",
        OTEL_EXPORTER_OTLP_ENDPOINT: "",
        OTEL_EXPORTER_OTLP_TRACES_ENDPOINT: "",
        OTEL_EXPORTER_OTLP_METRICS_ENDPOINT: "",
        OTEL_EXPORTER_OTLP_LOGS_ENDPOINT: "",
        OTEL_EXPORTER_OTLP_HEADERS: "",
        OTEL_EXPORTER_OTLP_TRACES_HEADERS: "",
        OTEL_EXPORTER_OTLP_METRICS_HEADERS: "",
        OTEL_EXPORTER_OTLP_LOGS_HEADERS: "",
        OTEL_EXPORTER_OTLP_TIMEOUT: 1e4,
        OTEL_EXPORTER_OTLP_TRACES_TIMEOUT: 1e4,
        OTEL_EXPORTER_OTLP_METRICS_TIMEOUT: 1e4,
        OTEL_EXPORTER_OTLP_LOGS_TIMEOUT: 1e4,
        OTEL_EXPORTER_ZIPKIN_ENDPOINT: "http://localhost:9411/api/v2/spans",
        OTEL_LOG_LEVEL: api_1.DiagLogLevel.INFO,
        OTEL_NO_PATCH_MODULES: [],
        OTEL_PROPAGATORS: ["tracecontext", "baggage"],
        OTEL_RESOURCE_ATTRIBUTES: "",
        OTEL_SERVICE_NAME: "",
        OTEL_ATTRIBUTE_VALUE_LENGTH_LIMIT: exports.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT,
        OTEL_ATTRIBUTE_COUNT_LIMIT: exports.DEFAULT_ATTRIBUTE_COUNT_LIMIT,
        OTEL_SPAN_ATTRIBUTE_VALUE_LENGTH_LIMIT: exports.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT,
        OTEL_SPAN_ATTRIBUTE_COUNT_LIMIT: exports.DEFAULT_ATTRIBUTE_COUNT_LIMIT,
        OTEL_LOGRECORD_ATTRIBUTE_VALUE_LENGTH_LIMIT: exports.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT,
        OTEL_LOGRECORD_ATTRIBUTE_COUNT_LIMIT: exports.DEFAULT_ATTRIBUTE_COUNT_LIMIT,
        OTEL_SPAN_EVENT_COUNT_LIMIT: 128,
        OTEL_SPAN_LINK_COUNT_LIMIT: 128,
        OTEL_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT: exports.DEFAULT_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT,
        OTEL_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT: exports.DEFAULT_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT,
        OTEL_TRACES_EXPORTER: "",
        OTEL_TRACES_SAMPLER: sampling_1.TracesSamplerValues.ParentBasedAlwaysOn,
        OTEL_TRACES_SAMPLER_ARG: "",
        OTEL_LOGS_EXPORTER: "",
        OTEL_EXPORTER_OTLP_INSECURE: "",
        OTEL_EXPORTER_OTLP_TRACES_INSECURE: "",
        OTEL_EXPORTER_OTLP_METRICS_INSECURE: "",
        OTEL_EXPORTER_OTLP_LOGS_INSECURE: "",
        OTEL_EXPORTER_OTLP_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_TRACES_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_METRICS_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_LOGS_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_COMPRESSION: "",
        OTEL_EXPORTER_OTLP_TRACES_COMPRESSION: "",
        OTEL_EXPORTER_OTLP_METRICS_COMPRESSION: "",
        OTEL_EXPORTER_OTLP_LOGS_COMPRESSION: "",
        OTEL_EXPORTER_OTLP_CLIENT_KEY: "",
        OTEL_EXPORTER_OTLP_TRACES_CLIENT_KEY: "",
        OTEL_EXPORTER_OTLP_METRICS_CLIENT_KEY: "",
        OTEL_EXPORTER_OTLP_LOGS_CLIENT_KEY: "",
        OTEL_EXPORTER_OTLP_CLIENT_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_TRACES_CLIENT_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_METRICS_CLIENT_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_LOGS_CLIENT_CERTIFICATE: "",
        OTEL_EXPORTER_OTLP_PROTOCOL: "http/protobuf",
        OTEL_EXPORTER_OTLP_TRACES_PROTOCOL: "http/protobuf",
        OTEL_EXPORTER_OTLP_METRICS_PROTOCOL: "http/protobuf",
        OTEL_EXPORTER_OTLP_LOGS_PROTOCOL: "http/protobuf",
        OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE: "cumulative"
      };
      function parseBoolean(key, environment, values) {
        if (typeof values[key] === "undefined") {
          return;
        }
        const value = String(values[key]);
        environment[key] = value.toLowerCase() === "true";
      }
      function parseNumber(name, environment, values, min = -Infinity, max = Infinity) {
        if (typeof values[name] !== "undefined") {
          const value = Number(values[name]);
          if (!isNaN(value)) {
            if (value < min) {
              environment[name] = min;
            } else if (value > max) {
              environment[name] = max;
            } else {
              environment[name] = value;
            }
          }
        }
      }
      function parseStringList(name, output, input, separator = DEFAULT_LIST_SEPARATOR) {
        const givenValue = input[name];
        if (typeof givenValue === "string") {
          output[name] = givenValue.split(separator).map((v) => v.trim());
        }
      }
      var logLevelMap = {
        ALL: api_1.DiagLogLevel.ALL,
        VERBOSE: api_1.DiagLogLevel.VERBOSE,
        DEBUG: api_1.DiagLogLevel.DEBUG,
        INFO: api_1.DiagLogLevel.INFO,
        WARN: api_1.DiagLogLevel.WARN,
        ERROR: api_1.DiagLogLevel.ERROR,
        NONE: api_1.DiagLogLevel.NONE
      };
      function setLogLevelFromEnv(key, environment, values) {
        const value = values[key];
        if (typeof value === "string") {
          const theLevel = logLevelMap[value.toUpperCase()];
          if (theLevel != null) {
            environment[key] = theLevel;
          }
        }
      }
      function parseEnvironment(values) {
        const environment = {};
        for (const env2 in exports.DEFAULT_ENVIRONMENT) {
          const key = env2;
          switch (key) {
            case "OTEL_LOG_LEVEL":
              setLogLevelFromEnv(key, environment, values);
              break;
            default:
              if (isEnvVarABoolean(key)) {
                parseBoolean(key, environment, values);
              } else if (isEnvVarANumber(key)) {
                parseNumber(key, environment, values);
              } else if (isEnvVarAList(key)) {
                parseStringList(key, environment, values);
              } else {
                const value = values[key];
                if (typeof value !== "undefined" && value !== null) {
                  environment[key] = String(value);
                }
              }
          }
        }
        return environment;
      }
      exports.parseEnvironment = parseEnvironment;
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/globalThis.js
  var require_globalThis = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/globalThis.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports._globalThis = void 0;
      exports._globalThis = typeof globalThis === "object" ? globalThis : typeof self === "object" ? self : typeof window === "object" ? window : typeof global === "object" ? global : {};
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/environment.js
  var require_environment2 = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/environment.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.getEnvWithoutDefaults = exports.getEnv = void 0;
      var environment_1 = require_environment();
      var globalThis_1 = require_globalThis();
      function getEnv4() {
        const globalEnv = (0, environment_1.parseEnvironment)(globalThis_1._globalThis);
        return Object.assign({}, environment_1.DEFAULT_ENVIRONMENT, globalEnv);
      }
      exports.getEnv = getEnv4;
      function getEnvWithoutDefaults2() {
        return (0, environment_1.parseEnvironment)(globalThis_1._globalThis);
      }
      exports.getEnvWithoutDefaults = getEnvWithoutDefaults2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/common/hex-to-binary.js
  var require_hex_to_binary = __commonJS({
    "node_modules/@opentelemetry/core/build/src/common/hex-to-binary.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.hexToBinary = void 0;
      function intValue(charCode) {
        if (charCode >= 48 && charCode <= 57) {
          return charCode - 48;
        }
        if (charCode >= 97 && charCode <= 102) {
          return charCode - 87;
        }
        return charCode - 55;
      }
      function hexToBinary(hexStr) {
        const buf = new Uint8Array(hexStr.length / 2);
        let offset = 0;
        for (let i = 0; i < hexStr.length; i += 2) {
          const hi = intValue(hexStr.charCodeAt(i));
          const lo = intValue(hexStr.charCodeAt(i + 1));
          buf[offset++] = hi << 4 | lo;
        }
        return buf;
      }
      exports.hexToBinary = hexToBinary;
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/hex-to-base64.js
  var require_hex_to_base64 = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/hex-to-base64.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.hexToBase64 = void 0;
      var hex_to_binary_1 = require_hex_to_binary();
      function hexToBase64(hexStr) {
        return btoa(String.fromCharCode(...(0, hex_to_binary_1.hexToBinary)(hexStr)));
      }
      exports.hexToBase64 = hexToBase64;
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/RandomIdGenerator.js
  var require_RandomIdGenerator = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/RandomIdGenerator.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.RandomIdGenerator = void 0;
      var SPAN_ID_BYTES3 = 8;
      var TRACE_ID_BYTES3 = 16;
      var RandomIdGenerator3 = class {
        constructor() {
          this.generateTraceId = getIdGenerator3(TRACE_ID_BYTES3);
          this.generateSpanId = getIdGenerator3(SPAN_ID_BYTES3);
        }
      };
      exports.RandomIdGenerator = RandomIdGenerator3;
      var SHARED_CHAR_CODES_ARRAY3 = Array(32);
      function getIdGenerator3(bytes) {
        return function generateId() {
          for (let i = 0; i < bytes * 2; i++) {
            SHARED_CHAR_CODES_ARRAY3[i] = Math.floor(Math.random() * 16) + 48;
            if (SHARED_CHAR_CODES_ARRAY3[i] >= 58) {
              SHARED_CHAR_CODES_ARRAY3[i] += 39;
            }
          }
          return String.fromCharCode.apply(null, SHARED_CHAR_CODES_ARRAY3.slice(0, bytes * 2));
        };
      }
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/performance.js
  var require_performance = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/performance.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.otperformance = void 0;
      exports.otperformance = performance;
    }
  });

  // node_modules/@opentelemetry/core/build/src/version.js
  var require_version = __commonJS({
    "node_modules/@opentelemetry/core/build/src/version.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.VERSION = void 0;
      exports.VERSION = "1.26.0";
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/internal/utils.js
  // @__NO_SIDE_EFFECTS__
  function createConstMap(values) {
    var res = {};
    var len = values.length;
    for (var lp = 0; lp < len; lp++) {
      var val = values[lp];
      if (val) {
        res[String(val).toUpperCase().replace(/[-.]/g, "_")] = val;
      }
    }
    return res;
  }
  var init_utils3 = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/internal/utils.js"() {
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/trace/SemanticAttributes.js
  var TMP_AWS_LAMBDA_INVOKED_ARN, TMP_DB_SYSTEM, TMP_DB_CONNECTION_STRING, TMP_DB_USER, TMP_DB_JDBC_DRIVER_CLASSNAME, TMP_DB_NAME, TMP_DB_STATEMENT, TMP_DB_OPERATION, TMP_DB_MSSQL_INSTANCE_NAME, TMP_DB_CASSANDRA_KEYSPACE, TMP_DB_CASSANDRA_PAGE_SIZE, TMP_DB_CASSANDRA_CONSISTENCY_LEVEL, TMP_DB_CASSANDRA_TABLE, TMP_DB_CASSANDRA_IDEMPOTENCE, TMP_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT, TMP_DB_CASSANDRA_COORDINATOR_ID, TMP_DB_CASSANDRA_COORDINATOR_DC, TMP_DB_HBASE_NAMESPACE, TMP_DB_REDIS_DATABASE_INDEX, TMP_DB_MONGODB_COLLECTION, TMP_DB_SQL_TABLE, TMP_EXCEPTION_TYPE, TMP_EXCEPTION_MESSAGE, TMP_EXCEPTION_STACKTRACE, TMP_EXCEPTION_ESCAPED, TMP_FAAS_TRIGGER, TMP_FAAS_EXECUTION, TMP_FAAS_DOCUMENT_COLLECTION, TMP_FAAS_DOCUMENT_OPERATION, TMP_FAAS_DOCUMENT_TIME, TMP_FAAS_DOCUMENT_NAME, TMP_FAAS_TIME, TMP_FAAS_CRON, TMP_FAAS_COLDSTART, TMP_FAAS_INVOKED_NAME, TMP_FAAS_INVOKED_PROVIDER, TMP_FAAS_INVOKED_REGION, TMP_NET_TRANSPORT, TMP_NET_PEER_IP, TMP_NET_PEER_PORT, TMP_NET_PEER_NAME, TMP_NET_HOST_IP, TMP_NET_HOST_PORT, TMP_NET_HOST_NAME, TMP_NET_HOST_CONNECTION_TYPE, TMP_NET_HOST_CONNECTION_SUBTYPE, TMP_NET_HOST_CARRIER_NAME, TMP_NET_HOST_CARRIER_MCC, TMP_NET_HOST_CARRIER_MNC, TMP_NET_HOST_CARRIER_ICC, TMP_PEER_SERVICE, TMP_ENDUSER_ID, TMP_ENDUSER_ROLE, TMP_ENDUSER_SCOPE, TMP_THREAD_ID, TMP_THREAD_NAME, TMP_CODE_FUNCTION, TMP_CODE_NAMESPACE, TMP_CODE_FILEPATH, TMP_CODE_LINENO, TMP_HTTP_METHOD, TMP_HTTP_URL, TMP_HTTP_TARGET, TMP_HTTP_HOST, TMP_HTTP_SCHEME, TMP_HTTP_STATUS_CODE, TMP_HTTP_FLAVOR, TMP_HTTP_USER_AGENT, TMP_HTTP_REQUEST_CONTENT_LENGTH, TMP_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED, TMP_HTTP_RESPONSE_CONTENT_LENGTH, TMP_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED, TMP_HTTP_SERVER_NAME, TMP_HTTP_ROUTE, TMP_HTTP_CLIENT_IP, TMP_AWS_DYNAMODB_TABLE_NAMES, TMP_AWS_DYNAMODB_CONSUMED_CAPACITY, TMP_AWS_DYNAMODB_ITEM_COLLECTION_METRICS, TMP_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY, TMP_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY, TMP_AWS_DYNAMODB_CONSISTENT_READ, TMP_AWS_DYNAMODB_PROJECTION, TMP_AWS_DYNAMODB_LIMIT, TMP_AWS_DYNAMODB_ATTRIBUTES_TO_GET, TMP_AWS_DYNAMODB_INDEX_NAME, TMP_AWS_DYNAMODB_SELECT, TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES, TMP_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES, TMP_AWS_DYNAMODB_EXCLUSIVE_START_TABLE, TMP_AWS_DYNAMODB_TABLE_COUNT, TMP_AWS_DYNAMODB_SCAN_FORWARD, TMP_AWS_DYNAMODB_SEGMENT, TMP_AWS_DYNAMODB_TOTAL_SEGMENTS, TMP_AWS_DYNAMODB_COUNT, TMP_AWS_DYNAMODB_SCANNED_COUNT, TMP_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS, TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES, TMP_MESSAGING_SYSTEM, TMP_MESSAGING_DESTINATION, TMP_MESSAGING_DESTINATION_KIND, TMP_MESSAGING_TEMP_DESTINATION, TMP_MESSAGING_PROTOCOL, TMP_MESSAGING_PROTOCOL_VERSION, TMP_MESSAGING_URL, TMP_MESSAGING_MESSAGE_ID, TMP_MESSAGING_CONVERSATION_ID, TMP_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES, TMP_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES, TMP_MESSAGING_OPERATION, TMP_MESSAGING_CONSUMER_ID, TMP_MESSAGING_RABBITMQ_ROUTING_KEY, TMP_MESSAGING_KAFKA_MESSAGE_KEY, TMP_MESSAGING_KAFKA_CONSUMER_GROUP, TMP_MESSAGING_KAFKA_CLIENT_ID, TMP_MESSAGING_KAFKA_PARTITION, TMP_MESSAGING_KAFKA_TOMBSTONE, TMP_RPC_SYSTEM, TMP_RPC_SERVICE, TMP_RPC_METHOD, TMP_RPC_GRPC_STATUS_CODE, TMP_RPC_JSONRPC_VERSION, TMP_RPC_JSONRPC_REQUEST_ID, TMP_RPC_JSONRPC_ERROR_CODE, TMP_RPC_JSONRPC_ERROR_MESSAGE, TMP_MESSAGE_TYPE, TMP_MESSAGE_ID, TMP_MESSAGE_COMPRESSED_SIZE, TMP_MESSAGE_UNCOMPRESSED_SIZE, SEMATTRS_AWS_LAMBDA_INVOKED_ARN, SEMATTRS_DB_SYSTEM, SEMATTRS_DB_CONNECTION_STRING, SEMATTRS_DB_USER, SEMATTRS_DB_JDBC_DRIVER_CLASSNAME, SEMATTRS_DB_NAME, SEMATTRS_DB_STATEMENT, SEMATTRS_DB_OPERATION, SEMATTRS_DB_MSSQL_INSTANCE_NAME, SEMATTRS_DB_CASSANDRA_KEYSPACE, SEMATTRS_DB_CASSANDRA_PAGE_SIZE, SEMATTRS_DB_CASSANDRA_CONSISTENCY_LEVEL, SEMATTRS_DB_CASSANDRA_TABLE, SEMATTRS_DB_CASSANDRA_IDEMPOTENCE, SEMATTRS_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT, SEMATTRS_DB_CASSANDRA_COORDINATOR_ID, SEMATTRS_DB_CASSANDRA_COORDINATOR_DC, SEMATTRS_DB_HBASE_NAMESPACE, SEMATTRS_DB_REDIS_DATABASE_INDEX, SEMATTRS_DB_MONGODB_COLLECTION, SEMATTRS_DB_SQL_TABLE, SEMATTRS_EXCEPTION_TYPE, SEMATTRS_EXCEPTION_MESSAGE, SEMATTRS_EXCEPTION_STACKTRACE, SEMATTRS_EXCEPTION_ESCAPED, SEMATTRS_FAAS_TRIGGER, SEMATTRS_FAAS_EXECUTION, SEMATTRS_FAAS_DOCUMENT_COLLECTION, SEMATTRS_FAAS_DOCUMENT_OPERATION, SEMATTRS_FAAS_DOCUMENT_TIME, SEMATTRS_FAAS_DOCUMENT_NAME, SEMATTRS_FAAS_TIME, SEMATTRS_FAAS_CRON, SEMATTRS_FAAS_COLDSTART, SEMATTRS_FAAS_INVOKED_NAME, SEMATTRS_FAAS_INVOKED_PROVIDER, SEMATTRS_FAAS_INVOKED_REGION, SEMATTRS_NET_TRANSPORT, SEMATTRS_NET_PEER_IP, SEMATTRS_NET_PEER_PORT, SEMATTRS_NET_PEER_NAME, SEMATTRS_NET_HOST_IP, SEMATTRS_NET_HOST_PORT, SEMATTRS_NET_HOST_NAME, SEMATTRS_NET_HOST_CONNECTION_TYPE, SEMATTRS_NET_HOST_CONNECTION_SUBTYPE, SEMATTRS_NET_HOST_CARRIER_NAME, SEMATTRS_NET_HOST_CARRIER_MCC, SEMATTRS_NET_HOST_CARRIER_MNC, SEMATTRS_NET_HOST_CARRIER_ICC, SEMATTRS_PEER_SERVICE, SEMATTRS_ENDUSER_ID, SEMATTRS_ENDUSER_ROLE, SEMATTRS_ENDUSER_SCOPE, SEMATTRS_THREAD_ID, SEMATTRS_THREAD_NAME, SEMATTRS_CODE_FUNCTION, SEMATTRS_CODE_NAMESPACE, SEMATTRS_CODE_FILEPATH, SEMATTRS_CODE_LINENO, SEMATTRS_HTTP_METHOD, SEMATTRS_HTTP_URL, SEMATTRS_HTTP_TARGET, SEMATTRS_HTTP_HOST, SEMATTRS_HTTP_SCHEME, SEMATTRS_HTTP_STATUS_CODE, SEMATTRS_HTTP_FLAVOR, SEMATTRS_HTTP_USER_AGENT, SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH, SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED, SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH, SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED, SEMATTRS_HTTP_SERVER_NAME, SEMATTRS_HTTP_ROUTE, SEMATTRS_HTTP_CLIENT_IP, SEMATTRS_AWS_DYNAMODB_TABLE_NAMES, SEMATTRS_AWS_DYNAMODB_CONSUMED_CAPACITY, SEMATTRS_AWS_DYNAMODB_ITEM_COLLECTION_METRICS, SEMATTRS_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY, SEMATTRS_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY, SEMATTRS_AWS_DYNAMODB_CONSISTENT_READ, SEMATTRS_AWS_DYNAMODB_PROJECTION, SEMATTRS_AWS_DYNAMODB_LIMIT, SEMATTRS_AWS_DYNAMODB_ATTRIBUTES_TO_GET, SEMATTRS_AWS_DYNAMODB_INDEX_NAME, SEMATTRS_AWS_DYNAMODB_SELECT, SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES, SEMATTRS_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES, SEMATTRS_AWS_DYNAMODB_EXCLUSIVE_START_TABLE, SEMATTRS_AWS_DYNAMODB_TABLE_COUNT, SEMATTRS_AWS_DYNAMODB_SCAN_FORWARD, SEMATTRS_AWS_DYNAMODB_SEGMENT, SEMATTRS_AWS_DYNAMODB_TOTAL_SEGMENTS, SEMATTRS_AWS_DYNAMODB_COUNT, SEMATTRS_AWS_DYNAMODB_SCANNED_COUNT, SEMATTRS_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS, SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES, SEMATTRS_MESSAGING_SYSTEM, SEMATTRS_MESSAGING_DESTINATION, SEMATTRS_MESSAGING_DESTINATION_KIND, SEMATTRS_MESSAGING_TEMP_DESTINATION, SEMATTRS_MESSAGING_PROTOCOL, SEMATTRS_MESSAGING_PROTOCOL_VERSION, SEMATTRS_MESSAGING_URL, SEMATTRS_MESSAGING_MESSAGE_ID, SEMATTRS_MESSAGING_CONVERSATION_ID, SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES, SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES, SEMATTRS_MESSAGING_OPERATION, SEMATTRS_MESSAGING_CONSUMER_ID, SEMATTRS_MESSAGING_RABBITMQ_ROUTING_KEY, SEMATTRS_MESSAGING_KAFKA_MESSAGE_KEY, SEMATTRS_MESSAGING_KAFKA_CONSUMER_GROUP, SEMATTRS_MESSAGING_KAFKA_CLIENT_ID, SEMATTRS_MESSAGING_KAFKA_PARTITION, SEMATTRS_MESSAGING_KAFKA_TOMBSTONE, SEMATTRS_RPC_SYSTEM, SEMATTRS_RPC_SERVICE, SEMATTRS_RPC_METHOD, SEMATTRS_RPC_GRPC_STATUS_CODE, SEMATTRS_RPC_JSONRPC_VERSION, SEMATTRS_RPC_JSONRPC_REQUEST_ID, SEMATTRS_RPC_JSONRPC_ERROR_CODE, SEMATTRS_RPC_JSONRPC_ERROR_MESSAGE, SEMATTRS_MESSAGE_TYPE, SEMATTRS_MESSAGE_ID, SEMATTRS_MESSAGE_COMPRESSED_SIZE, SEMATTRS_MESSAGE_UNCOMPRESSED_SIZE, SemanticAttributes, TMP_DBSYSTEMVALUES_OTHER_SQL, TMP_DBSYSTEMVALUES_MSSQL, TMP_DBSYSTEMVALUES_MYSQL, TMP_DBSYSTEMVALUES_ORACLE, TMP_DBSYSTEMVALUES_DB2, TMP_DBSYSTEMVALUES_POSTGRESQL, TMP_DBSYSTEMVALUES_REDSHIFT, TMP_DBSYSTEMVALUES_HIVE, TMP_DBSYSTEMVALUES_CLOUDSCAPE, TMP_DBSYSTEMVALUES_HSQLDB, TMP_DBSYSTEMVALUES_PROGRESS, TMP_DBSYSTEMVALUES_MAXDB, TMP_DBSYSTEMVALUES_HANADB, TMP_DBSYSTEMVALUES_INGRES, TMP_DBSYSTEMVALUES_FIRSTSQL, TMP_DBSYSTEMVALUES_EDB, TMP_DBSYSTEMVALUES_CACHE, TMP_DBSYSTEMVALUES_ADABAS, TMP_DBSYSTEMVALUES_FIREBIRD, TMP_DBSYSTEMVALUES_DERBY, TMP_DBSYSTEMVALUES_FILEMAKER, TMP_DBSYSTEMVALUES_INFORMIX, TMP_DBSYSTEMVALUES_INSTANTDB, TMP_DBSYSTEMVALUES_INTERBASE, TMP_DBSYSTEMVALUES_MARIADB, TMP_DBSYSTEMVALUES_NETEZZA, TMP_DBSYSTEMVALUES_PERVASIVE, TMP_DBSYSTEMVALUES_POINTBASE, TMP_DBSYSTEMVALUES_SQLITE, TMP_DBSYSTEMVALUES_SYBASE, TMP_DBSYSTEMVALUES_TERADATA, TMP_DBSYSTEMVALUES_VERTICA, TMP_DBSYSTEMVALUES_H2, TMP_DBSYSTEMVALUES_COLDFUSION, TMP_DBSYSTEMVALUES_CASSANDRA, TMP_DBSYSTEMVALUES_HBASE, TMP_DBSYSTEMVALUES_MONGODB, TMP_DBSYSTEMVALUES_REDIS, TMP_DBSYSTEMVALUES_COUCHBASE, TMP_DBSYSTEMVALUES_COUCHDB, TMP_DBSYSTEMVALUES_COSMOSDB, TMP_DBSYSTEMVALUES_DYNAMODB, TMP_DBSYSTEMVALUES_NEO4J, TMP_DBSYSTEMVALUES_GEODE, TMP_DBSYSTEMVALUES_ELASTICSEARCH, TMP_DBSYSTEMVALUES_MEMCACHED, TMP_DBSYSTEMVALUES_COCKROACHDB, DBSYSTEMVALUES_OTHER_SQL, DBSYSTEMVALUES_MSSQL, DBSYSTEMVALUES_MYSQL, DBSYSTEMVALUES_ORACLE, DBSYSTEMVALUES_DB2, DBSYSTEMVALUES_POSTGRESQL, DBSYSTEMVALUES_REDSHIFT, DBSYSTEMVALUES_HIVE, DBSYSTEMVALUES_CLOUDSCAPE, DBSYSTEMVALUES_HSQLDB, DBSYSTEMVALUES_PROGRESS, DBSYSTEMVALUES_MAXDB, DBSYSTEMVALUES_HANADB, DBSYSTEMVALUES_INGRES, DBSYSTEMVALUES_FIRSTSQL, DBSYSTEMVALUES_EDB, DBSYSTEMVALUES_CACHE, DBSYSTEMVALUES_ADABAS, DBSYSTEMVALUES_FIREBIRD, DBSYSTEMVALUES_DERBY, DBSYSTEMVALUES_FILEMAKER, DBSYSTEMVALUES_INFORMIX, DBSYSTEMVALUES_INSTANTDB, DBSYSTEMVALUES_INTERBASE, DBSYSTEMVALUES_MARIADB, DBSYSTEMVALUES_NETEZZA, DBSYSTEMVALUES_PERVASIVE, DBSYSTEMVALUES_POINTBASE, DBSYSTEMVALUES_SQLITE, DBSYSTEMVALUES_SYBASE, DBSYSTEMVALUES_TERADATA, DBSYSTEMVALUES_VERTICA, DBSYSTEMVALUES_H2, DBSYSTEMVALUES_COLDFUSION, DBSYSTEMVALUES_CASSANDRA, DBSYSTEMVALUES_HBASE, DBSYSTEMVALUES_MONGODB, DBSYSTEMVALUES_REDIS, DBSYSTEMVALUES_COUCHBASE, DBSYSTEMVALUES_COUCHDB, DBSYSTEMVALUES_COSMOSDB, DBSYSTEMVALUES_DYNAMODB, DBSYSTEMVALUES_NEO4J, DBSYSTEMVALUES_GEODE, DBSYSTEMVALUES_ELASTICSEARCH, DBSYSTEMVALUES_MEMCACHED, DBSYSTEMVALUES_COCKROACHDB, DbSystemValues, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ALL, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ONE, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_TWO, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_THREE, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ANY, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL, TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL, DBCASSANDRACONSISTENCYLEVELVALUES_ALL, DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM, DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM, DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM, DBCASSANDRACONSISTENCYLEVELVALUES_ONE, DBCASSANDRACONSISTENCYLEVELVALUES_TWO, DBCASSANDRACONSISTENCYLEVELVALUES_THREE, DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE, DBCASSANDRACONSISTENCYLEVELVALUES_ANY, DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL, DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL, DbCassandraConsistencyLevelValues, TMP_FAASTRIGGERVALUES_DATASOURCE, TMP_FAASTRIGGERVALUES_HTTP, TMP_FAASTRIGGERVALUES_PUBSUB, TMP_FAASTRIGGERVALUES_TIMER, TMP_FAASTRIGGERVALUES_OTHER, FAASTRIGGERVALUES_DATASOURCE, FAASTRIGGERVALUES_HTTP, FAASTRIGGERVALUES_PUBSUB, FAASTRIGGERVALUES_TIMER, FAASTRIGGERVALUES_OTHER, FaasTriggerValues, TMP_FAASDOCUMENTOPERATIONVALUES_INSERT, TMP_FAASDOCUMENTOPERATIONVALUES_EDIT, TMP_FAASDOCUMENTOPERATIONVALUES_DELETE, FAASDOCUMENTOPERATIONVALUES_INSERT, FAASDOCUMENTOPERATIONVALUES_EDIT, FAASDOCUMENTOPERATIONVALUES_DELETE, FaasDocumentOperationValues, TMP_FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD, TMP_FAASINVOKEDPROVIDERVALUES_AWS, TMP_FAASINVOKEDPROVIDERVALUES_AZURE, TMP_FAASINVOKEDPROVIDERVALUES_GCP, FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD, FAASINVOKEDPROVIDERVALUES_AWS, FAASINVOKEDPROVIDERVALUES_AZURE, FAASINVOKEDPROVIDERVALUES_GCP, FaasInvokedProviderValues, TMP_NETTRANSPORTVALUES_IP_TCP, TMP_NETTRANSPORTVALUES_IP_UDP, TMP_NETTRANSPORTVALUES_IP, TMP_NETTRANSPORTVALUES_UNIX, TMP_NETTRANSPORTVALUES_PIPE, TMP_NETTRANSPORTVALUES_INPROC, TMP_NETTRANSPORTVALUES_OTHER, NETTRANSPORTVALUES_IP_TCP, NETTRANSPORTVALUES_IP_UDP, NETTRANSPORTVALUES_IP, NETTRANSPORTVALUES_UNIX, NETTRANSPORTVALUES_PIPE, NETTRANSPORTVALUES_INPROC, NETTRANSPORTVALUES_OTHER, NetTransportValues, TMP_NETHOSTCONNECTIONTYPEVALUES_WIFI, TMP_NETHOSTCONNECTIONTYPEVALUES_WIRED, TMP_NETHOSTCONNECTIONTYPEVALUES_CELL, TMP_NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE, TMP_NETHOSTCONNECTIONTYPEVALUES_UNKNOWN, NETHOSTCONNECTIONTYPEVALUES_WIFI, NETHOSTCONNECTIONTYPEVALUES_WIRED, NETHOSTCONNECTIONTYPEVALUES_CELL, NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE, NETHOSTCONNECTIONTYPEVALUES_UNKNOWN, NetHostConnectionTypeValues, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GPRS, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EDGE, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_UMTS, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPA, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IDEN, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GSM, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NR, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA, TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA, NETHOSTCONNECTIONSUBTYPEVALUES_GPRS, NETHOSTCONNECTIONSUBTYPEVALUES_EDGE, NETHOSTCONNECTIONSUBTYPEVALUES_UMTS, NETHOSTCONNECTIONSUBTYPEVALUES_CDMA, NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0, NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A, NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT, NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA, NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA, NETHOSTCONNECTIONSUBTYPEVALUES_HSPA, NETHOSTCONNECTIONSUBTYPEVALUES_IDEN, NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B, NETHOSTCONNECTIONSUBTYPEVALUES_LTE, NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD, NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP, NETHOSTCONNECTIONSUBTYPEVALUES_GSM, NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA, NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN, NETHOSTCONNECTIONSUBTYPEVALUES_NR, NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA, NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA, NetHostConnectionSubtypeValues, TMP_HTTPFLAVORVALUES_HTTP_1_0, TMP_HTTPFLAVORVALUES_HTTP_1_1, TMP_HTTPFLAVORVALUES_HTTP_2_0, TMP_HTTPFLAVORVALUES_SPDY, TMP_HTTPFLAVORVALUES_QUIC, HTTPFLAVORVALUES_HTTP_1_0, HTTPFLAVORVALUES_HTTP_1_1, HTTPFLAVORVALUES_HTTP_2_0, HTTPFLAVORVALUES_SPDY, HTTPFLAVORVALUES_QUIC, HttpFlavorValues, TMP_MESSAGINGDESTINATIONKINDVALUES_QUEUE, TMP_MESSAGINGDESTINATIONKINDVALUES_TOPIC, MESSAGINGDESTINATIONKINDVALUES_QUEUE, MESSAGINGDESTINATIONKINDVALUES_TOPIC, MessagingDestinationKindValues, TMP_MESSAGINGOPERATIONVALUES_RECEIVE, TMP_MESSAGINGOPERATIONVALUES_PROCESS, MESSAGINGOPERATIONVALUES_RECEIVE, MESSAGINGOPERATIONVALUES_PROCESS, MessagingOperationValues, TMP_RPCGRPCSTATUSCODEVALUES_OK, TMP_RPCGRPCSTATUSCODEVALUES_CANCELLED, TMP_RPCGRPCSTATUSCODEVALUES_UNKNOWN, TMP_RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT, TMP_RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED, TMP_RPCGRPCSTATUSCODEVALUES_NOT_FOUND, TMP_RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS, TMP_RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED, TMP_RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED, TMP_RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION, TMP_RPCGRPCSTATUSCODEVALUES_ABORTED, TMP_RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE, TMP_RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED, TMP_RPCGRPCSTATUSCODEVALUES_INTERNAL, TMP_RPCGRPCSTATUSCODEVALUES_UNAVAILABLE, TMP_RPCGRPCSTATUSCODEVALUES_DATA_LOSS, TMP_RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED, RPCGRPCSTATUSCODEVALUES_OK, RPCGRPCSTATUSCODEVALUES_CANCELLED, RPCGRPCSTATUSCODEVALUES_UNKNOWN, RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT, RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED, RPCGRPCSTATUSCODEVALUES_NOT_FOUND, RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS, RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED, RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED, RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION, RPCGRPCSTATUSCODEVALUES_ABORTED, RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE, RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED, RPCGRPCSTATUSCODEVALUES_INTERNAL, RPCGRPCSTATUSCODEVALUES_UNAVAILABLE, RPCGRPCSTATUSCODEVALUES_DATA_LOSS, RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED, RpcGrpcStatusCodeValues, TMP_MESSAGETYPEVALUES_SENT, TMP_MESSAGETYPEVALUES_RECEIVED, MESSAGETYPEVALUES_SENT, MESSAGETYPEVALUES_RECEIVED, MessageTypeValues;
  var init_SemanticAttributes = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/trace/SemanticAttributes.js"() {
      init_utils3();
      TMP_AWS_LAMBDA_INVOKED_ARN = "aws.lambda.invoked_arn";
      TMP_DB_SYSTEM = "db.system";
      TMP_DB_CONNECTION_STRING = "db.connection_string";
      TMP_DB_USER = "db.user";
      TMP_DB_JDBC_DRIVER_CLASSNAME = "db.jdbc.driver_classname";
      TMP_DB_NAME = "db.name";
      TMP_DB_STATEMENT = "db.statement";
      TMP_DB_OPERATION = "db.operation";
      TMP_DB_MSSQL_INSTANCE_NAME = "db.mssql.instance_name";
      TMP_DB_CASSANDRA_KEYSPACE = "db.cassandra.keyspace";
      TMP_DB_CASSANDRA_PAGE_SIZE = "db.cassandra.page_size";
      TMP_DB_CASSANDRA_CONSISTENCY_LEVEL = "db.cassandra.consistency_level";
      TMP_DB_CASSANDRA_TABLE = "db.cassandra.table";
      TMP_DB_CASSANDRA_IDEMPOTENCE = "db.cassandra.idempotence";
      TMP_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT = "db.cassandra.speculative_execution_count";
      TMP_DB_CASSANDRA_COORDINATOR_ID = "db.cassandra.coordinator.id";
      TMP_DB_CASSANDRA_COORDINATOR_DC = "db.cassandra.coordinator.dc";
      TMP_DB_HBASE_NAMESPACE = "db.hbase.namespace";
      TMP_DB_REDIS_DATABASE_INDEX = "db.redis.database_index";
      TMP_DB_MONGODB_COLLECTION = "db.mongodb.collection";
      TMP_DB_SQL_TABLE = "db.sql.table";
      TMP_EXCEPTION_TYPE = "exception.type";
      TMP_EXCEPTION_MESSAGE = "exception.message";
      TMP_EXCEPTION_STACKTRACE = "exception.stacktrace";
      TMP_EXCEPTION_ESCAPED = "exception.escaped";
      TMP_FAAS_TRIGGER = "faas.trigger";
      TMP_FAAS_EXECUTION = "faas.execution";
      TMP_FAAS_DOCUMENT_COLLECTION = "faas.document.collection";
      TMP_FAAS_DOCUMENT_OPERATION = "faas.document.operation";
      TMP_FAAS_DOCUMENT_TIME = "faas.document.time";
      TMP_FAAS_DOCUMENT_NAME = "faas.document.name";
      TMP_FAAS_TIME = "faas.time";
      TMP_FAAS_CRON = "faas.cron";
      TMP_FAAS_COLDSTART = "faas.coldstart";
      TMP_FAAS_INVOKED_NAME = "faas.invoked_name";
      TMP_FAAS_INVOKED_PROVIDER = "faas.invoked_provider";
      TMP_FAAS_INVOKED_REGION = "faas.invoked_region";
      TMP_NET_TRANSPORT = "net.transport";
      TMP_NET_PEER_IP = "net.peer.ip";
      TMP_NET_PEER_PORT = "net.peer.port";
      TMP_NET_PEER_NAME = "net.peer.name";
      TMP_NET_HOST_IP = "net.host.ip";
      TMP_NET_HOST_PORT = "net.host.port";
      TMP_NET_HOST_NAME = "net.host.name";
      TMP_NET_HOST_CONNECTION_TYPE = "net.host.connection.type";
      TMP_NET_HOST_CONNECTION_SUBTYPE = "net.host.connection.subtype";
      TMP_NET_HOST_CARRIER_NAME = "net.host.carrier.name";
      TMP_NET_HOST_CARRIER_MCC = "net.host.carrier.mcc";
      TMP_NET_HOST_CARRIER_MNC = "net.host.carrier.mnc";
      TMP_NET_HOST_CARRIER_ICC = "net.host.carrier.icc";
      TMP_PEER_SERVICE = "peer.service";
      TMP_ENDUSER_ID = "enduser.id";
      TMP_ENDUSER_ROLE = "enduser.role";
      TMP_ENDUSER_SCOPE = "enduser.scope";
      TMP_THREAD_ID = "thread.id";
      TMP_THREAD_NAME = "thread.name";
      TMP_CODE_FUNCTION = "code.function";
      TMP_CODE_NAMESPACE = "code.namespace";
      TMP_CODE_FILEPATH = "code.filepath";
      TMP_CODE_LINENO = "code.lineno";
      TMP_HTTP_METHOD = "http.method";
      TMP_HTTP_URL = "http.url";
      TMP_HTTP_TARGET = "http.target";
      TMP_HTTP_HOST = "http.host";
      TMP_HTTP_SCHEME = "http.scheme";
      TMP_HTTP_STATUS_CODE = "http.status_code";
      TMP_HTTP_FLAVOR = "http.flavor";
      TMP_HTTP_USER_AGENT = "http.user_agent";
      TMP_HTTP_REQUEST_CONTENT_LENGTH = "http.request_content_length";
      TMP_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED = "http.request_content_length_uncompressed";
      TMP_HTTP_RESPONSE_CONTENT_LENGTH = "http.response_content_length";
      TMP_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED = "http.response_content_length_uncompressed";
      TMP_HTTP_SERVER_NAME = "http.server_name";
      TMP_HTTP_ROUTE = "http.route";
      TMP_HTTP_CLIENT_IP = "http.client_ip";
      TMP_AWS_DYNAMODB_TABLE_NAMES = "aws.dynamodb.table_names";
      TMP_AWS_DYNAMODB_CONSUMED_CAPACITY = "aws.dynamodb.consumed_capacity";
      TMP_AWS_DYNAMODB_ITEM_COLLECTION_METRICS = "aws.dynamodb.item_collection_metrics";
      TMP_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY = "aws.dynamodb.provisioned_read_capacity";
      TMP_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY = "aws.dynamodb.provisioned_write_capacity";
      TMP_AWS_DYNAMODB_CONSISTENT_READ = "aws.dynamodb.consistent_read";
      TMP_AWS_DYNAMODB_PROJECTION = "aws.dynamodb.projection";
      TMP_AWS_DYNAMODB_LIMIT = "aws.dynamodb.limit";
      TMP_AWS_DYNAMODB_ATTRIBUTES_TO_GET = "aws.dynamodb.attributes_to_get";
      TMP_AWS_DYNAMODB_INDEX_NAME = "aws.dynamodb.index_name";
      TMP_AWS_DYNAMODB_SELECT = "aws.dynamodb.select";
      TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES = "aws.dynamodb.global_secondary_indexes";
      TMP_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES = "aws.dynamodb.local_secondary_indexes";
      TMP_AWS_DYNAMODB_EXCLUSIVE_START_TABLE = "aws.dynamodb.exclusive_start_table";
      TMP_AWS_DYNAMODB_TABLE_COUNT = "aws.dynamodb.table_count";
      TMP_AWS_DYNAMODB_SCAN_FORWARD = "aws.dynamodb.scan_forward";
      TMP_AWS_DYNAMODB_SEGMENT = "aws.dynamodb.segment";
      TMP_AWS_DYNAMODB_TOTAL_SEGMENTS = "aws.dynamodb.total_segments";
      TMP_AWS_DYNAMODB_COUNT = "aws.dynamodb.count";
      TMP_AWS_DYNAMODB_SCANNED_COUNT = "aws.dynamodb.scanned_count";
      TMP_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS = "aws.dynamodb.attribute_definitions";
      TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES = "aws.dynamodb.global_secondary_index_updates";
      TMP_MESSAGING_SYSTEM = "messaging.system";
      TMP_MESSAGING_DESTINATION = "messaging.destination";
      TMP_MESSAGING_DESTINATION_KIND = "messaging.destination_kind";
      TMP_MESSAGING_TEMP_DESTINATION = "messaging.temp_destination";
      TMP_MESSAGING_PROTOCOL = "messaging.protocol";
      TMP_MESSAGING_PROTOCOL_VERSION = "messaging.protocol_version";
      TMP_MESSAGING_URL = "messaging.url";
      TMP_MESSAGING_MESSAGE_ID = "messaging.message_id";
      TMP_MESSAGING_CONVERSATION_ID = "messaging.conversation_id";
      TMP_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES = "messaging.message_payload_size_bytes";
      TMP_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES = "messaging.message_payload_compressed_size_bytes";
      TMP_MESSAGING_OPERATION = "messaging.operation";
      TMP_MESSAGING_CONSUMER_ID = "messaging.consumer_id";
      TMP_MESSAGING_RABBITMQ_ROUTING_KEY = "messaging.rabbitmq.routing_key";
      TMP_MESSAGING_KAFKA_MESSAGE_KEY = "messaging.kafka.message_key";
      TMP_MESSAGING_KAFKA_CONSUMER_GROUP = "messaging.kafka.consumer_group";
      TMP_MESSAGING_KAFKA_CLIENT_ID = "messaging.kafka.client_id";
      TMP_MESSAGING_KAFKA_PARTITION = "messaging.kafka.partition";
      TMP_MESSAGING_KAFKA_TOMBSTONE = "messaging.kafka.tombstone";
      TMP_RPC_SYSTEM = "rpc.system";
      TMP_RPC_SERVICE = "rpc.service";
      TMP_RPC_METHOD = "rpc.method";
      TMP_RPC_GRPC_STATUS_CODE = "rpc.grpc.status_code";
      TMP_RPC_JSONRPC_VERSION = "rpc.jsonrpc.version";
      TMP_RPC_JSONRPC_REQUEST_ID = "rpc.jsonrpc.request_id";
      TMP_RPC_JSONRPC_ERROR_CODE = "rpc.jsonrpc.error_code";
      TMP_RPC_JSONRPC_ERROR_MESSAGE = "rpc.jsonrpc.error_message";
      TMP_MESSAGE_TYPE = "message.type";
      TMP_MESSAGE_ID = "message.id";
      TMP_MESSAGE_COMPRESSED_SIZE = "message.compressed_size";
      TMP_MESSAGE_UNCOMPRESSED_SIZE = "message.uncompressed_size";
      SEMATTRS_AWS_LAMBDA_INVOKED_ARN = TMP_AWS_LAMBDA_INVOKED_ARN;
      SEMATTRS_DB_SYSTEM = TMP_DB_SYSTEM;
      SEMATTRS_DB_CONNECTION_STRING = TMP_DB_CONNECTION_STRING;
      SEMATTRS_DB_USER = TMP_DB_USER;
      SEMATTRS_DB_JDBC_DRIVER_CLASSNAME = TMP_DB_JDBC_DRIVER_CLASSNAME;
      SEMATTRS_DB_NAME = TMP_DB_NAME;
      SEMATTRS_DB_STATEMENT = TMP_DB_STATEMENT;
      SEMATTRS_DB_OPERATION = TMP_DB_OPERATION;
      SEMATTRS_DB_MSSQL_INSTANCE_NAME = TMP_DB_MSSQL_INSTANCE_NAME;
      SEMATTRS_DB_CASSANDRA_KEYSPACE = TMP_DB_CASSANDRA_KEYSPACE;
      SEMATTRS_DB_CASSANDRA_PAGE_SIZE = TMP_DB_CASSANDRA_PAGE_SIZE;
      SEMATTRS_DB_CASSANDRA_CONSISTENCY_LEVEL = TMP_DB_CASSANDRA_CONSISTENCY_LEVEL;
      SEMATTRS_DB_CASSANDRA_TABLE = TMP_DB_CASSANDRA_TABLE;
      SEMATTRS_DB_CASSANDRA_IDEMPOTENCE = TMP_DB_CASSANDRA_IDEMPOTENCE;
      SEMATTRS_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT = TMP_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT;
      SEMATTRS_DB_CASSANDRA_COORDINATOR_ID = TMP_DB_CASSANDRA_COORDINATOR_ID;
      SEMATTRS_DB_CASSANDRA_COORDINATOR_DC = TMP_DB_CASSANDRA_COORDINATOR_DC;
      SEMATTRS_DB_HBASE_NAMESPACE = TMP_DB_HBASE_NAMESPACE;
      SEMATTRS_DB_REDIS_DATABASE_INDEX = TMP_DB_REDIS_DATABASE_INDEX;
      SEMATTRS_DB_MONGODB_COLLECTION = TMP_DB_MONGODB_COLLECTION;
      SEMATTRS_DB_SQL_TABLE = TMP_DB_SQL_TABLE;
      SEMATTRS_EXCEPTION_TYPE = TMP_EXCEPTION_TYPE;
      SEMATTRS_EXCEPTION_MESSAGE = TMP_EXCEPTION_MESSAGE;
      SEMATTRS_EXCEPTION_STACKTRACE = TMP_EXCEPTION_STACKTRACE;
      SEMATTRS_EXCEPTION_ESCAPED = TMP_EXCEPTION_ESCAPED;
      SEMATTRS_FAAS_TRIGGER = TMP_FAAS_TRIGGER;
      SEMATTRS_FAAS_EXECUTION = TMP_FAAS_EXECUTION;
      SEMATTRS_FAAS_DOCUMENT_COLLECTION = TMP_FAAS_DOCUMENT_COLLECTION;
      SEMATTRS_FAAS_DOCUMENT_OPERATION = TMP_FAAS_DOCUMENT_OPERATION;
      SEMATTRS_FAAS_DOCUMENT_TIME = TMP_FAAS_DOCUMENT_TIME;
      SEMATTRS_FAAS_DOCUMENT_NAME = TMP_FAAS_DOCUMENT_NAME;
      SEMATTRS_FAAS_TIME = TMP_FAAS_TIME;
      SEMATTRS_FAAS_CRON = TMP_FAAS_CRON;
      SEMATTRS_FAAS_COLDSTART = TMP_FAAS_COLDSTART;
      SEMATTRS_FAAS_INVOKED_NAME = TMP_FAAS_INVOKED_NAME;
      SEMATTRS_FAAS_INVOKED_PROVIDER = TMP_FAAS_INVOKED_PROVIDER;
      SEMATTRS_FAAS_INVOKED_REGION = TMP_FAAS_INVOKED_REGION;
      SEMATTRS_NET_TRANSPORT = TMP_NET_TRANSPORT;
      SEMATTRS_NET_PEER_IP = TMP_NET_PEER_IP;
      SEMATTRS_NET_PEER_PORT = TMP_NET_PEER_PORT;
      SEMATTRS_NET_PEER_NAME = TMP_NET_PEER_NAME;
      SEMATTRS_NET_HOST_IP = TMP_NET_HOST_IP;
      SEMATTRS_NET_HOST_PORT = TMP_NET_HOST_PORT;
      SEMATTRS_NET_HOST_NAME = TMP_NET_HOST_NAME;
      SEMATTRS_NET_HOST_CONNECTION_TYPE = TMP_NET_HOST_CONNECTION_TYPE;
      SEMATTRS_NET_HOST_CONNECTION_SUBTYPE = TMP_NET_HOST_CONNECTION_SUBTYPE;
      SEMATTRS_NET_HOST_CARRIER_NAME = TMP_NET_HOST_CARRIER_NAME;
      SEMATTRS_NET_HOST_CARRIER_MCC = TMP_NET_HOST_CARRIER_MCC;
      SEMATTRS_NET_HOST_CARRIER_MNC = TMP_NET_HOST_CARRIER_MNC;
      SEMATTRS_NET_HOST_CARRIER_ICC = TMP_NET_HOST_CARRIER_ICC;
      SEMATTRS_PEER_SERVICE = TMP_PEER_SERVICE;
      SEMATTRS_ENDUSER_ID = TMP_ENDUSER_ID;
      SEMATTRS_ENDUSER_ROLE = TMP_ENDUSER_ROLE;
      SEMATTRS_ENDUSER_SCOPE = TMP_ENDUSER_SCOPE;
      SEMATTRS_THREAD_ID = TMP_THREAD_ID;
      SEMATTRS_THREAD_NAME = TMP_THREAD_NAME;
      SEMATTRS_CODE_FUNCTION = TMP_CODE_FUNCTION;
      SEMATTRS_CODE_NAMESPACE = TMP_CODE_NAMESPACE;
      SEMATTRS_CODE_FILEPATH = TMP_CODE_FILEPATH;
      SEMATTRS_CODE_LINENO = TMP_CODE_LINENO;
      SEMATTRS_HTTP_METHOD = TMP_HTTP_METHOD;
      SEMATTRS_HTTP_URL = TMP_HTTP_URL;
      SEMATTRS_HTTP_TARGET = TMP_HTTP_TARGET;
      SEMATTRS_HTTP_HOST = TMP_HTTP_HOST;
      SEMATTRS_HTTP_SCHEME = TMP_HTTP_SCHEME;
      SEMATTRS_HTTP_STATUS_CODE = TMP_HTTP_STATUS_CODE;
      SEMATTRS_HTTP_FLAVOR = TMP_HTTP_FLAVOR;
      SEMATTRS_HTTP_USER_AGENT = TMP_HTTP_USER_AGENT;
      SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH = TMP_HTTP_REQUEST_CONTENT_LENGTH;
      SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED = TMP_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED;
      SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH = TMP_HTTP_RESPONSE_CONTENT_LENGTH;
      SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED = TMP_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED;
      SEMATTRS_HTTP_SERVER_NAME = TMP_HTTP_SERVER_NAME;
      SEMATTRS_HTTP_ROUTE = TMP_HTTP_ROUTE;
      SEMATTRS_HTTP_CLIENT_IP = TMP_HTTP_CLIENT_IP;
      SEMATTRS_AWS_DYNAMODB_TABLE_NAMES = TMP_AWS_DYNAMODB_TABLE_NAMES;
      SEMATTRS_AWS_DYNAMODB_CONSUMED_CAPACITY = TMP_AWS_DYNAMODB_CONSUMED_CAPACITY;
      SEMATTRS_AWS_DYNAMODB_ITEM_COLLECTION_METRICS = TMP_AWS_DYNAMODB_ITEM_COLLECTION_METRICS;
      SEMATTRS_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY = TMP_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY;
      SEMATTRS_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY = TMP_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY;
      SEMATTRS_AWS_DYNAMODB_CONSISTENT_READ = TMP_AWS_DYNAMODB_CONSISTENT_READ;
      SEMATTRS_AWS_DYNAMODB_PROJECTION = TMP_AWS_DYNAMODB_PROJECTION;
      SEMATTRS_AWS_DYNAMODB_LIMIT = TMP_AWS_DYNAMODB_LIMIT;
      SEMATTRS_AWS_DYNAMODB_ATTRIBUTES_TO_GET = TMP_AWS_DYNAMODB_ATTRIBUTES_TO_GET;
      SEMATTRS_AWS_DYNAMODB_INDEX_NAME = TMP_AWS_DYNAMODB_INDEX_NAME;
      SEMATTRS_AWS_DYNAMODB_SELECT = TMP_AWS_DYNAMODB_SELECT;
      SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES = TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES;
      SEMATTRS_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES = TMP_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES;
      SEMATTRS_AWS_DYNAMODB_EXCLUSIVE_START_TABLE = TMP_AWS_DYNAMODB_EXCLUSIVE_START_TABLE;
      SEMATTRS_AWS_DYNAMODB_TABLE_COUNT = TMP_AWS_DYNAMODB_TABLE_COUNT;
      SEMATTRS_AWS_DYNAMODB_SCAN_FORWARD = TMP_AWS_DYNAMODB_SCAN_FORWARD;
      SEMATTRS_AWS_DYNAMODB_SEGMENT = TMP_AWS_DYNAMODB_SEGMENT;
      SEMATTRS_AWS_DYNAMODB_TOTAL_SEGMENTS = TMP_AWS_DYNAMODB_TOTAL_SEGMENTS;
      SEMATTRS_AWS_DYNAMODB_COUNT = TMP_AWS_DYNAMODB_COUNT;
      SEMATTRS_AWS_DYNAMODB_SCANNED_COUNT = TMP_AWS_DYNAMODB_SCANNED_COUNT;
      SEMATTRS_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS = TMP_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS;
      SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES = TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES;
      SEMATTRS_MESSAGING_SYSTEM = TMP_MESSAGING_SYSTEM;
      SEMATTRS_MESSAGING_DESTINATION = TMP_MESSAGING_DESTINATION;
      SEMATTRS_MESSAGING_DESTINATION_KIND = TMP_MESSAGING_DESTINATION_KIND;
      SEMATTRS_MESSAGING_TEMP_DESTINATION = TMP_MESSAGING_TEMP_DESTINATION;
      SEMATTRS_MESSAGING_PROTOCOL = TMP_MESSAGING_PROTOCOL;
      SEMATTRS_MESSAGING_PROTOCOL_VERSION = TMP_MESSAGING_PROTOCOL_VERSION;
      SEMATTRS_MESSAGING_URL = TMP_MESSAGING_URL;
      SEMATTRS_MESSAGING_MESSAGE_ID = TMP_MESSAGING_MESSAGE_ID;
      SEMATTRS_MESSAGING_CONVERSATION_ID = TMP_MESSAGING_CONVERSATION_ID;
      SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES = TMP_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES;
      SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES = TMP_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES;
      SEMATTRS_MESSAGING_OPERATION = TMP_MESSAGING_OPERATION;
      SEMATTRS_MESSAGING_CONSUMER_ID = TMP_MESSAGING_CONSUMER_ID;
      SEMATTRS_MESSAGING_RABBITMQ_ROUTING_KEY = TMP_MESSAGING_RABBITMQ_ROUTING_KEY;
      SEMATTRS_MESSAGING_KAFKA_MESSAGE_KEY = TMP_MESSAGING_KAFKA_MESSAGE_KEY;
      SEMATTRS_MESSAGING_KAFKA_CONSUMER_GROUP = TMP_MESSAGING_KAFKA_CONSUMER_GROUP;
      SEMATTRS_MESSAGING_KAFKA_CLIENT_ID = TMP_MESSAGING_KAFKA_CLIENT_ID;
      SEMATTRS_MESSAGING_KAFKA_PARTITION = TMP_MESSAGING_KAFKA_PARTITION;
      SEMATTRS_MESSAGING_KAFKA_TOMBSTONE = TMP_MESSAGING_KAFKA_TOMBSTONE;
      SEMATTRS_RPC_SYSTEM = TMP_RPC_SYSTEM;
      SEMATTRS_RPC_SERVICE = TMP_RPC_SERVICE;
      SEMATTRS_RPC_METHOD = TMP_RPC_METHOD;
      SEMATTRS_RPC_GRPC_STATUS_CODE = TMP_RPC_GRPC_STATUS_CODE;
      SEMATTRS_RPC_JSONRPC_VERSION = TMP_RPC_JSONRPC_VERSION;
      SEMATTRS_RPC_JSONRPC_REQUEST_ID = TMP_RPC_JSONRPC_REQUEST_ID;
      SEMATTRS_RPC_JSONRPC_ERROR_CODE = TMP_RPC_JSONRPC_ERROR_CODE;
      SEMATTRS_RPC_JSONRPC_ERROR_MESSAGE = TMP_RPC_JSONRPC_ERROR_MESSAGE;
      SEMATTRS_MESSAGE_TYPE = TMP_MESSAGE_TYPE;
      SEMATTRS_MESSAGE_ID = TMP_MESSAGE_ID;
      SEMATTRS_MESSAGE_COMPRESSED_SIZE = TMP_MESSAGE_COMPRESSED_SIZE;
      SEMATTRS_MESSAGE_UNCOMPRESSED_SIZE = TMP_MESSAGE_UNCOMPRESSED_SIZE;
      SemanticAttributes = /* @__PURE__ */ createConstMap([
        TMP_AWS_LAMBDA_INVOKED_ARN,
        TMP_DB_SYSTEM,
        TMP_DB_CONNECTION_STRING,
        TMP_DB_USER,
        TMP_DB_JDBC_DRIVER_CLASSNAME,
        TMP_DB_NAME,
        TMP_DB_STATEMENT,
        TMP_DB_OPERATION,
        TMP_DB_MSSQL_INSTANCE_NAME,
        TMP_DB_CASSANDRA_KEYSPACE,
        TMP_DB_CASSANDRA_PAGE_SIZE,
        TMP_DB_CASSANDRA_CONSISTENCY_LEVEL,
        TMP_DB_CASSANDRA_TABLE,
        TMP_DB_CASSANDRA_IDEMPOTENCE,
        TMP_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT,
        TMP_DB_CASSANDRA_COORDINATOR_ID,
        TMP_DB_CASSANDRA_COORDINATOR_DC,
        TMP_DB_HBASE_NAMESPACE,
        TMP_DB_REDIS_DATABASE_INDEX,
        TMP_DB_MONGODB_COLLECTION,
        TMP_DB_SQL_TABLE,
        TMP_EXCEPTION_TYPE,
        TMP_EXCEPTION_MESSAGE,
        TMP_EXCEPTION_STACKTRACE,
        TMP_EXCEPTION_ESCAPED,
        TMP_FAAS_TRIGGER,
        TMP_FAAS_EXECUTION,
        TMP_FAAS_DOCUMENT_COLLECTION,
        TMP_FAAS_DOCUMENT_OPERATION,
        TMP_FAAS_DOCUMENT_TIME,
        TMP_FAAS_DOCUMENT_NAME,
        TMP_FAAS_TIME,
        TMP_FAAS_CRON,
        TMP_FAAS_COLDSTART,
        TMP_FAAS_INVOKED_NAME,
        TMP_FAAS_INVOKED_PROVIDER,
        TMP_FAAS_INVOKED_REGION,
        TMP_NET_TRANSPORT,
        TMP_NET_PEER_IP,
        TMP_NET_PEER_PORT,
        TMP_NET_PEER_NAME,
        TMP_NET_HOST_IP,
        TMP_NET_HOST_PORT,
        TMP_NET_HOST_NAME,
        TMP_NET_HOST_CONNECTION_TYPE,
        TMP_NET_HOST_CONNECTION_SUBTYPE,
        TMP_NET_HOST_CARRIER_NAME,
        TMP_NET_HOST_CARRIER_MCC,
        TMP_NET_HOST_CARRIER_MNC,
        TMP_NET_HOST_CARRIER_ICC,
        TMP_PEER_SERVICE,
        TMP_ENDUSER_ID,
        TMP_ENDUSER_ROLE,
        TMP_ENDUSER_SCOPE,
        TMP_THREAD_ID,
        TMP_THREAD_NAME,
        TMP_CODE_FUNCTION,
        TMP_CODE_NAMESPACE,
        TMP_CODE_FILEPATH,
        TMP_CODE_LINENO,
        TMP_HTTP_METHOD,
        TMP_HTTP_URL,
        TMP_HTTP_TARGET,
        TMP_HTTP_HOST,
        TMP_HTTP_SCHEME,
        TMP_HTTP_STATUS_CODE,
        TMP_HTTP_FLAVOR,
        TMP_HTTP_USER_AGENT,
        TMP_HTTP_REQUEST_CONTENT_LENGTH,
        TMP_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED,
        TMP_HTTP_RESPONSE_CONTENT_LENGTH,
        TMP_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED,
        TMP_HTTP_SERVER_NAME,
        TMP_HTTP_ROUTE,
        TMP_HTTP_CLIENT_IP,
        TMP_AWS_DYNAMODB_TABLE_NAMES,
        TMP_AWS_DYNAMODB_CONSUMED_CAPACITY,
        TMP_AWS_DYNAMODB_ITEM_COLLECTION_METRICS,
        TMP_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY,
        TMP_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY,
        TMP_AWS_DYNAMODB_CONSISTENT_READ,
        TMP_AWS_DYNAMODB_PROJECTION,
        TMP_AWS_DYNAMODB_LIMIT,
        TMP_AWS_DYNAMODB_ATTRIBUTES_TO_GET,
        TMP_AWS_DYNAMODB_INDEX_NAME,
        TMP_AWS_DYNAMODB_SELECT,
        TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES,
        TMP_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES,
        TMP_AWS_DYNAMODB_EXCLUSIVE_START_TABLE,
        TMP_AWS_DYNAMODB_TABLE_COUNT,
        TMP_AWS_DYNAMODB_SCAN_FORWARD,
        TMP_AWS_DYNAMODB_SEGMENT,
        TMP_AWS_DYNAMODB_TOTAL_SEGMENTS,
        TMP_AWS_DYNAMODB_COUNT,
        TMP_AWS_DYNAMODB_SCANNED_COUNT,
        TMP_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS,
        TMP_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES,
        TMP_MESSAGING_SYSTEM,
        TMP_MESSAGING_DESTINATION,
        TMP_MESSAGING_DESTINATION_KIND,
        TMP_MESSAGING_TEMP_DESTINATION,
        TMP_MESSAGING_PROTOCOL,
        TMP_MESSAGING_PROTOCOL_VERSION,
        TMP_MESSAGING_URL,
        TMP_MESSAGING_MESSAGE_ID,
        TMP_MESSAGING_CONVERSATION_ID,
        TMP_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES,
        TMP_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES,
        TMP_MESSAGING_OPERATION,
        TMP_MESSAGING_CONSUMER_ID,
        TMP_MESSAGING_RABBITMQ_ROUTING_KEY,
        TMP_MESSAGING_KAFKA_MESSAGE_KEY,
        TMP_MESSAGING_KAFKA_CONSUMER_GROUP,
        TMP_MESSAGING_KAFKA_CLIENT_ID,
        TMP_MESSAGING_KAFKA_PARTITION,
        TMP_MESSAGING_KAFKA_TOMBSTONE,
        TMP_RPC_SYSTEM,
        TMP_RPC_SERVICE,
        TMP_RPC_METHOD,
        TMP_RPC_GRPC_STATUS_CODE,
        TMP_RPC_JSONRPC_VERSION,
        TMP_RPC_JSONRPC_REQUEST_ID,
        TMP_RPC_JSONRPC_ERROR_CODE,
        TMP_RPC_JSONRPC_ERROR_MESSAGE,
        TMP_MESSAGE_TYPE,
        TMP_MESSAGE_ID,
        TMP_MESSAGE_COMPRESSED_SIZE,
        TMP_MESSAGE_UNCOMPRESSED_SIZE
      ]);
      TMP_DBSYSTEMVALUES_OTHER_SQL = "other_sql";
      TMP_DBSYSTEMVALUES_MSSQL = "mssql";
      TMP_DBSYSTEMVALUES_MYSQL = "mysql";
      TMP_DBSYSTEMVALUES_ORACLE = "oracle";
      TMP_DBSYSTEMVALUES_DB2 = "db2";
      TMP_DBSYSTEMVALUES_POSTGRESQL = "postgresql";
      TMP_DBSYSTEMVALUES_REDSHIFT = "redshift";
      TMP_DBSYSTEMVALUES_HIVE = "hive";
      TMP_DBSYSTEMVALUES_CLOUDSCAPE = "cloudscape";
      TMP_DBSYSTEMVALUES_HSQLDB = "hsqldb";
      TMP_DBSYSTEMVALUES_PROGRESS = "progress";
      TMP_DBSYSTEMVALUES_MAXDB = "maxdb";
      TMP_DBSYSTEMVALUES_HANADB = "hanadb";
      TMP_DBSYSTEMVALUES_INGRES = "ingres";
      TMP_DBSYSTEMVALUES_FIRSTSQL = "firstsql";
      TMP_DBSYSTEMVALUES_EDB = "edb";
      TMP_DBSYSTEMVALUES_CACHE = "cache";
      TMP_DBSYSTEMVALUES_ADABAS = "adabas";
      TMP_DBSYSTEMVALUES_FIREBIRD = "firebird";
      TMP_DBSYSTEMVALUES_DERBY = "derby";
      TMP_DBSYSTEMVALUES_FILEMAKER = "filemaker";
      TMP_DBSYSTEMVALUES_INFORMIX = "informix";
      TMP_DBSYSTEMVALUES_INSTANTDB = "instantdb";
      TMP_DBSYSTEMVALUES_INTERBASE = "interbase";
      TMP_DBSYSTEMVALUES_MARIADB = "mariadb";
      TMP_DBSYSTEMVALUES_NETEZZA = "netezza";
      TMP_DBSYSTEMVALUES_PERVASIVE = "pervasive";
      TMP_DBSYSTEMVALUES_POINTBASE = "pointbase";
      TMP_DBSYSTEMVALUES_SQLITE = "sqlite";
      TMP_DBSYSTEMVALUES_SYBASE = "sybase";
      TMP_DBSYSTEMVALUES_TERADATA = "teradata";
      TMP_DBSYSTEMVALUES_VERTICA = "vertica";
      TMP_DBSYSTEMVALUES_H2 = "h2";
      TMP_DBSYSTEMVALUES_COLDFUSION = "coldfusion";
      TMP_DBSYSTEMVALUES_CASSANDRA = "cassandra";
      TMP_DBSYSTEMVALUES_HBASE = "hbase";
      TMP_DBSYSTEMVALUES_MONGODB = "mongodb";
      TMP_DBSYSTEMVALUES_REDIS = "redis";
      TMP_DBSYSTEMVALUES_COUCHBASE = "couchbase";
      TMP_DBSYSTEMVALUES_COUCHDB = "couchdb";
      TMP_DBSYSTEMVALUES_COSMOSDB = "cosmosdb";
      TMP_DBSYSTEMVALUES_DYNAMODB = "dynamodb";
      TMP_DBSYSTEMVALUES_NEO4J = "neo4j";
      TMP_DBSYSTEMVALUES_GEODE = "geode";
      TMP_DBSYSTEMVALUES_ELASTICSEARCH = "elasticsearch";
      TMP_DBSYSTEMVALUES_MEMCACHED = "memcached";
      TMP_DBSYSTEMVALUES_COCKROACHDB = "cockroachdb";
      DBSYSTEMVALUES_OTHER_SQL = TMP_DBSYSTEMVALUES_OTHER_SQL;
      DBSYSTEMVALUES_MSSQL = TMP_DBSYSTEMVALUES_MSSQL;
      DBSYSTEMVALUES_MYSQL = TMP_DBSYSTEMVALUES_MYSQL;
      DBSYSTEMVALUES_ORACLE = TMP_DBSYSTEMVALUES_ORACLE;
      DBSYSTEMVALUES_DB2 = TMP_DBSYSTEMVALUES_DB2;
      DBSYSTEMVALUES_POSTGRESQL = TMP_DBSYSTEMVALUES_POSTGRESQL;
      DBSYSTEMVALUES_REDSHIFT = TMP_DBSYSTEMVALUES_REDSHIFT;
      DBSYSTEMVALUES_HIVE = TMP_DBSYSTEMVALUES_HIVE;
      DBSYSTEMVALUES_CLOUDSCAPE = TMP_DBSYSTEMVALUES_CLOUDSCAPE;
      DBSYSTEMVALUES_HSQLDB = TMP_DBSYSTEMVALUES_HSQLDB;
      DBSYSTEMVALUES_PROGRESS = TMP_DBSYSTEMVALUES_PROGRESS;
      DBSYSTEMVALUES_MAXDB = TMP_DBSYSTEMVALUES_MAXDB;
      DBSYSTEMVALUES_HANADB = TMP_DBSYSTEMVALUES_HANADB;
      DBSYSTEMVALUES_INGRES = TMP_DBSYSTEMVALUES_INGRES;
      DBSYSTEMVALUES_FIRSTSQL = TMP_DBSYSTEMVALUES_FIRSTSQL;
      DBSYSTEMVALUES_EDB = TMP_DBSYSTEMVALUES_EDB;
      DBSYSTEMVALUES_CACHE = TMP_DBSYSTEMVALUES_CACHE;
      DBSYSTEMVALUES_ADABAS = TMP_DBSYSTEMVALUES_ADABAS;
      DBSYSTEMVALUES_FIREBIRD = TMP_DBSYSTEMVALUES_FIREBIRD;
      DBSYSTEMVALUES_DERBY = TMP_DBSYSTEMVALUES_DERBY;
      DBSYSTEMVALUES_FILEMAKER = TMP_DBSYSTEMVALUES_FILEMAKER;
      DBSYSTEMVALUES_INFORMIX = TMP_DBSYSTEMVALUES_INFORMIX;
      DBSYSTEMVALUES_INSTANTDB = TMP_DBSYSTEMVALUES_INSTANTDB;
      DBSYSTEMVALUES_INTERBASE = TMP_DBSYSTEMVALUES_INTERBASE;
      DBSYSTEMVALUES_MARIADB = TMP_DBSYSTEMVALUES_MARIADB;
      DBSYSTEMVALUES_NETEZZA = TMP_DBSYSTEMVALUES_NETEZZA;
      DBSYSTEMVALUES_PERVASIVE = TMP_DBSYSTEMVALUES_PERVASIVE;
      DBSYSTEMVALUES_POINTBASE = TMP_DBSYSTEMVALUES_POINTBASE;
      DBSYSTEMVALUES_SQLITE = TMP_DBSYSTEMVALUES_SQLITE;
      DBSYSTEMVALUES_SYBASE = TMP_DBSYSTEMVALUES_SYBASE;
      DBSYSTEMVALUES_TERADATA = TMP_DBSYSTEMVALUES_TERADATA;
      DBSYSTEMVALUES_VERTICA = TMP_DBSYSTEMVALUES_VERTICA;
      DBSYSTEMVALUES_H2 = TMP_DBSYSTEMVALUES_H2;
      DBSYSTEMVALUES_COLDFUSION = TMP_DBSYSTEMVALUES_COLDFUSION;
      DBSYSTEMVALUES_CASSANDRA = TMP_DBSYSTEMVALUES_CASSANDRA;
      DBSYSTEMVALUES_HBASE = TMP_DBSYSTEMVALUES_HBASE;
      DBSYSTEMVALUES_MONGODB = TMP_DBSYSTEMVALUES_MONGODB;
      DBSYSTEMVALUES_REDIS = TMP_DBSYSTEMVALUES_REDIS;
      DBSYSTEMVALUES_COUCHBASE = TMP_DBSYSTEMVALUES_COUCHBASE;
      DBSYSTEMVALUES_COUCHDB = TMP_DBSYSTEMVALUES_COUCHDB;
      DBSYSTEMVALUES_COSMOSDB = TMP_DBSYSTEMVALUES_COSMOSDB;
      DBSYSTEMVALUES_DYNAMODB = TMP_DBSYSTEMVALUES_DYNAMODB;
      DBSYSTEMVALUES_NEO4J = TMP_DBSYSTEMVALUES_NEO4J;
      DBSYSTEMVALUES_GEODE = TMP_DBSYSTEMVALUES_GEODE;
      DBSYSTEMVALUES_ELASTICSEARCH = TMP_DBSYSTEMVALUES_ELASTICSEARCH;
      DBSYSTEMVALUES_MEMCACHED = TMP_DBSYSTEMVALUES_MEMCACHED;
      DBSYSTEMVALUES_COCKROACHDB = TMP_DBSYSTEMVALUES_COCKROACHDB;
      DbSystemValues = /* @__PURE__ */ createConstMap([
        TMP_DBSYSTEMVALUES_OTHER_SQL,
        TMP_DBSYSTEMVALUES_MSSQL,
        TMP_DBSYSTEMVALUES_MYSQL,
        TMP_DBSYSTEMVALUES_ORACLE,
        TMP_DBSYSTEMVALUES_DB2,
        TMP_DBSYSTEMVALUES_POSTGRESQL,
        TMP_DBSYSTEMVALUES_REDSHIFT,
        TMP_DBSYSTEMVALUES_HIVE,
        TMP_DBSYSTEMVALUES_CLOUDSCAPE,
        TMP_DBSYSTEMVALUES_HSQLDB,
        TMP_DBSYSTEMVALUES_PROGRESS,
        TMP_DBSYSTEMVALUES_MAXDB,
        TMP_DBSYSTEMVALUES_HANADB,
        TMP_DBSYSTEMVALUES_INGRES,
        TMP_DBSYSTEMVALUES_FIRSTSQL,
        TMP_DBSYSTEMVALUES_EDB,
        TMP_DBSYSTEMVALUES_CACHE,
        TMP_DBSYSTEMVALUES_ADABAS,
        TMP_DBSYSTEMVALUES_FIREBIRD,
        TMP_DBSYSTEMVALUES_DERBY,
        TMP_DBSYSTEMVALUES_FILEMAKER,
        TMP_DBSYSTEMVALUES_INFORMIX,
        TMP_DBSYSTEMVALUES_INSTANTDB,
        TMP_DBSYSTEMVALUES_INTERBASE,
        TMP_DBSYSTEMVALUES_MARIADB,
        TMP_DBSYSTEMVALUES_NETEZZA,
        TMP_DBSYSTEMVALUES_PERVASIVE,
        TMP_DBSYSTEMVALUES_POINTBASE,
        TMP_DBSYSTEMVALUES_SQLITE,
        TMP_DBSYSTEMVALUES_SYBASE,
        TMP_DBSYSTEMVALUES_TERADATA,
        TMP_DBSYSTEMVALUES_VERTICA,
        TMP_DBSYSTEMVALUES_H2,
        TMP_DBSYSTEMVALUES_COLDFUSION,
        TMP_DBSYSTEMVALUES_CASSANDRA,
        TMP_DBSYSTEMVALUES_HBASE,
        TMP_DBSYSTEMVALUES_MONGODB,
        TMP_DBSYSTEMVALUES_REDIS,
        TMP_DBSYSTEMVALUES_COUCHBASE,
        TMP_DBSYSTEMVALUES_COUCHDB,
        TMP_DBSYSTEMVALUES_COSMOSDB,
        TMP_DBSYSTEMVALUES_DYNAMODB,
        TMP_DBSYSTEMVALUES_NEO4J,
        TMP_DBSYSTEMVALUES_GEODE,
        TMP_DBSYSTEMVALUES_ELASTICSEARCH,
        TMP_DBSYSTEMVALUES_MEMCACHED,
        TMP_DBSYSTEMVALUES_COCKROACHDB
      ]);
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ALL = "all";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM = "each_quorum";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM = "quorum";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM = "local_quorum";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ONE = "one";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_TWO = "two";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_THREE = "three";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE = "local_one";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ANY = "any";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL = "serial";
      TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL = "local_serial";
      DBCASSANDRACONSISTENCYLEVELVALUES_ALL = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ALL;
      DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM;
      DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM;
      DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM;
      DBCASSANDRACONSISTENCYLEVELVALUES_ONE = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ONE;
      DBCASSANDRACONSISTENCYLEVELVALUES_TWO = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_TWO;
      DBCASSANDRACONSISTENCYLEVELVALUES_THREE = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_THREE;
      DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE;
      DBCASSANDRACONSISTENCYLEVELVALUES_ANY = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ANY;
      DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL;
      DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL = TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL;
      DbCassandraConsistencyLevelValues = /* @__PURE__ */ createConstMap([
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ALL,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ONE,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_TWO,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_THREE,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_ANY,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL,
        TMP_DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL
      ]);
      TMP_FAASTRIGGERVALUES_DATASOURCE = "datasource";
      TMP_FAASTRIGGERVALUES_HTTP = "http";
      TMP_FAASTRIGGERVALUES_PUBSUB = "pubsub";
      TMP_FAASTRIGGERVALUES_TIMER = "timer";
      TMP_FAASTRIGGERVALUES_OTHER = "other";
      FAASTRIGGERVALUES_DATASOURCE = TMP_FAASTRIGGERVALUES_DATASOURCE;
      FAASTRIGGERVALUES_HTTP = TMP_FAASTRIGGERVALUES_HTTP;
      FAASTRIGGERVALUES_PUBSUB = TMP_FAASTRIGGERVALUES_PUBSUB;
      FAASTRIGGERVALUES_TIMER = TMP_FAASTRIGGERVALUES_TIMER;
      FAASTRIGGERVALUES_OTHER = TMP_FAASTRIGGERVALUES_OTHER;
      FaasTriggerValues = /* @__PURE__ */ createConstMap([
        TMP_FAASTRIGGERVALUES_DATASOURCE,
        TMP_FAASTRIGGERVALUES_HTTP,
        TMP_FAASTRIGGERVALUES_PUBSUB,
        TMP_FAASTRIGGERVALUES_TIMER,
        TMP_FAASTRIGGERVALUES_OTHER
      ]);
      TMP_FAASDOCUMENTOPERATIONVALUES_INSERT = "insert";
      TMP_FAASDOCUMENTOPERATIONVALUES_EDIT = "edit";
      TMP_FAASDOCUMENTOPERATIONVALUES_DELETE = "delete";
      FAASDOCUMENTOPERATIONVALUES_INSERT = TMP_FAASDOCUMENTOPERATIONVALUES_INSERT;
      FAASDOCUMENTOPERATIONVALUES_EDIT = TMP_FAASDOCUMENTOPERATIONVALUES_EDIT;
      FAASDOCUMENTOPERATIONVALUES_DELETE = TMP_FAASDOCUMENTOPERATIONVALUES_DELETE;
      FaasDocumentOperationValues = /* @__PURE__ */ createConstMap([
        TMP_FAASDOCUMENTOPERATIONVALUES_INSERT,
        TMP_FAASDOCUMENTOPERATIONVALUES_EDIT,
        TMP_FAASDOCUMENTOPERATIONVALUES_DELETE
      ]);
      TMP_FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD = "alibaba_cloud";
      TMP_FAASINVOKEDPROVIDERVALUES_AWS = "aws";
      TMP_FAASINVOKEDPROVIDERVALUES_AZURE = "azure";
      TMP_FAASINVOKEDPROVIDERVALUES_GCP = "gcp";
      FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD = TMP_FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD;
      FAASINVOKEDPROVIDERVALUES_AWS = TMP_FAASINVOKEDPROVIDERVALUES_AWS;
      FAASINVOKEDPROVIDERVALUES_AZURE = TMP_FAASINVOKEDPROVIDERVALUES_AZURE;
      FAASINVOKEDPROVIDERVALUES_GCP = TMP_FAASINVOKEDPROVIDERVALUES_GCP;
      FaasInvokedProviderValues = /* @__PURE__ */ createConstMap([
        TMP_FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD,
        TMP_FAASINVOKEDPROVIDERVALUES_AWS,
        TMP_FAASINVOKEDPROVIDERVALUES_AZURE,
        TMP_FAASINVOKEDPROVIDERVALUES_GCP
      ]);
      TMP_NETTRANSPORTVALUES_IP_TCP = "ip_tcp";
      TMP_NETTRANSPORTVALUES_IP_UDP = "ip_udp";
      TMP_NETTRANSPORTVALUES_IP = "ip";
      TMP_NETTRANSPORTVALUES_UNIX = "unix";
      TMP_NETTRANSPORTVALUES_PIPE = "pipe";
      TMP_NETTRANSPORTVALUES_INPROC = "inproc";
      TMP_NETTRANSPORTVALUES_OTHER = "other";
      NETTRANSPORTVALUES_IP_TCP = TMP_NETTRANSPORTVALUES_IP_TCP;
      NETTRANSPORTVALUES_IP_UDP = TMP_NETTRANSPORTVALUES_IP_UDP;
      NETTRANSPORTVALUES_IP = TMP_NETTRANSPORTVALUES_IP;
      NETTRANSPORTVALUES_UNIX = TMP_NETTRANSPORTVALUES_UNIX;
      NETTRANSPORTVALUES_PIPE = TMP_NETTRANSPORTVALUES_PIPE;
      NETTRANSPORTVALUES_INPROC = TMP_NETTRANSPORTVALUES_INPROC;
      NETTRANSPORTVALUES_OTHER = TMP_NETTRANSPORTVALUES_OTHER;
      NetTransportValues = /* @__PURE__ */ createConstMap([
        TMP_NETTRANSPORTVALUES_IP_TCP,
        TMP_NETTRANSPORTVALUES_IP_UDP,
        TMP_NETTRANSPORTVALUES_IP,
        TMP_NETTRANSPORTVALUES_UNIX,
        TMP_NETTRANSPORTVALUES_PIPE,
        TMP_NETTRANSPORTVALUES_INPROC,
        TMP_NETTRANSPORTVALUES_OTHER
      ]);
      TMP_NETHOSTCONNECTIONTYPEVALUES_WIFI = "wifi";
      TMP_NETHOSTCONNECTIONTYPEVALUES_WIRED = "wired";
      TMP_NETHOSTCONNECTIONTYPEVALUES_CELL = "cell";
      TMP_NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE = "unavailable";
      TMP_NETHOSTCONNECTIONTYPEVALUES_UNKNOWN = "unknown";
      NETHOSTCONNECTIONTYPEVALUES_WIFI = TMP_NETHOSTCONNECTIONTYPEVALUES_WIFI;
      NETHOSTCONNECTIONTYPEVALUES_WIRED = TMP_NETHOSTCONNECTIONTYPEVALUES_WIRED;
      NETHOSTCONNECTIONTYPEVALUES_CELL = TMP_NETHOSTCONNECTIONTYPEVALUES_CELL;
      NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE = TMP_NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE;
      NETHOSTCONNECTIONTYPEVALUES_UNKNOWN = TMP_NETHOSTCONNECTIONTYPEVALUES_UNKNOWN;
      NetHostConnectionTypeValues = /* @__PURE__ */ createConstMap([
        TMP_NETHOSTCONNECTIONTYPEVALUES_WIFI,
        TMP_NETHOSTCONNECTIONTYPEVALUES_WIRED,
        TMP_NETHOSTCONNECTIONTYPEVALUES_CELL,
        TMP_NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE,
        TMP_NETHOSTCONNECTIONTYPEVALUES_UNKNOWN
      ]);
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GPRS = "gprs";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EDGE = "edge";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_UMTS = "umts";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA = "cdma";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0 = "evdo_0";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A = "evdo_a";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT = "cdma2000_1xrtt";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA = "hsdpa";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA = "hsupa";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPA = "hspa";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IDEN = "iden";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B = "evdo_b";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE = "lte";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD = "ehrpd";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP = "hspap";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GSM = "gsm";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA = "td_scdma";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN = "iwlan";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NR = "nr";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA = "nrnsa";
      TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA = "lte_ca";
      NETHOSTCONNECTIONSUBTYPEVALUES_GPRS = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GPRS;
      NETHOSTCONNECTIONSUBTYPEVALUES_EDGE = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EDGE;
      NETHOSTCONNECTIONSUBTYPEVALUES_UMTS = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_UMTS;
      NETHOSTCONNECTIONSUBTYPEVALUES_CDMA = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA;
      NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0 = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0;
      NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A;
      NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT;
      NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA;
      NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA;
      NETHOSTCONNECTIONSUBTYPEVALUES_HSPA = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPA;
      NETHOSTCONNECTIONSUBTYPEVALUES_IDEN = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IDEN;
      NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B;
      NETHOSTCONNECTIONSUBTYPEVALUES_LTE = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE;
      NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD;
      NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP;
      NETHOSTCONNECTIONSUBTYPEVALUES_GSM = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GSM;
      NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA;
      NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN;
      NETHOSTCONNECTIONSUBTYPEVALUES_NR = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NR;
      NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA;
      NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA = TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA;
      NetHostConnectionSubtypeValues = /* @__PURE__ */ createConstMap([
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GPRS,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EDGE,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_UMTS,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPA,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IDEN,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_GSM,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NR,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA,
        TMP_NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA
      ]);
      TMP_HTTPFLAVORVALUES_HTTP_1_0 = "1.0";
      TMP_HTTPFLAVORVALUES_HTTP_1_1 = "1.1";
      TMP_HTTPFLAVORVALUES_HTTP_2_0 = "2.0";
      TMP_HTTPFLAVORVALUES_SPDY = "SPDY";
      TMP_HTTPFLAVORVALUES_QUIC = "QUIC";
      HTTPFLAVORVALUES_HTTP_1_0 = TMP_HTTPFLAVORVALUES_HTTP_1_0;
      HTTPFLAVORVALUES_HTTP_1_1 = TMP_HTTPFLAVORVALUES_HTTP_1_1;
      HTTPFLAVORVALUES_HTTP_2_0 = TMP_HTTPFLAVORVALUES_HTTP_2_0;
      HTTPFLAVORVALUES_SPDY = TMP_HTTPFLAVORVALUES_SPDY;
      HTTPFLAVORVALUES_QUIC = TMP_HTTPFLAVORVALUES_QUIC;
      HttpFlavorValues = {
        HTTP_1_0: TMP_HTTPFLAVORVALUES_HTTP_1_0,
        HTTP_1_1: TMP_HTTPFLAVORVALUES_HTTP_1_1,
        HTTP_2_0: TMP_HTTPFLAVORVALUES_HTTP_2_0,
        SPDY: TMP_HTTPFLAVORVALUES_SPDY,
        QUIC: TMP_HTTPFLAVORVALUES_QUIC
      };
      TMP_MESSAGINGDESTINATIONKINDVALUES_QUEUE = "queue";
      TMP_MESSAGINGDESTINATIONKINDVALUES_TOPIC = "topic";
      MESSAGINGDESTINATIONKINDVALUES_QUEUE = TMP_MESSAGINGDESTINATIONKINDVALUES_QUEUE;
      MESSAGINGDESTINATIONKINDVALUES_TOPIC = TMP_MESSAGINGDESTINATIONKINDVALUES_TOPIC;
      MessagingDestinationKindValues = /* @__PURE__ */ createConstMap([
        TMP_MESSAGINGDESTINATIONKINDVALUES_QUEUE,
        TMP_MESSAGINGDESTINATIONKINDVALUES_TOPIC
      ]);
      TMP_MESSAGINGOPERATIONVALUES_RECEIVE = "receive";
      TMP_MESSAGINGOPERATIONVALUES_PROCESS = "process";
      MESSAGINGOPERATIONVALUES_RECEIVE = TMP_MESSAGINGOPERATIONVALUES_RECEIVE;
      MESSAGINGOPERATIONVALUES_PROCESS = TMP_MESSAGINGOPERATIONVALUES_PROCESS;
      MessagingOperationValues = /* @__PURE__ */ createConstMap([
        TMP_MESSAGINGOPERATIONVALUES_RECEIVE,
        TMP_MESSAGINGOPERATIONVALUES_PROCESS
      ]);
      TMP_RPCGRPCSTATUSCODEVALUES_OK = 0;
      TMP_RPCGRPCSTATUSCODEVALUES_CANCELLED = 1;
      TMP_RPCGRPCSTATUSCODEVALUES_UNKNOWN = 2;
      TMP_RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT = 3;
      TMP_RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED = 4;
      TMP_RPCGRPCSTATUSCODEVALUES_NOT_FOUND = 5;
      TMP_RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS = 6;
      TMP_RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED = 7;
      TMP_RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED = 8;
      TMP_RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION = 9;
      TMP_RPCGRPCSTATUSCODEVALUES_ABORTED = 10;
      TMP_RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE = 11;
      TMP_RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED = 12;
      TMP_RPCGRPCSTATUSCODEVALUES_INTERNAL = 13;
      TMP_RPCGRPCSTATUSCODEVALUES_UNAVAILABLE = 14;
      TMP_RPCGRPCSTATUSCODEVALUES_DATA_LOSS = 15;
      TMP_RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED = 16;
      RPCGRPCSTATUSCODEVALUES_OK = TMP_RPCGRPCSTATUSCODEVALUES_OK;
      RPCGRPCSTATUSCODEVALUES_CANCELLED = TMP_RPCGRPCSTATUSCODEVALUES_CANCELLED;
      RPCGRPCSTATUSCODEVALUES_UNKNOWN = TMP_RPCGRPCSTATUSCODEVALUES_UNKNOWN;
      RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT = TMP_RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT;
      RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED = TMP_RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED;
      RPCGRPCSTATUSCODEVALUES_NOT_FOUND = TMP_RPCGRPCSTATUSCODEVALUES_NOT_FOUND;
      RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS = TMP_RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS;
      RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED = TMP_RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED;
      RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED = TMP_RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED;
      RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION = TMP_RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION;
      RPCGRPCSTATUSCODEVALUES_ABORTED = TMP_RPCGRPCSTATUSCODEVALUES_ABORTED;
      RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE = TMP_RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE;
      RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED = TMP_RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED;
      RPCGRPCSTATUSCODEVALUES_INTERNAL = TMP_RPCGRPCSTATUSCODEVALUES_INTERNAL;
      RPCGRPCSTATUSCODEVALUES_UNAVAILABLE = TMP_RPCGRPCSTATUSCODEVALUES_UNAVAILABLE;
      RPCGRPCSTATUSCODEVALUES_DATA_LOSS = TMP_RPCGRPCSTATUSCODEVALUES_DATA_LOSS;
      RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED = TMP_RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED;
      RpcGrpcStatusCodeValues = {
        OK: TMP_RPCGRPCSTATUSCODEVALUES_OK,
        CANCELLED: TMP_RPCGRPCSTATUSCODEVALUES_CANCELLED,
        UNKNOWN: TMP_RPCGRPCSTATUSCODEVALUES_UNKNOWN,
        INVALID_ARGUMENT: TMP_RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT,
        DEADLINE_EXCEEDED: TMP_RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED,
        NOT_FOUND: TMP_RPCGRPCSTATUSCODEVALUES_NOT_FOUND,
        ALREADY_EXISTS: TMP_RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS,
        PERMISSION_DENIED: TMP_RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED,
        RESOURCE_EXHAUSTED: TMP_RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED,
        FAILED_PRECONDITION: TMP_RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION,
        ABORTED: TMP_RPCGRPCSTATUSCODEVALUES_ABORTED,
        OUT_OF_RANGE: TMP_RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE,
        UNIMPLEMENTED: TMP_RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED,
        INTERNAL: TMP_RPCGRPCSTATUSCODEVALUES_INTERNAL,
        UNAVAILABLE: TMP_RPCGRPCSTATUSCODEVALUES_UNAVAILABLE,
        DATA_LOSS: TMP_RPCGRPCSTATUSCODEVALUES_DATA_LOSS,
        UNAUTHENTICATED: TMP_RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED
      };
      TMP_MESSAGETYPEVALUES_SENT = "SENT";
      TMP_MESSAGETYPEVALUES_RECEIVED = "RECEIVED";
      MESSAGETYPEVALUES_SENT = TMP_MESSAGETYPEVALUES_SENT;
      MESSAGETYPEVALUES_RECEIVED = TMP_MESSAGETYPEVALUES_RECEIVED;
      MessageTypeValues = /* @__PURE__ */ createConstMap([
        TMP_MESSAGETYPEVALUES_SENT,
        TMP_MESSAGETYPEVALUES_RECEIVED
      ]);
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/trace/index.js
  var init_trace2 = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/trace/index.js"() {
      init_SemanticAttributes();
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/resource/SemanticResourceAttributes.js
  var TMP_CLOUD_PROVIDER, TMP_CLOUD_ACCOUNT_ID, TMP_CLOUD_REGION, TMP_CLOUD_AVAILABILITY_ZONE, TMP_CLOUD_PLATFORM, TMP_AWS_ECS_CONTAINER_ARN, TMP_AWS_ECS_CLUSTER_ARN, TMP_AWS_ECS_LAUNCHTYPE, TMP_AWS_ECS_TASK_ARN, TMP_AWS_ECS_TASK_FAMILY, TMP_AWS_ECS_TASK_REVISION, TMP_AWS_EKS_CLUSTER_ARN, TMP_AWS_LOG_GROUP_NAMES, TMP_AWS_LOG_GROUP_ARNS, TMP_AWS_LOG_STREAM_NAMES, TMP_AWS_LOG_STREAM_ARNS, TMP_CONTAINER_NAME, TMP_CONTAINER_ID, TMP_CONTAINER_RUNTIME, TMP_CONTAINER_IMAGE_NAME, TMP_CONTAINER_IMAGE_TAG, TMP_DEPLOYMENT_ENVIRONMENT, TMP_DEVICE_ID, TMP_DEVICE_MODEL_IDENTIFIER, TMP_DEVICE_MODEL_NAME, TMP_FAAS_NAME, TMP_FAAS_ID, TMP_FAAS_VERSION, TMP_FAAS_INSTANCE, TMP_FAAS_MAX_MEMORY, TMP_HOST_ID, TMP_HOST_NAME, TMP_HOST_TYPE, TMP_HOST_ARCH, TMP_HOST_IMAGE_NAME, TMP_HOST_IMAGE_ID, TMP_HOST_IMAGE_VERSION, TMP_K8S_CLUSTER_NAME, TMP_K8S_NODE_NAME, TMP_K8S_NODE_UID, TMP_K8S_NAMESPACE_NAME, TMP_K8S_POD_UID, TMP_K8S_POD_NAME, TMP_K8S_CONTAINER_NAME, TMP_K8S_REPLICASET_UID, TMP_K8S_REPLICASET_NAME, TMP_K8S_DEPLOYMENT_UID, TMP_K8S_DEPLOYMENT_NAME, TMP_K8S_STATEFULSET_UID, TMP_K8S_STATEFULSET_NAME, TMP_K8S_DAEMONSET_UID, TMP_K8S_DAEMONSET_NAME, TMP_K8S_JOB_UID, TMP_K8S_JOB_NAME, TMP_K8S_CRONJOB_UID, TMP_K8S_CRONJOB_NAME, TMP_OS_TYPE, TMP_OS_DESCRIPTION, TMP_OS_NAME, TMP_OS_VERSION, TMP_PROCESS_PID, TMP_PROCESS_EXECUTABLE_NAME, TMP_PROCESS_EXECUTABLE_PATH, TMP_PROCESS_COMMAND, TMP_PROCESS_COMMAND_LINE, TMP_PROCESS_COMMAND_ARGS, TMP_PROCESS_OWNER, TMP_PROCESS_RUNTIME_NAME, TMP_PROCESS_RUNTIME_VERSION, TMP_PROCESS_RUNTIME_DESCRIPTION, TMP_SERVICE_NAME, TMP_SERVICE_NAMESPACE, TMP_SERVICE_INSTANCE_ID, TMP_SERVICE_VERSION, TMP_TELEMETRY_SDK_NAME, TMP_TELEMETRY_SDK_LANGUAGE, TMP_TELEMETRY_SDK_VERSION, TMP_TELEMETRY_AUTO_VERSION, TMP_WEBENGINE_NAME, TMP_WEBENGINE_VERSION, TMP_WEBENGINE_DESCRIPTION, SEMRESATTRS_CLOUD_PROVIDER, SEMRESATTRS_CLOUD_ACCOUNT_ID, SEMRESATTRS_CLOUD_REGION, SEMRESATTRS_CLOUD_AVAILABILITY_ZONE, SEMRESATTRS_CLOUD_PLATFORM, SEMRESATTRS_AWS_ECS_CONTAINER_ARN, SEMRESATTRS_AWS_ECS_CLUSTER_ARN, SEMRESATTRS_AWS_ECS_LAUNCHTYPE, SEMRESATTRS_AWS_ECS_TASK_ARN, SEMRESATTRS_AWS_ECS_TASK_FAMILY, SEMRESATTRS_AWS_ECS_TASK_REVISION, SEMRESATTRS_AWS_EKS_CLUSTER_ARN, SEMRESATTRS_AWS_LOG_GROUP_NAMES, SEMRESATTRS_AWS_LOG_GROUP_ARNS, SEMRESATTRS_AWS_LOG_STREAM_NAMES, SEMRESATTRS_AWS_LOG_STREAM_ARNS, SEMRESATTRS_CONTAINER_NAME, SEMRESATTRS_CONTAINER_ID, SEMRESATTRS_CONTAINER_RUNTIME, SEMRESATTRS_CONTAINER_IMAGE_NAME, SEMRESATTRS_CONTAINER_IMAGE_TAG, SEMRESATTRS_DEPLOYMENT_ENVIRONMENT, SEMRESATTRS_DEVICE_ID, SEMRESATTRS_DEVICE_MODEL_IDENTIFIER, SEMRESATTRS_DEVICE_MODEL_NAME, SEMRESATTRS_FAAS_NAME, SEMRESATTRS_FAAS_ID, SEMRESATTRS_FAAS_VERSION, SEMRESATTRS_FAAS_INSTANCE, SEMRESATTRS_FAAS_MAX_MEMORY, SEMRESATTRS_HOST_ID, SEMRESATTRS_HOST_NAME, SEMRESATTRS_HOST_TYPE, SEMRESATTRS_HOST_ARCH, SEMRESATTRS_HOST_IMAGE_NAME, SEMRESATTRS_HOST_IMAGE_ID, SEMRESATTRS_HOST_IMAGE_VERSION, SEMRESATTRS_K8S_CLUSTER_NAME, SEMRESATTRS_K8S_NODE_NAME, SEMRESATTRS_K8S_NODE_UID, SEMRESATTRS_K8S_NAMESPACE_NAME, SEMRESATTRS_K8S_POD_UID, SEMRESATTRS_K8S_POD_NAME, SEMRESATTRS_K8S_CONTAINER_NAME, SEMRESATTRS_K8S_REPLICASET_UID, SEMRESATTRS_K8S_REPLICASET_NAME, SEMRESATTRS_K8S_DEPLOYMENT_UID, SEMRESATTRS_K8S_DEPLOYMENT_NAME, SEMRESATTRS_K8S_STATEFULSET_UID, SEMRESATTRS_K8S_STATEFULSET_NAME, SEMRESATTRS_K8S_DAEMONSET_UID, SEMRESATTRS_K8S_DAEMONSET_NAME, SEMRESATTRS_K8S_JOB_UID, SEMRESATTRS_K8S_JOB_NAME, SEMRESATTRS_K8S_CRONJOB_UID, SEMRESATTRS_K8S_CRONJOB_NAME, SEMRESATTRS_OS_TYPE, SEMRESATTRS_OS_DESCRIPTION, SEMRESATTRS_OS_NAME, SEMRESATTRS_OS_VERSION, SEMRESATTRS_PROCESS_PID, SEMRESATTRS_PROCESS_EXECUTABLE_NAME, SEMRESATTRS_PROCESS_EXECUTABLE_PATH, SEMRESATTRS_PROCESS_COMMAND, SEMRESATTRS_PROCESS_COMMAND_LINE, SEMRESATTRS_PROCESS_COMMAND_ARGS, SEMRESATTRS_PROCESS_OWNER, SEMRESATTRS_PROCESS_RUNTIME_NAME, SEMRESATTRS_PROCESS_RUNTIME_VERSION, SEMRESATTRS_PROCESS_RUNTIME_DESCRIPTION, SEMRESATTRS_SERVICE_NAME, SEMRESATTRS_SERVICE_NAMESPACE, SEMRESATTRS_SERVICE_INSTANCE_ID, SEMRESATTRS_SERVICE_VERSION, SEMRESATTRS_TELEMETRY_SDK_NAME, SEMRESATTRS_TELEMETRY_SDK_LANGUAGE, SEMRESATTRS_TELEMETRY_SDK_VERSION, SEMRESATTRS_TELEMETRY_AUTO_VERSION, SEMRESATTRS_WEBENGINE_NAME, SEMRESATTRS_WEBENGINE_VERSION, SEMRESATTRS_WEBENGINE_DESCRIPTION, SemanticResourceAttributes, TMP_CLOUDPROVIDERVALUES_ALIBABA_CLOUD, TMP_CLOUDPROVIDERVALUES_AWS, TMP_CLOUDPROVIDERVALUES_AZURE, TMP_CLOUDPROVIDERVALUES_GCP, CLOUDPROVIDERVALUES_ALIBABA_CLOUD, CLOUDPROVIDERVALUES_AWS, CLOUDPROVIDERVALUES_AZURE, CLOUDPROVIDERVALUES_GCP, CloudProviderValues, TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS, TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC, TMP_CLOUDPLATFORMVALUES_AWS_EC2, TMP_CLOUDPLATFORMVALUES_AWS_ECS, TMP_CLOUDPLATFORMVALUES_AWS_EKS, TMP_CLOUDPLATFORMVALUES_AWS_LAMBDA, TMP_CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK, TMP_CLOUDPLATFORMVALUES_AZURE_VM, TMP_CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES, TMP_CLOUDPLATFORMVALUES_AZURE_AKS, TMP_CLOUDPLATFORMVALUES_AZURE_FUNCTIONS, TMP_CLOUDPLATFORMVALUES_AZURE_APP_SERVICE, TMP_CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE, TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_RUN, TMP_CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE, TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS, TMP_CLOUDPLATFORMVALUES_GCP_APP_ENGINE, CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS, CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC, CLOUDPLATFORMVALUES_AWS_EC2, CLOUDPLATFORMVALUES_AWS_ECS, CLOUDPLATFORMVALUES_AWS_EKS, CLOUDPLATFORMVALUES_AWS_LAMBDA, CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK, CLOUDPLATFORMVALUES_AZURE_VM, CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES, CLOUDPLATFORMVALUES_AZURE_AKS, CLOUDPLATFORMVALUES_AZURE_FUNCTIONS, CLOUDPLATFORMVALUES_AZURE_APP_SERVICE, CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE, CLOUDPLATFORMVALUES_GCP_CLOUD_RUN, CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE, CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS, CLOUDPLATFORMVALUES_GCP_APP_ENGINE, CloudPlatformValues, TMP_AWSECSLAUNCHTYPEVALUES_EC2, TMP_AWSECSLAUNCHTYPEVALUES_FARGATE, AWSECSLAUNCHTYPEVALUES_EC2, AWSECSLAUNCHTYPEVALUES_FARGATE, AwsEcsLaunchtypeValues, TMP_HOSTARCHVALUES_AMD64, TMP_HOSTARCHVALUES_ARM32, TMP_HOSTARCHVALUES_ARM64, TMP_HOSTARCHVALUES_IA64, TMP_HOSTARCHVALUES_PPC32, TMP_HOSTARCHVALUES_PPC64, TMP_HOSTARCHVALUES_X86, HOSTARCHVALUES_AMD64, HOSTARCHVALUES_ARM32, HOSTARCHVALUES_ARM64, HOSTARCHVALUES_IA64, HOSTARCHVALUES_PPC32, HOSTARCHVALUES_PPC64, HOSTARCHVALUES_X86, HostArchValues, TMP_OSTYPEVALUES_WINDOWS, TMP_OSTYPEVALUES_LINUX, TMP_OSTYPEVALUES_DARWIN, TMP_OSTYPEVALUES_FREEBSD, TMP_OSTYPEVALUES_NETBSD, TMP_OSTYPEVALUES_OPENBSD, TMP_OSTYPEVALUES_DRAGONFLYBSD, TMP_OSTYPEVALUES_HPUX, TMP_OSTYPEVALUES_AIX, TMP_OSTYPEVALUES_SOLARIS, TMP_OSTYPEVALUES_Z_OS, OSTYPEVALUES_WINDOWS, OSTYPEVALUES_LINUX, OSTYPEVALUES_DARWIN, OSTYPEVALUES_FREEBSD, OSTYPEVALUES_NETBSD, OSTYPEVALUES_OPENBSD, OSTYPEVALUES_DRAGONFLYBSD, OSTYPEVALUES_HPUX, OSTYPEVALUES_AIX, OSTYPEVALUES_SOLARIS, OSTYPEVALUES_Z_OS, OsTypeValues, TMP_TELEMETRYSDKLANGUAGEVALUES_CPP, TMP_TELEMETRYSDKLANGUAGEVALUES_DOTNET, TMP_TELEMETRYSDKLANGUAGEVALUES_ERLANG, TMP_TELEMETRYSDKLANGUAGEVALUES_GO, TMP_TELEMETRYSDKLANGUAGEVALUES_JAVA, TMP_TELEMETRYSDKLANGUAGEVALUES_NODEJS, TMP_TELEMETRYSDKLANGUAGEVALUES_PHP, TMP_TELEMETRYSDKLANGUAGEVALUES_PYTHON, TMP_TELEMETRYSDKLANGUAGEVALUES_RUBY, TMP_TELEMETRYSDKLANGUAGEVALUES_WEBJS, TELEMETRYSDKLANGUAGEVALUES_CPP, TELEMETRYSDKLANGUAGEVALUES_DOTNET, TELEMETRYSDKLANGUAGEVALUES_ERLANG, TELEMETRYSDKLANGUAGEVALUES_GO, TELEMETRYSDKLANGUAGEVALUES_JAVA, TELEMETRYSDKLANGUAGEVALUES_NODEJS, TELEMETRYSDKLANGUAGEVALUES_PHP, TELEMETRYSDKLANGUAGEVALUES_PYTHON, TELEMETRYSDKLANGUAGEVALUES_RUBY, TELEMETRYSDKLANGUAGEVALUES_WEBJS, TelemetrySdkLanguageValues;
  var init_SemanticResourceAttributes = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/resource/SemanticResourceAttributes.js"() {
      init_utils3();
      TMP_CLOUD_PROVIDER = "cloud.provider";
      TMP_CLOUD_ACCOUNT_ID = "cloud.account.id";
      TMP_CLOUD_REGION = "cloud.region";
      TMP_CLOUD_AVAILABILITY_ZONE = "cloud.availability_zone";
      TMP_CLOUD_PLATFORM = "cloud.platform";
      TMP_AWS_ECS_CONTAINER_ARN = "aws.ecs.container.arn";
      TMP_AWS_ECS_CLUSTER_ARN = "aws.ecs.cluster.arn";
      TMP_AWS_ECS_LAUNCHTYPE = "aws.ecs.launchtype";
      TMP_AWS_ECS_TASK_ARN = "aws.ecs.task.arn";
      TMP_AWS_ECS_TASK_FAMILY = "aws.ecs.task.family";
      TMP_AWS_ECS_TASK_REVISION = "aws.ecs.task.revision";
      TMP_AWS_EKS_CLUSTER_ARN = "aws.eks.cluster.arn";
      TMP_AWS_LOG_GROUP_NAMES = "aws.log.group.names";
      TMP_AWS_LOG_GROUP_ARNS = "aws.log.group.arns";
      TMP_AWS_LOG_STREAM_NAMES = "aws.log.stream.names";
      TMP_AWS_LOG_STREAM_ARNS = "aws.log.stream.arns";
      TMP_CONTAINER_NAME = "container.name";
      TMP_CONTAINER_ID = "container.id";
      TMP_CONTAINER_RUNTIME = "container.runtime";
      TMP_CONTAINER_IMAGE_NAME = "container.image.name";
      TMP_CONTAINER_IMAGE_TAG = "container.image.tag";
      TMP_DEPLOYMENT_ENVIRONMENT = "deployment.environment";
      TMP_DEVICE_ID = "device.id";
      TMP_DEVICE_MODEL_IDENTIFIER = "device.model.identifier";
      TMP_DEVICE_MODEL_NAME = "device.model.name";
      TMP_FAAS_NAME = "faas.name";
      TMP_FAAS_ID = "faas.id";
      TMP_FAAS_VERSION = "faas.version";
      TMP_FAAS_INSTANCE = "faas.instance";
      TMP_FAAS_MAX_MEMORY = "faas.max_memory";
      TMP_HOST_ID = "host.id";
      TMP_HOST_NAME = "host.name";
      TMP_HOST_TYPE = "host.type";
      TMP_HOST_ARCH = "host.arch";
      TMP_HOST_IMAGE_NAME = "host.image.name";
      TMP_HOST_IMAGE_ID = "host.image.id";
      TMP_HOST_IMAGE_VERSION = "host.image.version";
      TMP_K8S_CLUSTER_NAME = "k8s.cluster.name";
      TMP_K8S_NODE_NAME = "k8s.node.name";
      TMP_K8S_NODE_UID = "k8s.node.uid";
      TMP_K8S_NAMESPACE_NAME = "k8s.namespace.name";
      TMP_K8S_POD_UID = "k8s.pod.uid";
      TMP_K8S_POD_NAME = "k8s.pod.name";
      TMP_K8S_CONTAINER_NAME = "k8s.container.name";
      TMP_K8S_REPLICASET_UID = "k8s.replicaset.uid";
      TMP_K8S_REPLICASET_NAME = "k8s.replicaset.name";
      TMP_K8S_DEPLOYMENT_UID = "k8s.deployment.uid";
      TMP_K8S_DEPLOYMENT_NAME = "k8s.deployment.name";
      TMP_K8S_STATEFULSET_UID = "k8s.statefulset.uid";
      TMP_K8S_STATEFULSET_NAME = "k8s.statefulset.name";
      TMP_K8S_DAEMONSET_UID = "k8s.daemonset.uid";
      TMP_K8S_DAEMONSET_NAME = "k8s.daemonset.name";
      TMP_K8S_JOB_UID = "k8s.job.uid";
      TMP_K8S_JOB_NAME = "k8s.job.name";
      TMP_K8S_CRONJOB_UID = "k8s.cronjob.uid";
      TMP_K8S_CRONJOB_NAME = "k8s.cronjob.name";
      TMP_OS_TYPE = "os.type";
      TMP_OS_DESCRIPTION = "os.description";
      TMP_OS_NAME = "os.name";
      TMP_OS_VERSION = "os.version";
      TMP_PROCESS_PID = "process.pid";
      TMP_PROCESS_EXECUTABLE_NAME = "process.executable.name";
      TMP_PROCESS_EXECUTABLE_PATH = "process.executable.path";
      TMP_PROCESS_COMMAND = "process.command";
      TMP_PROCESS_COMMAND_LINE = "process.command_line";
      TMP_PROCESS_COMMAND_ARGS = "process.command_args";
      TMP_PROCESS_OWNER = "process.owner";
      TMP_PROCESS_RUNTIME_NAME = "process.runtime.name";
      TMP_PROCESS_RUNTIME_VERSION = "process.runtime.version";
      TMP_PROCESS_RUNTIME_DESCRIPTION = "process.runtime.description";
      TMP_SERVICE_NAME = "service.name";
      TMP_SERVICE_NAMESPACE = "service.namespace";
      TMP_SERVICE_INSTANCE_ID = "service.instance.id";
      TMP_SERVICE_VERSION = "service.version";
      TMP_TELEMETRY_SDK_NAME = "telemetry.sdk.name";
      TMP_TELEMETRY_SDK_LANGUAGE = "telemetry.sdk.language";
      TMP_TELEMETRY_SDK_VERSION = "telemetry.sdk.version";
      TMP_TELEMETRY_AUTO_VERSION = "telemetry.auto.version";
      TMP_WEBENGINE_NAME = "webengine.name";
      TMP_WEBENGINE_VERSION = "webengine.version";
      TMP_WEBENGINE_DESCRIPTION = "webengine.description";
      SEMRESATTRS_CLOUD_PROVIDER = TMP_CLOUD_PROVIDER;
      SEMRESATTRS_CLOUD_ACCOUNT_ID = TMP_CLOUD_ACCOUNT_ID;
      SEMRESATTRS_CLOUD_REGION = TMP_CLOUD_REGION;
      SEMRESATTRS_CLOUD_AVAILABILITY_ZONE = TMP_CLOUD_AVAILABILITY_ZONE;
      SEMRESATTRS_CLOUD_PLATFORM = TMP_CLOUD_PLATFORM;
      SEMRESATTRS_AWS_ECS_CONTAINER_ARN = TMP_AWS_ECS_CONTAINER_ARN;
      SEMRESATTRS_AWS_ECS_CLUSTER_ARN = TMP_AWS_ECS_CLUSTER_ARN;
      SEMRESATTRS_AWS_ECS_LAUNCHTYPE = TMP_AWS_ECS_LAUNCHTYPE;
      SEMRESATTRS_AWS_ECS_TASK_ARN = TMP_AWS_ECS_TASK_ARN;
      SEMRESATTRS_AWS_ECS_TASK_FAMILY = TMP_AWS_ECS_TASK_FAMILY;
      SEMRESATTRS_AWS_ECS_TASK_REVISION = TMP_AWS_ECS_TASK_REVISION;
      SEMRESATTRS_AWS_EKS_CLUSTER_ARN = TMP_AWS_EKS_CLUSTER_ARN;
      SEMRESATTRS_AWS_LOG_GROUP_NAMES = TMP_AWS_LOG_GROUP_NAMES;
      SEMRESATTRS_AWS_LOG_GROUP_ARNS = TMP_AWS_LOG_GROUP_ARNS;
      SEMRESATTRS_AWS_LOG_STREAM_NAMES = TMP_AWS_LOG_STREAM_NAMES;
      SEMRESATTRS_AWS_LOG_STREAM_ARNS = TMP_AWS_LOG_STREAM_ARNS;
      SEMRESATTRS_CONTAINER_NAME = TMP_CONTAINER_NAME;
      SEMRESATTRS_CONTAINER_ID = TMP_CONTAINER_ID;
      SEMRESATTRS_CONTAINER_RUNTIME = TMP_CONTAINER_RUNTIME;
      SEMRESATTRS_CONTAINER_IMAGE_NAME = TMP_CONTAINER_IMAGE_NAME;
      SEMRESATTRS_CONTAINER_IMAGE_TAG = TMP_CONTAINER_IMAGE_TAG;
      SEMRESATTRS_DEPLOYMENT_ENVIRONMENT = TMP_DEPLOYMENT_ENVIRONMENT;
      SEMRESATTRS_DEVICE_ID = TMP_DEVICE_ID;
      SEMRESATTRS_DEVICE_MODEL_IDENTIFIER = TMP_DEVICE_MODEL_IDENTIFIER;
      SEMRESATTRS_DEVICE_MODEL_NAME = TMP_DEVICE_MODEL_NAME;
      SEMRESATTRS_FAAS_NAME = TMP_FAAS_NAME;
      SEMRESATTRS_FAAS_ID = TMP_FAAS_ID;
      SEMRESATTRS_FAAS_VERSION = TMP_FAAS_VERSION;
      SEMRESATTRS_FAAS_INSTANCE = TMP_FAAS_INSTANCE;
      SEMRESATTRS_FAAS_MAX_MEMORY = TMP_FAAS_MAX_MEMORY;
      SEMRESATTRS_HOST_ID = TMP_HOST_ID;
      SEMRESATTRS_HOST_NAME = TMP_HOST_NAME;
      SEMRESATTRS_HOST_TYPE = TMP_HOST_TYPE;
      SEMRESATTRS_HOST_ARCH = TMP_HOST_ARCH;
      SEMRESATTRS_HOST_IMAGE_NAME = TMP_HOST_IMAGE_NAME;
      SEMRESATTRS_HOST_IMAGE_ID = TMP_HOST_IMAGE_ID;
      SEMRESATTRS_HOST_IMAGE_VERSION = TMP_HOST_IMAGE_VERSION;
      SEMRESATTRS_K8S_CLUSTER_NAME = TMP_K8S_CLUSTER_NAME;
      SEMRESATTRS_K8S_NODE_NAME = TMP_K8S_NODE_NAME;
      SEMRESATTRS_K8S_NODE_UID = TMP_K8S_NODE_UID;
      SEMRESATTRS_K8S_NAMESPACE_NAME = TMP_K8S_NAMESPACE_NAME;
      SEMRESATTRS_K8S_POD_UID = TMP_K8S_POD_UID;
      SEMRESATTRS_K8S_POD_NAME = TMP_K8S_POD_NAME;
      SEMRESATTRS_K8S_CONTAINER_NAME = TMP_K8S_CONTAINER_NAME;
      SEMRESATTRS_K8S_REPLICASET_UID = TMP_K8S_REPLICASET_UID;
      SEMRESATTRS_K8S_REPLICASET_NAME = TMP_K8S_REPLICASET_NAME;
      SEMRESATTRS_K8S_DEPLOYMENT_UID = TMP_K8S_DEPLOYMENT_UID;
      SEMRESATTRS_K8S_DEPLOYMENT_NAME = TMP_K8S_DEPLOYMENT_NAME;
      SEMRESATTRS_K8S_STATEFULSET_UID = TMP_K8S_STATEFULSET_UID;
      SEMRESATTRS_K8S_STATEFULSET_NAME = TMP_K8S_STATEFULSET_NAME;
      SEMRESATTRS_K8S_DAEMONSET_UID = TMP_K8S_DAEMONSET_UID;
      SEMRESATTRS_K8S_DAEMONSET_NAME = TMP_K8S_DAEMONSET_NAME;
      SEMRESATTRS_K8S_JOB_UID = TMP_K8S_JOB_UID;
      SEMRESATTRS_K8S_JOB_NAME = TMP_K8S_JOB_NAME;
      SEMRESATTRS_K8S_CRONJOB_UID = TMP_K8S_CRONJOB_UID;
      SEMRESATTRS_K8S_CRONJOB_NAME = TMP_K8S_CRONJOB_NAME;
      SEMRESATTRS_OS_TYPE = TMP_OS_TYPE;
      SEMRESATTRS_OS_DESCRIPTION = TMP_OS_DESCRIPTION;
      SEMRESATTRS_OS_NAME = TMP_OS_NAME;
      SEMRESATTRS_OS_VERSION = TMP_OS_VERSION;
      SEMRESATTRS_PROCESS_PID = TMP_PROCESS_PID;
      SEMRESATTRS_PROCESS_EXECUTABLE_NAME = TMP_PROCESS_EXECUTABLE_NAME;
      SEMRESATTRS_PROCESS_EXECUTABLE_PATH = TMP_PROCESS_EXECUTABLE_PATH;
      SEMRESATTRS_PROCESS_COMMAND = TMP_PROCESS_COMMAND;
      SEMRESATTRS_PROCESS_COMMAND_LINE = TMP_PROCESS_COMMAND_LINE;
      SEMRESATTRS_PROCESS_COMMAND_ARGS = TMP_PROCESS_COMMAND_ARGS;
      SEMRESATTRS_PROCESS_OWNER = TMP_PROCESS_OWNER;
      SEMRESATTRS_PROCESS_RUNTIME_NAME = TMP_PROCESS_RUNTIME_NAME;
      SEMRESATTRS_PROCESS_RUNTIME_VERSION = TMP_PROCESS_RUNTIME_VERSION;
      SEMRESATTRS_PROCESS_RUNTIME_DESCRIPTION = TMP_PROCESS_RUNTIME_DESCRIPTION;
      SEMRESATTRS_SERVICE_NAME = TMP_SERVICE_NAME;
      SEMRESATTRS_SERVICE_NAMESPACE = TMP_SERVICE_NAMESPACE;
      SEMRESATTRS_SERVICE_INSTANCE_ID = TMP_SERVICE_INSTANCE_ID;
      SEMRESATTRS_SERVICE_VERSION = TMP_SERVICE_VERSION;
      SEMRESATTRS_TELEMETRY_SDK_NAME = TMP_TELEMETRY_SDK_NAME;
      SEMRESATTRS_TELEMETRY_SDK_LANGUAGE = TMP_TELEMETRY_SDK_LANGUAGE;
      SEMRESATTRS_TELEMETRY_SDK_VERSION = TMP_TELEMETRY_SDK_VERSION;
      SEMRESATTRS_TELEMETRY_AUTO_VERSION = TMP_TELEMETRY_AUTO_VERSION;
      SEMRESATTRS_WEBENGINE_NAME = TMP_WEBENGINE_NAME;
      SEMRESATTRS_WEBENGINE_VERSION = TMP_WEBENGINE_VERSION;
      SEMRESATTRS_WEBENGINE_DESCRIPTION = TMP_WEBENGINE_DESCRIPTION;
      SemanticResourceAttributes = /* @__PURE__ */ createConstMap([
        TMP_CLOUD_PROVIDER,
        TMP_CLOUD_ACCOUNT_ID,
        TMP_CLOUD_REGION,
        TMP_CLOUD_AVAILABILITY_ZONE,
        TMP_CLOUD_PLATFORM,
        TMP_AWS_ECS_CONTAINER_ARN,
        TMP_AWS_ECS_CLUSTER_ARN,
        TMP_AWS_ECS_LAUNCHTYPE,
        TMP_AWS_ECS_TASK_ARN,
        TMP_AWS_ECS_TASK_FAMILY,
        TMP_AWS_ECS_TASK_REVISION,
        TMP_AWS_EKS_CLUSTER_ARN,
        TMP_AWS_LOG_GROUP_NAMES,
        TMP_AWS_LOG_GROUP_ARNS,
        TMP_AWS_LOG_STREAM_NAMES,
        TMP_AWS_LOG_STREAM_ARNS,
        TMP_CONTAINER_NAME,
        TMP_CONTAINER_ID,
        TMP_CONTAINER_RUNTIME,
        TMP_CONTAINER_IMAGE_NAME,
        TMP_CONTAINER_IMAGE_TAG,
        TMP_DEPLOYMENT_ENVIRONMENT,
        TMP_DEVICE_ID,
        TMP_DEVICE_MODEL_IDENTIFIER,
        TMP_DEVICE_MODEL_NAME,
        TMP_FAAS_NAME,
        TMP_FAAS_ID,
        TMP_FAAS_VERSION,
        TMP_FAAS_INSTANCE,
        TMP_FAAS_MAX_MEMORY,
        TMP_HOST_ID,
        TMP_HOST_NAME,
        TMP_HOST_TYPE,
        TMP_HOST_ARCH,
        TMP_HOST_IMAGE_NAME,
        TMP_HOST_IMAGE_ID,
        TMP_HOST_IMAGE_VERSION,
        TMP_K8S_CLUSTER_NAME,
        TMP_K8S_NODE_NAME,
        TMP_K8S_NODE_UID,
        TMP_K8S_NAMESPACE_NAME,
        TMP_K8S_POD_UID,
        TMP_K8S_POD_NAME,
        TMP_K8S_CONTAINER_NAME,
        TMP_K8S_REPLICASET_UID,
        TMP_K8S_REPLICASET_NAME,
        TMP_K8S_DEPLOYMENT_UID,
        TMP_K8S_DEPLOYMENT_NAME,
        TMP_K8S_STATEFULSET_UID,
        TMP_K8S_STATEFULSET_NAME,
        TMP_K8S_DAEMONSET_UID,
        TMP_K8S_DAEMONSET_NAME,
        TMP_K8S_JOB_UID,
        TMP_K8S_JOB_NAME,
        TMP_K8S_CRONJOB_UID,
        TMP_K8S_CRONJOB_NAME,
        TMP_OS_TYPE,
        TMP_OS_DESCRIPTION,
        TMP_OS_NAME,
        TMP_OS_VERSION,
        TMP_PROCESS_PID,
        TMP_PROCESS_EXECUTABLE_NAME,
        TMP_PROCESS_EXECUTABLE_PATH,
        TMP_PROCESS_COMMAND,
        TMP_PROCESS_COMMAND_LINE,
        TMP_PROCESS_COMMAND_ARGS,
        TMP_PROCESS_OWNER,
        TMP_PROCESS_RUNTIME_NAME,
        TMP_PROCESS_RUNTIME_VERSION,
        TMP_PROCESS_RUNTIME_DESCRIPTION,
        TMP_SERVICE_NAME,
        TMP_SERVICE_NAMESPACE,
        TMP_SERVICE_INSTANCE_ID,
        TMP_SERVICE_VERSION,
        TMP_TELEMETRY_SDK_NAME,
        TMP_TELEMETRY_SDK_LANGUAGE,
        TMP_TELEMETRY_SDK_VERSION,
        TMP_TELEMETRY_AUTO_VERSION,
        TMP_WEBENGINE_NAME,
        TMP_WEBENGINE_VERSION,
        TMP_WEBENGINE_DESCRIPTION
      ]);
      TMP_CLOUDPROVIDERVALUES_ALIBABA_CLOUD = "alibaba_cloud";
      TMP_CLOUDPROVIDERVALUES_AWS = "aws";
      TMP_CLOUDPROVIDERVALUES_AZURE = "azure";
      TMP_CLOUDPROVIDERVALUES_GCP = "gcp";
      CLOUDPROVIDERVALUES_ALIBABA_CLOUD = TMP_CLOUDPROVIDERVALUES_ALIBABA_CLOUD;
      CLOUDPROVIDERVALUES_AWS = TMP_CLOUDPROVIDERVALUES_AWS;
      CLOUDPROVIDERVALUES_AZURE = TMP_CLOUDPROVIDERVALUES_AZURE;
      CLOUDPROVIDERVALUES_GCP = TMP_CLOUDPROVIDERVALUES_GCP;
      CloudProviderValues = /* @__PURE__ */ createConstMap([
        TMP_CLOUDPROVIDERVALUES_ALIBABA_CLOUD,
        TMP_CLOUDPROVIDERVALUES_AWS,
        TMP_CLOUDPROVIDERVALUES_AZURE,
        TMP_CLOUDPROVIDERVALUES_GCP
      ]);
      TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS = "alibaba_cloud_ecs";
      TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC = "alibaba_cloud_fc";
      TMP_CLOUDPLATFORMVALUES_AWS_EC2 = "aws_ec2";
      TMP_CLOUDPLATFORMVALUES_AWS_ECS = "aws_ecs";
      TMP_CLOUDPLATFORMVALUES_AWS_EKS = "aws_eks";
      TMP_CLOUDPLATFORMVALUES_AWS_LAMBDA = "aws_lambda";
      TMP_CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK = "aws_elastic_beanstalk";
      TMP_CLOUDPLATFORMVALUES_AZURE_VM = "azure_vm";
      TMP_CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES = "azure_container_instances";
      TMP_CLOUDPLATFORMVALUES_AZURE_AKS = "azure_aks";
      TMP_CLOUDPLATFORMVALUES_AZURE_FUNCTIONS = "azure_functions";
      TMP_CLOUDPLATFORMVALUES_AZURE_APP_SERVICE = "azure_app_service";
      TMP_CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE = "gcp_compute_engine";
      TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_RUN = "gcp_cloud_run";
      TMP_CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE = "gcp_kubernetes_engine";
      TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS = "gcp_cloud_functions";
      TMP_CLOUDPLATFORMVALUES_GCP_APP_ENGINE = "gcp_app_engine";
      CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS = TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS;
      CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC = TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC;
      CLOUDPLATFORMVALUES_AWS_EC2 = TMP_CLOUDPLATFORMVALUES_AWS_EC2;
      CLOUDPLATFORMVALUES_AWS_ECS = TMP_CLOUDPLATFORMVALUES_AWS_ECS;
      CLOUDPLATFORMVALUES_AWS_EKS = TMP_CLOUDPLATFORMVALUES_AWS_EKS;
      CLOUDPLATFORMVALUES_AWS_LAMBDA = TMP_CLOUDPLATFORMVALUES_AWS_LAMBDA;
      CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK = TMP_CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK;
      CLOUDPLATFORMVALUES_AZURE_VM = TMP_CLOUDPLATFORMVALUES_AZURE_VM;
      CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES = TMP_CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES;
      CLOUDPLATFORMVALUES_AZURE_AKS = TMP_CLOUDPLATFORMVALUES_AZURE_AKS;
      CLOUDPLATFORMVALUES_AZURE_FUNCTIONS = TMP_CLOUDPLATFORMVALUES_AZURE_FUNCTIONS;
      CLOUDPLATFORMVALUES_AZURE_APP_SERVICE = TMP_CLOUDPLATFORMVALUES_AZURE_APP_SERVICE;
      CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE = TMP_CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE;
      CLOUDPLATFORMVALUES_GCP_CLOUD_RUN = TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_RUN;
      CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE = TMP_CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE;
      CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS = TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS;
      CLOUDPLATFORMVALUES_GCP_APP_ENGINE = TMP_CLOUDPLATFORMVALUES_GCP_APP_ENGINE;
      CloudPlatformValues = /* @__PURE__ */ createConstMap([
        TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS,
        TMP_CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC,
        TMP_CLOUDPLATFORMVALUES_AWS_EC2,
        TMP_CLOUDPLATFORMVALUES_AWS_ECS,
        TMP_CLOUDPLATFORMVALUES_AWS_EKS,
        TMP_CLOUDPLATFORMVALUES_AWS_LAMBDA,
        TMP_CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK,
        TMP_CLOUDPLATFORMVALUES_AZURE_VM,
        TMP_CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES,
        TMP_CLOUDPLATFORMVALUES_AZURE_AKS,
        TMP_CLOUDPLATFORMVALUES_AZURE_FUNCTIONS,
        TMP_CLOUDPLATFORMVALUES_AZURE_APP_SERVICE,
        TMP_CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE,
        TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_RUN,
        TMP_CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE,
        TMP_CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS,
        TMP_CLOUDPLATFORMVALUES_GCP_APP_ENGINE
      ]);
      TMP_AWSECSLAUNCHTYPEVALUES_EC2 = "ec2";
      TMP_AWSECSLAUNCHTYPEVALUES_FARGATE = "fargate";
      AWSECSLAUNCHTYPEVALUES_EC2 = TMP_AWSECSLAUNCHTYPEVALUES_EC2;
      AWSECSLAUNCHTYPEVALUES_FARGATE = TMP_AWSECSLAUNCHTYPEVALUES_FARGATE;
      AwsEcsLaunchtypeValues = /* @__PURE__ */ createConstMap([
        TMP_AWSECSLAUNCHTYPEVALUES_EC2,
        TMP_AWSECSLAUNCHTYPEVALUES_FARGATE
      ]);
      TMP_HOSTARCHVALUES_AMD64 = "amd64";
      TMP_HOSTARCHVALUES_ARM32 = "arm32";
      TMP_HOSTARCHVALUES_ARM64 = "arm64";
      TMP_HOSTARCHVALUES_IA64 = "ia64";
      TMP_HOSTARCHVALUES_PPC32 = "ppc32";
      TMP_HOSTARCHVALUES_PPC64 = "ppc64";
      TMP_HOSTARCHVALUES_X86 = "x86";
      HOSTARCHVALUES_AMD64 = TMP_HOSTARCHVALUES_AMD64;
      HOSTARCHVALUES_ARM32 = TMP_HOSTARCHVALUES_ARM32;
      HOSTARCHVALUES_ARM64 = TMP_HOSTARCHVALUES_ARM64;
      HOSTARCHVALUES_IA64 = TMP_HOSTARCHVALUES_IA64;
      HOSTARCHVALUES_PPC32 = TMP_HOSTARCHVALUES_PPC32;
      HOSTARCHVALUES_PPC64 = TMP_HOSTARCHVALUES_PPC64;
      HOSTARCHVALUES_X86 = TMP_HOSTARCHVALUES_X86;
      HostArchValues = /* @__PURE__ */ createConstMap([
        TMP_HOSTARCHVALUES_AMD64,
        TMP_HOSTARCHVALUES_ARM32,
        TMP_HOSTARCHVALUES_ARM64,
        TMP_HOSTARCHVALUES_IA64,
        TMP_HOSTARCHVALUES_PPC32,
        TMP_HOSTARCHVALUES_PPC64,
        TMP_HOSTARCHVALUES_X86
      ]);
      TMP_OSTYPEVALUES_WINDOWS = "windows";
      TMP_OSTYPEVALUES_LINUX = "linux";
      TMP_OSTYPEVALUES_DARWIN = "darwin";
      TMP_OSTYPEVALUES_FREEBSD = "freebsd";
      TMP_OSTYPEVALUES_NETBSD = "netbsd";
      TMP_OSTYPEVALUES_OPENBSD = "openbsd";
      TMP_OSTYPEVALUES_DRAGONFLYBSD = "dragonflybsd";
      TMP_OSTYPEVALUES_HPUX = "hpux";
      TMP_OSTYPEVALUES_AIX = "aix";
      TMP_OSTYPEVALUES_SOLARIS = "solaris";
      TMP_OSTYPEVALUES_Z_OS = "z_os";
      OSTYPEVALUES_WINDOWS = TMP_OSTYPEVALUES_WINDOWS;
      OSTYPEVALUES_LINUX = TMP_OSTYPEVALUES_LINUX;
      OSTYPEVALUES_DARWIN = TMP_OSTYPEVALUES_DARWIN;
      OSTYPEVALUES_FREEBSD = TMP_OSTYPEVALUES_FREEBSD;
      OSTYPEVALUES_NETBSD = TMP_OSTYPEVALUES_NETBSD;
      OSTYPEVALUES_OPENBSD = TMP_OSTYPEVALUES_OPENBSD;
      OSTYPEVALUES_DRAGONFLYBSD = TMP_OSTYPEVALUES_DRAGONFLYBSD;
      OSTYPEVALUES_HPUX = TMP_OSTYPEVALUES_HPUX;
      OSTYPEVALUES_AIX = TMP_OSTYPEVALUES_AIX;
      OSTYPEVALUES_SOLARIS = TMP_OSTYPEVALUES_SOLARIS;
      OSTYPEVALUES_Z_OS = TMP_OSTYPEVALUES_Z_OS;
      OsTypeValues = /* @__PURE__ */ createConstMap([
        TMP_OSTYPEVALUES_WINDOWS,
        TMP_OSTYPEVALUES_LINUX,
        TMP_OSTYPEVALUES_DARWIN,
        TMP_OSTYPEVALUES_FREEBSD,
        TMP_OSTYPEVALUES_NETBSD,
        TMP_OSTYPEVALUES_OPENBSD,
        TMP_OSTYPEVALUES_DRAGONFLYBSD,
        TMP_OSTYPEVALUES_HPUX,
        TMP_OSTYPEVALUES_AIX,
        TMP_OSTYPEVALUES_SOLARIS,
        TMP_OSTYPEVALUES_Z_OS
      ]);
      TMP_TELEMETRYSDKLANGUAGEVALUES_CPP = "cpp";
      TMP_TELEMETRYSDKLANGUAGEVALUES_DOTNET = "dotnet";
      TMP_TELEMETRYSDKLANGUAGEVALUES_ERLANG = "erlang";
      TMP_TELEMETRYSDKLANGUAGEVALUES_GO = "go";
      TMP_TELEMETRYSDKLANGUAGEVALUES_JAVA = "java";
      TMP_TELEMETRYSDKLANGUAGEVALUES_NODEJS = "nodejs";
      TMP_TELEMETRYSDKLANGUAGEVALUES_PHP = "php";
      TMP_TELEMETRYSDKLANGUAGEVALUES_PYTHON = "python";
      TMP_TELEMETRYSDKLANGUAGEVALUES_RUBY = "ruby";
      TMP_TELEMETRYSDKLANGUAGEVALUES_WEBJS = "webjs";
      TELEMETRYSDKLANGUAGEVALUES_CPP = TMP_TELEMETRYSDKLANGUAGEVALUES_CPP;
      TELEMETRYSDKLANGUAGEVALUES_DOTNET = TMP_TELEMETRYSDKLANGUAGEVALUES_DOTNET;
      TELEMETRYSDKLANGUAGEVALUES_ERLANG = TMP_TELEMETRYSDKLANGUAGEVALUES_ERLANG;
      TELEMETRYSDKLANGUAGEVALUES_GO = TMP_TELEMETRYSDKLANGUAGEVALUES_GO;
      TELEMETRYSDKLANGUAGEVALUES_JAVA = TMP_TELEMETRYSDKLANGUAGEVALUES_JAVA;
      TELEMETRYSDKLANGUAGEVALUES_NODEJS = TMP_TELEMETRYSDKLANGUAGEVALUES_NODEJS;
      TELEMETRYSDKLANGUAGEVALUES_PHP = TMP_TELEMETRYSDKLANGUAGEVALUES_PHP;
      TELEMETRYSDKLANGUAGEVALUES_PYTHON = TMP_TELEMETRYSDKLANGUAGEVALUES_PYTHON;
      TELEMETRYSDKLANGUAGEVALUES_RUBY = TMP_TELEMETRYSDKLANGUAGEVALUES_RUBY;
      TELEMETRYSDKLANGUAGEVALUES_WEBJS = TMP_TELEMETRYSDKLANGUAGEVALUES_WEBJS;
      TelemetrySdkLanguageValues = /* @__PURE__ */ createConstMap([
        TMP_TELEMETRYSDKLANGUAGEVALUES_CPP,
        TMP_TELEMETRYSDKLANGUAGEVALUES_DOTNET,
        TMP_TELEMETRYSDKLANGUAGEVALUES_ERLANG,
        TMP_TELEMETRYSDKLANGUAGEVALUES_GO,
        TMP_TELEMETRYSDKLANGUAGEVALUES_JAVA,
        TMP_TELEMETRYSDKLANGUAGEVALUES_NODEJS,
        TMP_TELEMETRYSDKLANGUAGEVALUES_PHP,
        TMP_TELEMETRYSDKLANGUAGEVALUES_PYTHON,
        TMP_TELEMETRYSDKLANGUAGEVALUES_RUBY,
        TMP_TELEMETRYSDKLANGUAGEVALUES_WEBJS
      ]);
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/resource/index.js
  var init_resource = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/resource/index.js"() {
      init_SemanticResourceAttributes();
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/stable_attributes.js
  var ATTR_ASPNETCORE_RATE_LIMITING_RESULT, ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ACQUIRED, ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ENDPOINT_LIMITER, ASPNETCORE_RATE_LIMITING_RESULT_VALUE_GLOBAL_LIMITER, ASPNETCORE_RATE_LIMITING_RESULT_VALUE_REQUEST_CANCELED, ATTR_TELEMETRY_SDK_LANGUAGE, TELEMETRY_SDK_LANGUAGE_VALUE_CPP, TELEMETRY_SDK_LANGUAGE_VALUE_DOTNET, TELEMETRY_SDK_LANGUAGE_VALUE_ERLANG, TELEMETRY_SDK_LANGUAGE_VALUE_GO, TELEMETRY_SDK_LANGUAGE_VALUE_JAVA, TELEMETRY_SDK_LANGUAGE_VALUE_NODEJS, TELEMETRY_SDK_LANGUAGE_VALUE_PHP, TELEMETRY_SDK_LANGUAGE_VALUE_PYTHON, TELEMETRY_SDK_LANGUAGE_VALUE_RUBY, TELEMETRY_SDK_LANGUAGE_VALUE_RUST, TELEMETRY_SDK_LANGUAGE_VALUE_SWIFT, TELEMETRY_SDK_LANGUAGE_VALUE_WEBJS, ATTR_TELEMETRY_SDK_NAME, ATTR_TELEMETRY_SDK_VERSION, ATTR_ASPNETCORE_DIAGNOSTICS_HANDLER_TYPE, ATTR_ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT, ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_ABORTED, ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_HANDLED, ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_SKIPPED, ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_UNHANDLED, ATTR_ASPNETCORE_RATE_LIMITING_POLICY, ATTR_ASPNETCORE_REQUEST_IS_UNHANDLED, ATTR_ASPNETCORE_ROUTING_IS_FALLBACK, ATTR_ASPNETCORE_ROUTING_MATCH_STATUS, ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_FAILURE, ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_SUCCESS, ATTR_CLIENT_ADDRESS, ATTR_CLIENT_PORT, ATTR_ERROR_TYPE, ERROR_TYPE_VALUE_OTHER, ATTR_EXCEPTION_ESCAPED, ATTR_EXCEPTION_MESSAGE, ATTR_EXCEPTION_STACKTRACE, ATTR_EXCEPTION_TYPE, ATTR_HTTP_REQUEST_HEADER, ATTR_HTTP_REQUEST_METHOD, HTTP_REQUEST_METHOD_VALUE_OTHER, HTTP_REQUEST_METHOD_VALUE_CONNECT, HTTP_REQUEST_METHOD_VALUE_DELETE, HTTP_REQUEST_METHOD_VALUE_GET, HTTP_REQUEST_METHOD_VALUE_HEAD, HTTP_REQUEST_METHOD_VALUE_OPTIONS, HTTP_REQUEST_METHOD_VALUE_PATCH, HTTP_REQUEST_METHOD_VALUE_POST, HTTP_REQUEST_METHOD_VALUE_PUT, HTTP_REQUEST_METHOD_VALUE_TRACE, ATTR_HTTP_REQUEST_METHOD_ORIGINAL, ATTR_HTTP_REQUEST_RESEND_COUNT, ATTR_HTTP_RESPONSE_HEADER, ATTR_HTTP_RESPONSE_STATUS_CODE, ATTR_HTTP_ROUTE, ATTR_JVM_GC_ACTION, ATTR_JVM_GC_NAME, ATTR_JVM_MEMORY_POOL_NAME, ATTR_JVM_MEMORY_TYPE, JVM_MEMORY_TYPE_VALUE_HEAP, JVM_MEMORY_TYPE_VALUE_NON_HEAP, ATTR_JVM_THREAD_DAEMON, ATTR_JVM_THREAD_STATE, JVM_THREAD_STATE_VALUE_BLOCKED, JVM_THREAD_STATE_VALUE_NEW, JVM_THREAD_STATE_VALUE_RUNNABLE, JVM_THREAD_STATE_VALUE_TERMINATED, JVM_THREAD_STATE_VALUE_TIMED_WAITING, JVM_THREAD_STATE_VALUE_WAITING, ATTR_NETWORK_LOCAL_ADDRESS, ATTR_NETWORK_LOCAL_PORT, ATTR_NETWORK_PEER_ADDRESS, ATTR_NETWORK_PEER_PORT, ATTR_NETWORK_PROTOCOL_NAME, ATTR_NETWORK_PROTOCOL_VERSION, ATTR_NETWORK_TRANSPORT, NETWORK_TRANSPORT_VALUE_PIPE, NETWORK_TRANSPORT_VALUE_QUIC, NETWORK_TRANSPORT_VALUE_TCP, NETWORK_TRANSPORT_VALUE_UDP, NETWORK_TRANSPORT_VALUE_UNIX, ATTR_NETWORK_TYPE, NETWORK_TYPE_VALUE_IPV4, NETWORK_TYPE_VALUE_IPV6, ATTR_OTEL_SCOPE_NAME, ATTR_OTEL_SCOPE_VERSION, ATTR_OTEL_STATUS_CODE, OTEL_STATUS_CODE_VALUE_ERROR, OTEL_STATUS_CODE_VALUE_OK, ATTR_OTEL_STATUS_DESCRIPTION, ATTR_SERVER_ADDRESS, ATTR_SERVER_PORT, ATTR_SERVICE_NAME, ATTR_SERVICE_VERSION, ATTR_SIGNALR_CONNECTION_STATUS, SIGNALR_CONNECTION_STATUS_VALUE_APP_SHUTDOWN, SIGNALR_CONNECTION_STATUS_VALUE_NORMAL_CLOSURE, SIGNALR_CONNECTION_STATUS_VALUE_TIMEOUT, ATTR_SIGNALR_TRANSPORT, SIGNALR_TRANSPORT_VALUE_LONG_POLLING, SIGNALR_TRANSPORT_VALUE_SERVER_SENT_EVENTS, SIGNALR_TRANSPORT_VALUE_WEB_SOCKETS, ATTR_URL_FRAGMENT, ATTR_URL_FULL, ATTR_URL_PATH, ATTR_URL_QUERY, ATTR_URL_SCHEME, ATTR_USER_AGENT_ORIGINAL;
  var init_stable_attributes = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/stable_attributes.js"() {
      ATTR_ASPNETCORE_RATE_LIMITING_RESULT = "aspnetcore.rate_limiting.result";
      ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ACQUIRED = "acquired";
      ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ENDPOINT_LIMITER = "endpoint_limiter";
      ASPNETCORE_RATE_LIMITING_RESULT_VALUE_GLOBAL_LIMITER = "global_limiter";
      ASPNETCORE_RATE_LIMITING_RESULT_VALUE_REQUEST_CANCELED = "request_canceled";
      ATTR_TELEMETRY_SDK_LANGUAGE = "telemetry.sdk.language";
      TELEMETRY_SDK_LANGUAGE_VALUE_CPP = "cpp";
      TELEMETRY_SDK_LANGUAGE_VALUE_DOTNET = "dotnet";
      TELEMETRY_SDK_LANGUAGE_VALUE_ERLANG = "erlang";
      TELEMETRY_SDK_LANGUAGE_VALUE_GO = "go";
      TELEMETRY_SDK_LANGUAGE_VALUE_JAVA = "java";
      TELEMETRY_SDK_LANGUAGE_VALUE_NODEJS = "nodejs";
      TELEMETRY_SDK_LANGUAGE_VALUE_PHP = "php";
      TELEMETRY_SDK_LANGUAGE_VALUE_PYTHON = "python";
      TELEMETRY_SDK_LANGUAGE_VALUE_RUBY = "ruby";
      TELEMETRY_SDK_LANGUAGE_VALUE_RUST = "rust";
      TELEMETRY_SDK_LANGUAGE_VALUE_SWIFT = "swift";
      TELEMETRY_SDK_LANGUAGE_VALUE_WEBJS = "webjs";
      ATTR_TELEMETRY_SDK_NAME = "telemetry.sdk.name";
      ATTR_TELEMETRY_SDK_VERSION = "telemetry.sdk.version";
      ATTR_ASPNETCORE_DIAGNOSTICS_HANDLER_TYPE = "aspnetcore.diagnostics.handler.type";
      ATTR_ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT = "aspnetcore.diagnostics.exception.result";
      ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_ABORTED = "aborted";
      ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_HANDLED = "handled";
      ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_SKIPPED = "skipped";
      ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_UNHANDLED = "unhandled";
      ATTR_ASPNETCORE_RATE_LIMITING_POLICY = "aspnetcore.rate_limiting.policy";
      ATTR_ASPNETCORE_REQUEST_IS_UNHANDLED = "aspnetcore.request.is_unhandled";
      ATTR_ASPNETCORE_ROUTING_IS_FALLBACK = "aspnetcore.routing.is_fallback";
      ATTR_ASPNETCORE_ROUTING_MATCH_STATUS = "aspnetcore.routing.match_status";
      ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_FAILURE = "failure";
      ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_SUCCESS = "success";
      ATTR_CLIENT_ADDRESS = "client.address";
      ATTR_CLIENT_PORT = "client.port";
      ATTR_ERROR_TYPE = "error.type";
      ERROR_TYPE_VALUE_OTHER = "_OTHER";
      ATTR_EXCEPTION_ESCAPED = "exception.escaped";
      ATTR_EXCEPTION_MESSAGE = "exception.message";
      ATTR_EXCEPTION_STACKTRACE = "exception.stacktrace";
      ATTR_EXCEPTION_TYPE = "exception.type";
      ATTR_HTTP_REQUEST_HEADER = function(key) {
        return "http.request.header." + key;
      };
      ATTR_HTTP_REQUEST_METHOD = "http.request.method";
      HTTP_REQUEST_METHOD_VALUE_OTHER = "_OTHER";
      HTTP_REQUEST_METHOD_VALUE_CONNECT = "CONNECT";
      HTTP_REQUEST_METHOD_VALUE_DELETE = "DELETE";
      HTTP_REQUEST_METHOD_VALUE_GET = "GET";
      HTTP_REQUEST_METHOD_VALUE_HEAD = "HEAD";
      HTTP_REQUEST_METHOD_VALUE_OPTIONS = "OPTIONS";
      HTTP_REQUEST_METHOD_VALUE_PATCH = "PATCH";
      HTTP_REQUEST_METHOD_VALUE_POST = "POST";
      HTTP_REQUEST_METHOD_VALUE_PUT = "PUT";
      HTTP_REQUEST_METHOD_VALUE_TRACE = "TRACE";
      ATTR_HTTP_REQUEST_METHOD_ORIGINAL = "http.request.method_original";
      ATTR_HTTP_REQUEST_RESEND_COUNT = "http.request.resend_count";
      ATTR_HTTP_RESPONSE_HEADER = function(key) {
        return "http.response.header." + key;
      };
      ATTR_HTTP_RESPONSE_STATUS_CODE = "http.response.status_code";
      ATTR_HTTP_ROUTE = "http.route";
      ATTR_JVM_GC_ACTION = "jvm.gc.action";
      ATTR_JVM_GC_NAME = "jvm.gc.name";
      ATTR_JVM_MEMORY_POOL_NAME = "jvm.memory.pool.name";
      ATTR_JVM_MEMORY_TYPE = "jvm.memory.type";
      JVM_MEMORY_TYPE_VALUE_HEAP = "heap";
      JVM_MEMORY_TYPE_VALUE_NON_HEAP = "non_heap";
      ATTR_JVM_THREAD_DAEMON = "jvm.thread.daemon";
      ATTR_JVM_THREAD_STATE = "jvm.thread.state";
      JVM_THREAD_STATE_VALUE_BLOCKED = "blocked";
      JVM_THREAD_STATE_VALUE_NEW = "new";
      JVM_THREAD_STATE_VALUE_RUNNABLE = "runnable";
      JVM_THREAD_STATE_VALUE_TERMINATED = "terminated";
      JVM_THREAD_STATE_VALUE_TIMED_WAITING = "timed_waiting";
      JVM_THREAD_STATE_VALUE_WAITING = "waiting";
      ATTR_NETWORK_LOCAL_ADDRESS = "network.local.address";
      ATTR_NETWORK_LOCAL_PORT = "network.local.port";
      ATTR_NETWORK_PEER_ADDRESS = "network.peer.address";
      ATTR_NETWORK_PEER_PORT = "network.peer.port";
      ATTR_NETWORK_PROTOCOL_NAME = "network.protocol.name";
      ATTR_NETWORK_PROTOCOL_VERSION = "network.protocol.version";
      ATTR_NETWORK_TRANSPORT = "network.transport";
      NETWORK_TRANSPORT_VALUE_PIPE = "pipe";
      NETWORK_TRANSPORT_VALUE_QUIC = "quic";
      NETWORK_TRANSPORT_VALUE_TCP = "tcp";
      NETWORK_TRANSPORT_VALUE_UDP = "udp";
      NETWORK_TRANSPORT_VALUE_UNIX = "unix";
      ATTR_NETWORK_TYPE = "network.type";
      NETWORK_TYPE_VALUE_IPV4 = "ipv4";
      NETWORK_TYPE_VALUE_IPV6 = "ipv6";
      ATTR_OTEL_SCOPE_NAME = "otel.scope.name";
      ATTR_OTEL_SCOPE_VERSION = "otel.scope.version";
      ATTR_OTEL_STATUS_CODE = "otel.status_code";
      OTEL_STATUS_CODE_VALUE_ERROR = "ERROR";
      OTEL_STATUS_CODE_VALUE_OK = "OK";
      ATTR_OTEL_STATUS_DESCRIPTION = "otel.status_description";
      ATTR_SERVER_ADDRESS = "server.address";
      ATTR_SERVER_PORT = "server.port";
      ATTR_SERVICE_NAME = "service.name";
      ATTR_SERVICE_VERSION = "service.version";
      ATTR_SIGNALR_CONNECTION_STATUS = "signalr.connection.status";
      SIGNALR_CONNECTION_STATUS_VALUE_APP_SHUTDOWN = "app_shutdown";
      SIGNALR_CONNECTION_STATUS_VALUE_NORMAL_CLOSURE = "normal_closure";
      SIGNALR_CONNECTION_STATUS_VALUE_TIMEOUT = "timeout";
      ATTR_SIGNALR_TRANSPORT = "signalr.transport";
      SIGNALR_TRANSPORT_VALUE_LONG_POLLING = "long_polling";
      SIGNALR_TRANSPORT_VALUE_SERVER_SENT_EVENTS = "server_sent_events";
      SIGNALR_TRANSPORT_VALUE_WEB_SOCKETS = "web_sockets";
      ATTR_URL_FRAGMENT = "url.fragment";
      ATTR_URL_FULL = "url.full";
      ATTR_URL_PATH = "url.path";
      ATTR_URL_QUERY = "url.query";
      ATTR_URL_SCHEME = "url.scheme";
      ATTR_USER_AGENT_ORIGINAL = "user_agent.original";
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/stable_metrics.js
  var METRIC_ASPNETCORE_DIAGNOSTICS_EXCEPTIONS, METRIC_ASPNETCORE_RATE_LIMITING_ACTIVE_REQUEST_LEASES, METRIC_ASPNETCORE_RATE_LIMITING_QUEUED_REQUESTS, METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_TIME_IN_QUEUE, METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_LEASE_DURATION, METRIC_ASPNETCORE_RATE_LIMITING_REQUESTS, METRIC_ASPNETCORE_ROUTING_MATCH_ATTEMPTS, METRIC_HTTP_CLIENT_REQUEST_DURATION, METRIC_HTTP_SERVER_REQUEST_DURATION, METRIC_JVM_CLASS_COUNT, METRIC_JVM_CLASS_LOADED, METRIC_JVM_CLASS_UNLOADED, METRIC_JVM_CPU_COUNT, METRIC_JVM_CPU_RECENT_UTILIZATION, METRIC_JVM_CPU_TIME, METRIC_JVM_GC_DURATION, METRIC_JVM_MEMORY_COMMITTED, METRIC_JVM_MEMORY_LIMIT, METRIC_JVM_MEMORY_USED, METRIC_JVM_MEMORY_USED_AFTER_LAST_GC, METRIC_JVM_THREAD_COUNT, METRIC_KESTREL_ACTIVE_CONNECTIONS, METRIC_KESTREL_ACTIVE_TLS_HANDSHAKES, METRIC_KESTREL_CONNECTION_DURATION, METRIC_KESTREL_QUEUED_CONNECTIONS, METRIC_KESTREL_QUEUED_REQUESTS, METRIC_KESTREL_REJECTED_CONNECTIONS, METRIC_KESTREL_TLS_HANDSHAKE_DURATION, METRIC_KESTREL_UPGRADED_CONNECTIONS, METRIC_SIGNALR_SERVER_ACTIVE_CONNECTIONS, METRIC_SIGNALR_SERVER_CONNECTION_DURATION;
  var init_stable_metrics = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/stable_metrics.js"() {
      METRIC_ASPNETCORE_DIAGNOSTICS_EXCEPTIONS = "aspnetcore.diagnostics.exceptions";
      METRIC_ASPNETCORE_RATE_LIMITING_ACTIVE_REQUEST_LEASES = "aspnetcore.rate_limiting.active_request_leases";
      METRIC_ASPNETCORE_RATE_LIMITING_QUEUED_REQUESTS = "aspnetcore.rate_limiting.queued_requests";
      METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_TIME_IN_QUEUE = "aspnetcore.rate_limiting.request.time_in_queue";
      METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_LEASE_DURATION = "aspnetcore.rate_limiting.request_lease.duration";
      METRIC_ASPNETCORE_RATE_LIMITING_REQUESTS = "aspnetcore.rate_limiting.requests";
      METRIC_ASPNETCORE_ROUTING_MATCH_ATTEMPTS = "aspnetcore.routing.match_attempts";
      METRIC_HTTP_CLIENT_REQUEST_DURATION = "http.client.request.duration";
      METRIC_HTTP_SERVER_REQUEST_DURATION = "http.server.request.duration";
      METRIC_JVM_CLASS_COUNT = "jvm.class.count";
      METRIC_JVM_CLASS_LOADED = "jvm.class.loaded";
      METRIC_JVM_CLASS_UNLOADED = "jvm.class.unloaded";
      METRIC_JVM_CPU_COUNT = "jvm.cpu.count";
      METRIC_JVM_CPU_RECENT_UTILIZATION = "jvm.cpu.recent_utilization";
      METRIC_JVM_CPU_TIME = "jvm.cpu.time";
      METRIC_JVM_GC_DURATION = "jvm.gc.duration";
      METRIC_JVM_MEMORY_COMMITTED = "jvm.memory.committed";
      METRIC_JVM_MEMORY_LIMIT = "jvm.memory.limit";
      METRIC_JVM_MEMORY_USED = "jvm.memory.used";
      METRIC_JVM_MEMORY_USED_AFTER_LAST_GC = "jvm.memory.used_after_last_gc";
      METRIC_JVM_THREAD_COUNT = "jvm.thread.count";
      METRIC_KESTREL_ACTIVE_CONNECTIONS = "kestrel.active_connections";
      METRIC_KESTREL_ACTIVE_TLS_HANDSHAKES = "kestrel.active_tls_handshakes";
      METRIC_KESTREL_CONNECTION_DURATION = "kestrel.connection.duration";
      METRIC_KESTREL_QUEUED_CONNECTIONS = "kestrel.queued_connections";
      METRIC_KESTREL_QUEUED_REQUESTS = "kestrel.queued_requests";
      METRIC_KESTREL_REJECTED_CONNECTIONS = "kestrel.rejected_connections";
      METRIC_KESTREL_TLS_HANDSHAKE_DURATION = "kestrel.tls_handshake.duration";
      METRIC_KESTREL_UPGRADED_CONNECTIONS = "kestrel.upgraded_connections";
      METRIC_SIGNALR_SERVER_ACTIVE_CONNECTIONS = "signalr.server.active_connections";
      METRIC_SIGNALR_SERVER_CONNECTION_DURATION = "signalr.server.connection.duration";
    }
  });

  // node_modules/@opentelemetry/semantic-conventions/build/esm/index.js
  var esm_exports2 = {};
  __export(esm_exports2, {
    ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_ABORTED: () => ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_ABORTED,
    ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_HANDLED: () => ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_HANDLED,
    ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_SKIPPED: () => ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_SKIPPED,
    ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_UNHANDLED: () => ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT_VALUE_UNHANDLED,
    ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ACQUIRED: () => ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ACQUIRED,
    ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ENDPOINT_LIMITER: () => ASPNETCORE_RATE_LIMITING_RESULT_VALUE_ENDPOINT_LIMITER,
    ASPNETCORE_RATE_LIMITING_RESULT_VALUE_GLOBAL_LIMITER: () => ASPNETCORE_RATE_LIMITING_RESULT_VALUE_GLOBAL_LIMITER,
    ASPNETCORE_RATE_LIMITING_RESULT_VALUE_REQUEST_CANCELED: () => ASPNETCORE_RATE_LIMITING_RESULT_VALUE_REQUEST_CANCELED,
    ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_FAILURE: () => ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_FAILURE,
    ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_SUCCESS: () => ASPNETCORE_ROUTING_MATCH_STATUS_VALUE_SUCCESS,
    ATTR_ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT: () => ATTR_ASPNETCORE_DIAGNOSTICS_EXCEPTION_RESULT,
    ATTR_ASPNETCORE_DIAGNOSTICS_HANDLER_TYPE: () => ATTR_ASPNETCORE_DIAGNOSTICS_HANDLER_TYPE,
    ATTR_ASPNETCORE_RATE_LIMITING_POLICY: () => ATTR_ASPNETCORE_RATE_LIMITING_POLICY,
    ATTR_ASPNETCORE_RATE_LIMITING_RESULT: () => ATTR_ASPNETCORE_RATE_LIMITING_RESULT,
    ATTR_ASPNETCORE_REQUEST_IS_UNHANDLED: () => ATTR_ASPNETCORE_REQUEST_IS_UNHANDLED,
    ATTR_ASPNETCORE_ROUTING_IS_FALLBACK: () => ATTR_ASPNETCORE_ROUTING_IS_FALLBACK,
    ATTR_ASPNETCORE_ROUTING_MATCH_STATUS: () => ATTR_ASPNETCORE_ROUTING_MATCH_STATUS,
    ATTR_CLIENT_ADDRESS: () => ATTR_CLIENT_ADDRESS,
    ATTR_CLIENT_PORT: () => ATTR_CLIENT_PORT,
    ATTR_ERROR_TYPE: () => ATTR_ERROR_TYPE,
    ATTR_EXCEPTION_ESCAPED: () => ATTR_EXCEPTION_ESCAPED,
    ATTR_EXCEPTION_MESSAGE: () => ATTR_EXCEPTION_MESSAGE,
    ATTR_EXCEPTION_STACKTRACE: () => ATTR_EXCEPTION_STACKTRACE,
    ATTR_EXCEPTION_TYPE: () => ATTR_EXCEPTION_TYPE,
    ATTR_HTTP_REQUEST_HEADER: () => ATTR_HTTP_REQUEST_HEADER,
    ATTR_HTTP_REQUEST_METHOD: () => ATTR_HTTP_REQUEST_METHOD,
    ATTR_HTTP_REQUEST_METHOD_ORIGINAL: () => ATTR_HTTP_REQUEST_METHOD_ORIGINAL,
    ATTR_HTTP_REQUEST_RESEND_COUNT: () => ATTR_HTTP_REQUEST_RESEND_COUNT,
    ATTR_HTTP_RESPONSE_HEADER: () => ATTR_HTTP_RESPONSE_HEADER,
    ATTR_HTTP_RESPONSE_STATUS_CODE: () => ATTR_HTTP_RESPONSE_STATUS_CODE,
    ATTR_HTTP_ROUTE: () => ATTR_HTTP_ROUTE,
    ATTR_JVM_GC_ACTION: () => ATTR_JVM_GC_ACTION,
    ATTR_JVM_GC_NAME: () => ATTR_JVM_GC_NAME,
    ATTR_JVM_MEMORY_POOL_NAME: () => ATTR_JVM_MEMORY_POOL_NAME,
    ATTR_JVM_MEMORY_TYPE: () => ATTR_JVM_MEMORY_TYPE,
    ATTR_JVM_THREAD_DAEMON: () => ATTR_JVM_THREAD_DAEMON,
    ATTR_JVM_THREAD_STATE: () => ATTR_JVM_THREAD_STATE,
    ATTR_NETWORK_LOCAL_ADDRESS: () => ATTR_NETWORK_LOCAL_ADDRESS,
    ATTR_NETWORK_LOCAL_PORT: () => ATTR_NETWORK_LOCAL_PORT,
    ATTR_NETWORK_PEER_ADDRESS: () => ATTR_NETWORK_PEER_ADDRESS,
    ATTR_NETWORK_PEER_PORT: () => ATTR_NETWORK_PEER_PORT,
    ATTR_NETWORK_PROTOCOL_NAME: () => ATTR_NETWORK_PROTOCOL_NAME,
    ATTR_NETWORK_PROTOCOL_VERSION: () => ATTR_NETWORK_PROTOCOL_VERSION,
    ATTR_NETWORK_TRANSPORT: () => ATTR_NETWORK_TRANSPORT,
    ATTR_NETWORK_TYPE: () => ATTR_NETWORK_TYPE,
    ATTR_OTEL_SCOPE_NAME: () => ATTR_OTEL_SCOPE_NAME,
    ATTR_OTEL_SCOPE_VERSION: () => ATTR_OTEL_SCOPE_VERSION,
    ATTR_OTEL_STATUS_CODE: () => ATTR_OTEL_STATUS_CODE,
    ATTR_OTEL_STATUS_DESCRIPTION: () => ATTR_OTEL_STATUS_DESCRIPTION,
    ATTR_SERVER_ADDRESS: () => ATTR_SERVER_ADDRESS,
    ATTR_SERVER_PORT: () => ATTR_SERVER_PORT,
    ATTR_SERVICE_NAME: () => ATTR_SERVICE_NAME,
    ATTR_SERVICE_VERSION: () => ATTR_SERVICE_VERSION,
    ATTR_SIGNALR_CONNECTION_STATUS: () => ATTR_SIGNALR_CONNECTION_STATUS,
    ATTR_SIGNALR_TRANSPORT: () => ATTR_SIGNALR_TRANSPORT,
    ATTR_TELEMETRY_SDK_LANGUAGE: () => ATTR_TELEMETRY_SDK_LANGUAGE,
    ATTR_TELEMETRY_SDK_NAME: () => ATTR_TELEMETRY_SDK_NAME,
    ATTR_TELEMETRY_SDK_VERSION: () => ATTR_TELEMETRY_SDK_VERSION,
    ATTR_URL_FRAGMENT: () => ATTR_URL_FRAGMENT,
    ATTR_URL_FULL: () => ATTR_URL_FULL,
    ATTR_URL_PATH: () => ATTR_URL_PATH,
    ATTR_URL_QUERY: () => ATTR_URL_QUERY,
    ATTR_URL_SCHEME: () => ATTR_URL_SCHEME,
    ATTR_USER_AGENT_ORIGINAL: () => ATTR_USER_AGENT_ORIGINAL,
    AWSECSLAUNCHTYPEVALUES_EC2: () => AWSECSLAUNCHTYPEVALUES_EC2,
    AWSECSLAUNCHTYPEVALUES_FARGATE: () => AWSECSLAUNCHTYPEVALUES_FARGATE,
    AwsEcsLaunchtypeValues: () => AwsEcsLaunchtypeValues,
    CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS: () => CLOUDPLATFORMVALUES_ALIBABA_CLOUD_ECS,
    CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC: () => CLOUDPLATFORMVALUES_ALIBABA_CLOUD_FC,
    CLOUDPLATFORMVALUES_AWS_EC2: () => CLOUDPLATFORMVALUES_AWS_EC2,
    CLOUDPLATFORMVALUES_AWS_ECS: () => CLOUDPLATFORMVALUES_AWS_ECS,
    CLOUDPLATFORMVALUES_AWS_EKS: () => CLOUDPLATFORMVALUES_AWS_EKS,
    CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK: () => CLOUDPLATFORMVALUES_AWS_ELASTIC_BEANSTALK,
    CLOUDPLATFORMVALUES_AWS_LAMBDA: () => CLOUDPLATFORMVALUES_AWS_LAMBDA,
    CLOUDPLATFORMVALUES_AZURE_AKS: () => CLOUDPLATFORMVALUES_AZURE_AKS,
    CLOUDPLATFORMVALUES_AZURE_APP_SERVICE: () => CLOUDPLATFORMVALUES_AZURE_APP_SERVICE,
    CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES: () => CLOUDPLATFORMVALUES_AZURE_CONTAINER_INSTANCES,
    CLOUDPLATFORMVALUES_AZURE_FUNCTIONS: () => CLOUDPLATFORMVALUES_AZURE_FUNCTIONS,
    CLOUDPLATFORMVALUES_AZURE_VM: () => CLOUDPLATFORMVALUES_AZURE_VM,
    CLOUDPLATFORMVALUES_GCP_APP_ENGINE: () => CLOUDPLATFORMVALUES_GCP_APP_ENGINE,
    CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS: () => CLOUDPLATFORMVALUES_GCP_CLOUD_FUNCTIONS,
    CLOUDPLATFORMVALUES_GCP_CLOUD_RUN: () => CLOUDPLATFORMVALUES_GCP_CLOUD_RUN,
    CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE: () => CLOUDPLATFORMVALUES_GCP_COMPUTE_ENGINE,
    CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE: () => CLOUDPLATFORMVALUES_GCP_KUBERNETES_ENGINE,
    CLOUDPROVIDERVALUES_ALIBABA_CLOUD: () => CLOUDPROVIDERVALUES_ALIBABA_CLOUD,
    CLOUDPROVIDERVALUES_AWS: () => CLOUDPROVIDERVALUES_AWS,
    CLOUDPROVIDERVALUES_AZURE: () => CLOUDPROVIDERVALUES_AZURE,
    CLOUDPROVIDERVALUES_GCP: () => CLOUDPROVIDERVALUES_GCP,
    CloudPlatformValues: () => CloudPlatformValues,
    CloudProviderValues: () => CloudProviderValues,
    DBCASSANDRACONSISTENCYLEVELVALUES_ALL: () => DBCASSANDRACONSISTENCYLEVELVALUES_ALL,
    DBCASSANDRACONSISTENCYLEVELVALUES_ANY: () => DBCASSANDRACONSISTENCYLEVELVALUES_ANY,
    DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM: () => DBCASSANDRACONSISTENCYLEVELVALUES_EACH_QUORUM,
    DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE: () => DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_ONE,
    DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM: () => DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_QUORUM,
    DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL: () => DBCASSANDRACONSISTENCYLEVELVALUES_LOCAL_SERIAL,
    DBCASSANDRACONSISTENCYLEVELVALUES_ONE: () => DBCASSANDRACONSISTENCYLEVELVALUES_ONE,
    DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM: () => DBCASSANDRACONSISTENCYLEVELVALUES_QUORUM,
    DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL: () => DBCASSANDRACONSISTENCYLEVELVALUES_SERIAL,
    DBCASSANDRACONSISTENCYLEVELVALUES_THREE: () => DBCASSANDRACONSISTENCYLEVELVALUES_THREE,
    DBCASSANDRACONSISTENCYLEVELVALUES_TWO: () => DBCASSANDRACONSISTENCYLEVELVALUES_TWO,
    DBSYSTEMVALUES_ADABAS: () => DBSYSTEMVALUES_ADABAS,
    DBSYSTEMVALUES_CACHE: () => DBSYSTEMVALUES_CACHE,
    DBSYSTEMVALUES_CASSANDRA: () => DBSYSTEMVALUES_CASSANDRA,
    DBSYSTEMVALUES_CLOUDSCAPE: () => DBSYSTEMVALUES_CLOUDSCAPE,
    DBSYSTEMVALUES_COCKROACHDB: () => DBSYSTEMVALUES_COCKROACHDB,
    DBSYSTEMVALUES_COLDFUSION: () => DBSYSTEMVALUES_COLDFUSION,
    DBSYSTEMVALUES_COSMOSDB: () => DBSYSTEMVALUES_COSMOSDB,
    DBSYSTEMVALUES_COUCHBASE: () => DBSYSTEMVALUES_COUCHBASE,
    DBSYSTEMVALUES_COUCHDB: () => DBSYSTEMVALUES_COUCHDB,
    DBSYSTEMVALUES_DB2: () => DBSYSTEMVALUES_DB2,
    DBSYSTEMVALUES_DERBY: () => DBSYSTEMVALUES_DERBY,
    DBSYSTEMVALUES_DYNAMODB: () => DBSYSTEMVALUES_DYNAMODB,
    DBSYSTEMVALUES_EDB: () => DBSYSTEMVALUES_EDB,
    DBSYSTEMVALUES_ELASTICSEARCH: () => DBSYSTEMVALUES_ELASTICSEARCH,
    DBSYSTEMVALUES_FILEMAKER: () => DBSYSTEMVALUES_FILEMAKER,
    DBSYSTEMVALUES_FIREBIRD: () => DBSYSTEMVALUES_FIREBIRD,
    DBSYSTEMVALUES_FIRSTSQL: () => DBSYSTEMVALUES_FIRSTSQL,
    DBSYSTEMVALUES_GEODE: () => DBSYSTEMVALUES_GEODE,
    DBSYSTEMVALUES_H2: () => DBSYSTEMVALUES_H2,
    DBSYSTEMVALUES_HANADB: () => DBSYSTEMVALUES_HANADB,
    DBSYSTEMVALUES_HBASE: () => DBSYSTEMVALUES_HBASE,
    DBSYSTEMVALUES_HIVE: () => DBSYSTEMVALUES_HIVE,
    DBSYSTEMVALUES_HSQLDB: () => DBSYSTEMVALUES_HSQLDB,
    DBSYSTEMVALUES_INFORMIX: () => DBSYSTEMVALUES_INFORMIX,
    DBSYSTEMVALUES_INGRES: () => DBSYSTEMVALUES_INGRES,
    DBSYSTEMVALUES_INSTANTDB: () => DBSYSTEMVALUES_INSTANTDB,
    DBSYSTEMVALUES_INTERBASE: () => DBSYSTEMVALUES_INTERBASE,
    DBSYSTEMVALUES_MARIADB: () => DBSYSTEMVALUES_MARIADB,
    DBSYSTEMVALUES_MAXDB: () => DBSYSTEMVALUES_MAXDB,
    DBSYSTEMVALUES_MEMCACHED: () => DBSYSTEMVALUES_MEMCACHED,
    DBSYSTEMVALUES_MONGODB: () => DBSYSTEMVALUES_MONGODB,
    DBSYSTEMVALUES_MSSQL: () => DBSYSTEMVALUES_MSSQL,
    DBSYSTEMVALUES_MYSQL: () => DBSYSTEMVALUES_MYSQL,
    DBSYSTEMVALUES_NEO4J: () => DBSYSTEMVALUES_NEO4J,
    DBSYSTEMVALUES_NETEZZA: () => DBSYSTEMVALUES_NETEZZA,
    DBSYSTEMVALUES_ORACLE: () => DBSYSTEMVALUES_ORACLE,
    DBSYSTEMVALUES_OTHER_SQL: () => DBSYSTEMVALUES_OTHER_SQL,
    DBSYSTEMVALUES_PERVASIVE: () => DBSYSTEMVALUES_PERVASIVE,
    DBSYSTEMVALUES_POINTBASE: () => DBSYSTEMVALUES_POINTBASE,
    DBSYSTEMVALUES_POSTGRESQL: () => DBSYSTEMVALUES_POSTGRESQL,
    DBSYSTEMVALUES_PROGRESS: () => DBSYSTEMVALUES_PROGRESS,
    DBSYSTEMVALUES_REDIS: () => DBSYSTEMVALUES_REDIS,
    DBSYSTEMVALUES_REDSHIFT: () => DBSYSTEMVALUES_REDSHIFT,
    DBSYSTEMVALUES_SQLITE: () => DBSYSTEMVALUES_SQLITE,
    DBSYSTEMVALUES_SYBASE: () => DBSYSTEMVALUES_SYBASE,
    DBSYSTEMVALUES_TERADATA: () => DBSYSTEMVALUES_TERADATA,
    DBSYSTEMVALUES_VERTICA: () => DBSYSTEMVALUES_VERTICA,
    DbCassandraConsistencyLevelValues: () => DbCassandraConsistencyLevelValues,
    DbSystemValues: () => DbSystemValues,
    ERROR_TYPE_VALUE_OTHER: () => ERROR_TYPE_VALUE_OTHER,
    FAASDOCUMENTOPERATIONVALUES_DELETE: () => FAASDOCUMENTOPERATIONVALUES_DELETE,
    FAASDOCUMENTOPERATIONVALUES_EDIT: () => FAASDOCUMENTOPERATIONVALUES_EDIT,
    FAASDOCUMENTOPERATIONVALUES_INSERT: () => FAASDOCUMENTOPERATIONVALUES_INSERT,
    FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD: () => FAASINVOKEDPROVIDERVALUES_ALIBABA_CLOUD,
    FAASINVOKEDPROVIDERVALUES_AWS: () => FAASINVOKEDPROVIDERVALUES_AWS,
    FAASINVOKEDPROVIDERVALUES_AZURE: () => FAASINVOKEDPROVIDERVALUES_AZURE,
    FAASINVOKEDPROVIDERVALUES_GCP: () => FAASINVOKEDPROVIDERVALUES_GCP,
    FAASTRIGGERVALUES_DATASOURCE: () => FAASTRIGGERVALUES_DATASOURCE,
    FAASTRIGGERVALUES_HTTP: () => FAASTRIGGERVALUES_HTTP,
    FAASTRIGGERVALUES_OTHER: () => FAASTRIGGERVALUES_OTHER,
    FAASTRIGGERVALUES_PUBSUB: () => FAASTRIGGERVALUES_PUBSUB,
    FAASTRIGGERVALUES_TIMER: () => FAASTRIGGERVALUES_TIMER,
    FaasDocumentOperationValues: () => FaasDocumentOperationValues,
    FaasInvokedProviderValues: () => FaasInvokedProviderValues,
    FaasTriggerValues: () => FaasTriggerValues,
    HOSTARCHVALUES_AMD64: () => HOSTARCHVALUES_AMD64,
    HOSTARCHVALUES_ARM32: () => HOSTARCHVALUES_ARM32,
    HOSTARCHVALUES_ARM64: () => HOSTARCHVALUES_ARM64,
    HOSTARCHVALUES_IA64: () => HOSTARCHVALUES_IA64,
    HOSTARCHVALUES_PPC32: () => HOSTARCHVALUES_PPC32,
    HOSTARCHVALUES_PPC64: () => HOSTARCHVALUES_PPC64,
    HOSTARCHVALUES_X86: () => HOSTARCHVALUES_X86,
    HTTPFLAVORVALUES_HTTP_1_0: () => HTTPFLAVORVALUES_HTTP_1_0,
    HTTPFLAVORVALUES_HTTP_1_1: () => HTTPFLAVORVALUES_HTTP_1_1,
    HTTPFLAVORVALUES_HTTP_2_0: () => HTTPFLAVORVALUES_HTTP_2_0,
    HTTPFLAVORVALUES_QUIC: () => HTTPFLAVORVALUES_QUIC,
    HTTPFLAVORVALUES_SPDY: () => HTTPFLAVORVALUES_SPDY,
    HTTP_REQUEST_METHOD_VALUE_CONNECT: () => HTTP_REQUEST_METHOD_VALUE_CONNECT,
    HTTP_REQUEST_METHOD_VALUE_DELETE: () => HTTP_REQUEST_METHOD_VALUE_DELETE,
    HTTP_REQUEST_METHOD_VALUE_GET: () => HTTP_REQUEST_METHOD_VALUE_GET,
    HTTP_REQUEST_METHOD_VALUE_HEAD: () => HTTP_REQUEST_METHOD_VALUE_HEAD,
    HTTP_REQUEST_METHOD_VALUE_OPTIONS: () => HTTP_REQUEST_METHOD_VALUE_OPTIONS,
    HTTP_REQUEST_METHOD_VALUE_OTHER: () => HTTP_REQUEST_METHOD_VALUE_OTHER,
    HTTP_REQUEST_METHOD_VALUE_PATCH: () => HTTP_REQUEST_METHOD_VALUE_PATCH,
    HTTP_REQUEST_METHOD_VALUE_POST: () => HTTP_REQUEST_METHOD_VALUE_POST,
    HTTP_REQUEST_METHOD_VALUE_PUT: () => HTTP_REQUEST_METHOD_VALUE_PUT,
    HTTP_REQUEST_METHOD_VALUE_TRACE: () => HTTP_REQUEST_METHOD_VALUE_TRACE,
    HostArchValues: () => HostArchValues,
    HttpFlavorValues: () => HttpFlavorValues,
    JVM_MEMORY_TYPE_VALUE_HEAP: () => JVM_MEMORY_TYPE_VALUE_HEAP,
    JVM_MEMORY_TYPE_VALUE_NON_HEAP: () => JVM_MEMORY_TYPE_VALUE_NON_HEAP,
    JVM_THREAD_STATE_VALUE_BLOCKED: () => JVM_THREAD_STATE_VALUE_BLOCKED,
    JVM_THREAD_STATE_VALUE_NEW: () => JVM_THREAD_STATE_VALUE_NEW,
    JVM_THREAD_STATE_VALUE_RUNNABLE: () => JVM_THREAD_STATE_VALUE_RUNNABLE,
    JVM_THREAD_STATE_VALUE_TERMINATED: () => JVM_THREAD_STATE_VALUE_TERMINATED,
    JVM_THREAD_STATE_VALUE_TIMED_WAITING: () => JVM_THREAD_STATE_VALUE_TIMED_WAITING,
    JVM_THREAD_STATE_VALUE_WAITING: () => JVM_THREAD_STATE_VALUE_WAITING,
    MESSAGETYPEVALUES_RECEIVED: () => MESSAGETYPEVALUES_RECEIVED,
    MESSAGETYPEVALUES_SENT: () => MESSAGETYPEVALUES_SENT,
    MESSAGINGDESTINATIONKINDVALUES_QUEUE: () => MESSAGINGDESTINATIONKINDVALUES_QUEUE,
    MESSAGINGDESTINATIONKINDVALUES_TOPIC: () => MESSAGINGDESTINATIONKINDVALUES_TOPIC,
    MESSAGINGOPERATIONVALUES_PROCESS: () => MESSAGINGOPERATIONVALUES_PROCESS,
    MESSAGINGOPERATIONVALUES_RECEIVE: () => MESSAGINGOPERATIONVALUES_RECEIVE,
    METRIC_ASPNETCORE_DIAGNOSTICS_EXCEPTIONS: () => METRIC_ASPNETCORE_DIAGNOSTICS_EXCEPTIONS,
    METRIC_ASPNETCORE_RATE_LIMITING_ACTIVE_REQUEST_LEASES: () => METRIC_ASPNETCORE_RATE_LIMITING_ACTIVE_REQUEST_LEASES,
    METRIC_ASPNETCORE_RATE_LIMITING_QUEUED_REQUESTS: () => METRIC_ASPNETCORE_RATE_LIMITING_QUEUED_REQUESTS,
    METRIC_ASPNETCORE_RATE_LIMITING_REQUESTS: () => METRIC_ASPNETCORE_RATE_LIMITING_REQUESTS,
    METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_LEASE_DURATION: () => METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_LEASE_DURATION,
    METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_TIME_IN_QUEUE: () => METRIC_ASPNETCORE_RATE_LIMITING_REQUEST_TIME_IN_QUEUE,
    METRIC_ASPNETCORE_ROUTING_MATCH_ATTEMPTS: () => METRIC_ASPNETCORE_ROUTING_MATCH_ATTEMPTS,
    METRIC_HTTP_CLIENT_REQUEST_DURATION: () => METRIC_HTTP_CLIENT_REQUEST_DURATION,
    METRIC_HTTP_SERVER_REQUEST_DURATION: () => METRIC_HTTP_SERVER_REQUEST_DURATION,
    METRIC_JVM_CLASS_COUNT: () => METRIC_JVM_CLASS_COUNT,
    METRIC_JVM_CLASS_LOADED: () => METRIC_JVM_CLASS_LOADED,
    METRIC_JVM_CLASS_UNLOADED: () => METRIC_JVM_CLASS_UNLOADED,
    METRIC_JVM_CPU_COUNT: () => METRIC_JVM_CPU_COUNT,
    METRIC_JVM_CPU_RECENT_UTILIZATION: () => METRIC_JVM_CPU_RECENT_UTILIZATION,
    METRIC_JVM_CPU_TIME: () => METRIC_JVM_CPU_TIME,
    METRIC_JVM_GC_DURATION: () => METRIC_JVM_GC_DURATION,
    METRIC_JVM_MEMORY_COMMITTED: () => METRIC_JVM_MEMORY_COMMITTED,
    METRIC_JVM_MEMORY_LIMIT: () => METRIC_JVM_MEMORY_LIMIT,
    METRIC_JVM_MEMORY_USED: () => METRIC_JVM_MEMORY_USED,
    METRIC_JVM_MEMORY_USED_AFTER_LAST_GC: () => METRIC_JVM_MEMORY_USED_AFTER_LAST_GC,
    METRIC_JVM_THREAD_COUNT: () => METRIC_JVM_THREAD_COUNT,
    METRIC_KESTREL_ACTIVE_CONNECTIONS: () => METRIC_KESTREL_ACTIVE_CONNECTIONS,
    METRIC_KESTREL_ACTIVE_TLS_HANDSHAKES: () => METRIC_KESTREL_ACTIVE_TLS_HANDSHAKES,
    METRIC_KESTREL_CONNECTION_DURATION: () => METRIC_KESTREL_CONNECTION_DURATION,
    METRIC_KESTREL_QUEUED_CONNECTIONS: () => METRIC_KESTREL_QUEUED_CONNECTIONS,
    METRIC_KESTREL_QUEUED_REQUESTS: () => METRIC_KESTREL_QUEUED_REQUESTS,
    METRIC_KESTREL_REJECTED_CONNECTIONS: () => METRIC_KESTREL_REJECTED_CONNECTIONS,
    METRIC_KESTREL_TLS_HANDSHAKE_DURATION: () => METRIC_KESTREL_TLS_HANDSHAKE_DURATION,
    METRIC_KESTREL_UPGRADED_CONNECTIONS: () => METRIC_KESTREL_UPGRADED_CONNECTIONS,
    METRIC_SIGNALR_SERVER_ACTIVE_CONNECTIONS: () => METRIC_SIGNALR_SERVER_ACTIVE_CONNECTIONS,
    METRIC_SIGNALR_SERVER_CONNECTION_DURATION: () => METRIC_SIGNALR_SERVER_CONNECTION_DURATION,
    MessageTypeValues: () => MessageTypeValues,
    MessagingDestinationKindValues: () => MessagingDestinationKindValues,
    MessagingOperationValues: () => MessagingOperationValues,
    NETHOSTCONNECTIONSUBTYPEVALUES_CDMA: () => NETHOSTCONNECTIONSUBTYPEVALUES_CDMA,
    NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT: () => NETHOSTCONNECTIONSUBTYPEVALUES_CDMA2000_1XRTT,
    NETHOSTCONNECTIONSUBTYPEVALUES_EDGE: () => NETHOSTCONNECTIONSUBTYPEVALUES_EDGE,
    NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD: () => NETHOSTCONNECTIONSUBTYPEVALUES_EHRPD,
    NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0: () => NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_0,
    NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A: () => NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_A,
    NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B: () => NETHOSTCONNECTIONSUBTYPEVALUES_EVDO_B,
    NETHOSTCONNECTIONSUBTYPEVALUES_GPRS: () => NETHOSTCONNECTIONSUBTYPEVALUES_GPRS,
    NETHOSTCONNECTIONSUBTYPEVALUES_GSM: () => NETHOSTCONNECTIONSUBTYPEVALUES_GSM,
    NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA: () => NETHOSTCONNECTIONSUBTYPEVALUES_HSDPA,
    NETHOSTCONNECTIONSUBTYPEVALUES_HSPA: () => NETHOSTCONNECTIONSUBTYPEVALUES_HSPA,
    NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP: () => NETHOSTCONNECTIONSUBTYPEVALUES_HSPAP,
    NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA: () => NETHOSTCONNECTIONSUBTYPEVALUES_HSUPA,
    NETHOSTCONNECTIONSUBTYPEVALUES_IDEN: () => NETHOSTCONNECTIONSUBTYPEVALUES_IDEN,
    NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN: () => NETHOSTCONNECTIONSUBTYPEVALUES_IWLAN,
    NETHOSTCONNECTIONSUBTYPEVALUES_LTE: () => NETHOSTCONNECTIONSUBTYPEVALUES_LTE,
    NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA: () => NETHOSTCONNECTIONSUBTYPEVALUES_LTE_CA,
    NETHOSTCONNECTIONSUBTYPEVALUES_NR: () => NETHOSTCONNECTIONSUBTYPEVALUES_NR,
    NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA: () => NETHOSTCONNECTIONSUBTYPEVALUES_NRNSA,
    NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA: () => NETHOSTCONNECTIONSUBTYPEVALUES_TD_SCDMA,
    NETHOSTCONNECTIONSUBTYPEVALUES_UMTS: () => NETHOSTCONNECTIONSUBTYPEVALUES_UMTS,
    NETHOSTCONNECTIONTYPEVALUES_CELL: () => NETHOSTCONNECTIONTYPEVALUES_CELL,
    NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE: () => NETHOSTCONNECTIONTYPEVALUES_UNAVAILABLE,
    NETHOSTCONNECTIONTYPEVALUES_UNKNOWN: () => NETHOSTCONNECTIONTYPEVALUES_UNKNOWN,
    NETHOSTCONNECTIONTYPEVALUES_WIFI: () => NETHOSTCONNECTIONTYPEVALUES_WIFI,
    NETHOSTCONNECTIONTYPEVALUES_WIRED: () => NETHOSTCONNECTIONTYPEVALUES_WIRED,
    NETTRANSPORTVALUES_INPROC: () => NETTRANSPORTVALUES_INPROC,
    NETTRANSPORTVALUES_IP: () => NETTRANSPORTVALUES_IP,
    NETTRANSPORTVALUES_IP_TCP: () => NETTRANSPORTVALUES_IP_TCP,
    NETTRANSPORTVALUES_IP_UDP: () => NETTRANSPORTVALUES_IP_UDP,
    NETTRANSPORTVALUES_OTHER: () => NETTRANSPORTVALUES_OTHER,
    NETTRANSPORTVALUES_PIPE: () => NETTRANSPORTVALUES_PIPE,
    NETTRANSPORTVALUES_UNIX: () => NETTRANSPORTVALUES_UNIX,
    NETWORK_TRANSPORT_VALUE_PIPE: () => NETWORK_TRANSPORT_VALUE_PIPE,
    NETWORK_TRANSPORT_VALUE_QUIC: () => NETWORK_TRANSPORT_VALUE_QUIC,
    NETWORK_TRANSPORT_VALUE_TCP: () => NETWORK_TRANSPORT_VALUE_TCP,
    NETWORK_TRANSPORT_VALUE_UDP: () => NETWORK_TRANSPORT_VALUE_UDP,
    NETWORK_TRANSPORT_VALUE_UNIX: () => NETWORK_TRANSPORT_VALUE_UNIX,
    NETWORK_TYPE_VALUE_IPV4: () => NETWORK_TYPE_VALUE_IPV4,
    NETWORK_TYPE_VALUE_IPV6: () => NETWORK_TYPE_VALUE_IPV6,
    NetHostConnectionSubtypeValues: () => NetHostConnectionSubtypeValues,
    NetHostConnectionTypeValues: () => NetHostConnectionTypeValues,
    NetTransportValues: () => NetTransportValues,
    OSTYPEVALUES_AIX: () => OSTYPEVALUES_AIX,
    OSTYPEVALUES_DARWIN: () => OSTYPEVALUES_DARWIN,
    OSTYPEVALUES_DRAGONFLYBSD: () => OSTYPEVALUES_DRAGONFLYBSD,
    OSTYPEVALUES_FREEBSD: () => OSTYPEVALUES_FREEBSD,
    OSTYPEVALUES_HPUX: () => OSTYPEVALUES_HPUX,
    OSTYPEVALUES_LINUX: () => OSTYPEVALUES_LINUX,
    OSTYPEVALUES_NETBSD: () => OSTYPEVALUES_NETBSD,
    OSTYPEVALUES_OPENBSD: () => OSTYPEVALUES_OPENBSD,
    OSTYPEVALUES_SOLARIS: () => OSTYPEVALUES_SOLARIS,
    OSTYPEVALUES_WINDOWS: () => OSTYPEVALUES_WINDOWS,
    OSTYPEVALUES_Z_OS: () => OSTYPEVALUES_Z_OS,
    OTEL_STATUS_CODE_VALUE_ERROR: () => OTEL_STATUS_CODE_VALUE_ERROR,
    OTEL_STATUS_CODE_VALUE_OK: () => OTEL_STATUS_CODE_VALUE_OK,
    OsTypeValues: () => OsTypeValues,
    RPCGRPCSTATUSCODEVALUES_ABORTED: () => RPCGRPCSTATUSCODEVALUES_ABORTED,
    RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS: () => RPCGRPCSTATUSCODEVALUES_ALREADY_EXISTS,
    RPCGRPCSTATUSCODEVALUES_CANCELLED: () => RPCGRPCSTATUSCODEVALUES_CANCELLED,
    RPCGRPCSTATUSCODEVALUES_DATA_LOSS: () => RPCGRPCSTATUSCODEVALUES_DATA_LOSS,
    RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED: () => RPCGRPCSTATUSCODEVALUES_DEADLINE_EXCEEDED,
    RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION: () => RPCGRPCSTATUSCODEVALUES_FAILED_PRECONDITION,
    RPCGRPCSTATUSCODEVALUES_INTERNAL: () => RPCGRPCSTATUSCODEVALUES_INTERNAL,
    RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT: () => RPCGRPCSTATUSCODEVALUES_INVALID_ARGUMENT,
    RPCGRPCSTATUSCODEVALUES_NOT_FOUND: () => RPCGRPCSTATUSCODEVALUES_NOT_FOUND,
    RPCGRPCSTATUSCODEVALUES_OK: () => RPCGRPCSTATUSCODEVALUES_OK,
    RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE: () => RPCGRPCSTATUSCODEVALUES_OUT_OF_RANGE,
    RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED: () => RPCGRPCSTATUSCODEVALUES_PERMISSION_DENIED,
    RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED: () => RPCGRPCSTATUSCODEVALUES_RESOURCE_EXHAUSTED,
    RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED: () => RPCGRPCSTATUSCODEVALUES_UNAUTHENTICATED,
    RPCGRPCSTATUSCODEVALUES_UNAVAILABLE: () => RPCGRPCSTATUSCODEVALUES_UNAVAILABLE,
    RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED: () => RPCGRPCSTATUSCODEVALUES_UNIMPLEMENTED,
    RPCGRPCSTATUSCODEVALUES_UNKNOWN: () => RPCGRPCSTATUSCODEVALUES_UNKNOWN,
    RpcGrpcStatusCodeValues: () => RpcGrpcStatusCodeValues,
    SEMATTRS_AWS_DYNAMODB_ATTRIBUTES_TO_GET: () => SEMATTRS_AWS_DYNAMODB_ATTRIBUTES_TO_GET,
    SEMATTRS_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS: () => SEMATTRS_AWS_DYNAMODB_ATTRIBUTE_DEFINITIONS,
    SEMATTRS_AWS_DYNAMODB_CONSISTENT_READ: () => SEMATTRS_AWS_DYNAMODB_CONSISTENT_READ,
    SEMATTRS_AWS_DYNAMODB_CONSUMED_CAPACITY: () => SEMATTRS_AWS_DYNAMODB_CONSUMED_CAPACITY,
    SEMATTRS_AWS_DYNAMODB_COUNT: () => SEMATTRS_AWS_DYNAMODB_COUNT,
    SEMATTRS_AWS_DYNAMODB_EXCLUSIVE_START_TABLE: () => SEMATTRS_AWS_DYNAMODB_EXCLUSIVE_START_TABLE,
    SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES: () => SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEXES,
    SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES: () => SEMATTRS_AWS_DYNAMODB_GLOBAL_SECONDARY_INDEX_UPDATES,
    SEMATTRS_AWS_DYNAMODB_INDEX_NAME: () => SEMATTRS_AWS_DYNAMODB_INDEX_NAME,
    SEMATTRS_AWS_DYNAMODB_ITEM_COLLECTION_METRICS: () => SEMATTRS_AWS_DYNAMODB_ITEM_COLLECTION_METRICS,
    SEMATTRS_AWS_DYNAMODB_LIMIT: () => SEMATTRS_AWS_DYNAMODB_LIMIT,
    SEMATTRS_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES: () => SEMATTRS_AWS_DYNAMODB_LOCAL_SECONDARY_INDEXES,
    SEMATTRS_AWS_DYNAMODB_PROJECTION: () => SEMATTRS_AWS_DYNAMODB_PROJECTION,
    SEMATTRS_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY: () => SEMATTRS_AWS_DYNAMODB_PROVISIONED_READ_CAPACITY,
    SEMATTRS_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY: () => SEMATTRS_AWS_DYNAMODB_PROVISIONED_WRITE_CAPACITY,
    SEMATTRS_AWS_DYNAMODB_SCANNED_COUNT: () => SEMATTRS_AWS_DYNAMODB_SCANNED_COUNT,
    SEMATTRS_AWS_DYNAMODB_SCAN_FORWARD: () => SEMATTRS_AWS_DYNAMODB_SCAN_FORWARD,
    SEMATTRS_AWS_DYNAMODB_SEGMENT: () => SEMATTRS_AWS_DYNAMODB_SEGMENT,
    SEMATTRS_AWS_DYNAMODB_SELECT: () => SEMATTRS_AWS_DYNAMODB_SELECT,
    SEMATTRS_AWS_DYNAMODB_TABLE_COUNT: () => SEMATTRS_AWS_DYNAMODB_TABLE_COUNT,
    SEMATTRS_AWS_DYNAMODB_TABLE_NAMES: () => SEMATTRS_AWS_DYNAMODB_TABLE_NAMES,
    SEMATTRS_AWS_DYNAMODB_TOTAL_SEGMENTS: () => SEMATTRS_AWS_DYNAMODB_TOTAL_SEGMENTS,
    SEMATTRS_AWS_LAMBDA_INVOKED_ARN: () => SEMATTRS_AWS_LAMBDA_INVOKED_ARN,
    SEMATTRS_CODE_FILEPATH: () => SEMATTRS_CODE_FILEPATH,
    SEMATTRS_CODE_FUNCTION: () => SEMATTRS_CODE_FUNCTION,
    SEMATTRS_CODE_LINENO: () => SEMATTRS_CODE_LINENO,
    SEMATTRS_CODE_NAMESPACE: () => SEMATTRS_CODE_NAMESPACE,
    SEMATTRS_DB_CASSANDRA_CONSISTENCY_LEVEL: () => SEMATTRS_DB_CASSANDRA_CONSISTENCY_LEVEL,
    SEMATTRS_DB_CASSANDRA_COORDINATOR_DC: () => SEMATTRS_DB_CASSANDRA_COORDINATOR_DC,
    SEMATTRS_DB_CASSANDRA_COORDINATOR_ID: () => SEMATTRS_DB_CASSANDRA_COORDINATOR_ID,
    SEMATTRS_DB_CASSANDRA_IDEMPOTENCE: () => SEMATTRS_DB_CASSANDRA_IDEMPOTENCE,
    SEMATTRS_DB_CASSANDRA_KEYSPACE: () => SEMATTRS_DB_CASSANDRA_KEYSPACE,
    SEMATTRS_DB_CASSANDRA_PAGE_SIZE: () => SEMATTRS_DB_CASSANDRA_PAGE_SIZE,
    SEMATTRS_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT: () => SEMATTRS_DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT,
    SEMATTRS_DB_CASSANDRA_TABLE: () => SEMATTRS_DB_CASSANDRA_TABLE,
    SEMATTRS_DB_CONNECTION_STRING: () => SEMATTRS_DB_CONNECTION_STRING,
    SEMATTRS_DB_HBASE_NAMESPACE: () => SEMATTRS_DB_HBASE_NAMESPACE,
    SEMATTRS_DB_JDBC_DRIVER_CLASSNAME: () => SEMATTRS_DB_JDBC_DRIVER_CLASSNAME,
    SEMATTRS_DB_MONGODB_COLLECTION: () => SEMATTRS_DB_MONGODB_COLLECTION,
    SEMATTRS_DB_MSSQL_INSTANCE_NAME: () => SEMATTRS_DB_MSSQL_INSTANCE_NAME,
    SEMATTRS_DB_NAME: () => SEMATTRS_DB_NAME,
    SEMATTRS_DB_OPERATION: () => SEMATTRS_DB_OPERATION,
    SEMATTRS_DB_REDIS_DATABASE_INDEX: () => SEMATTRS_DB_REDIS_DATABASE_INDEX,
    SEMATTRS_DB_SQL_TABLE: () => SEMATTRS_DB_SQL_TABLE,
    SEMATTRS_DB_STATEMENT: () => SEMATTRS_DB_STATEMENT,
    SEMATTRS_DB_SYSTEM: () => SEMATTRS_DB_SYSTEM,
    SEMATTRS_DB_USER: () => SEMATTRS_DB_USER,
    SEMATTRS_ENDUSER_ID: () => SEMATTRS_ENDUSER_ID,
    SEMATTRS_ENDUSER_ROLE: () => SEMATTRS_ENDUSER_ROLE,
    SEMATTRS_ENDUSER_SCOPE: () => SEMATTRS_ENDUSER_SCOPE,
    SEMATTRS_EXCEPTION_ESCAPED: () => SEMATTRS_EXCEPTION_ESCAPED,
    SEMATTRS_EXCEPTION_MESSAGE: () => SEMATTRS_EXCEPTION_MESSAGE,
    SEMATTRS_EXCEPTION_STACKTRACE: () => SEMATTRS_EXCEPTION_STACKTRACE,
    SEMATTRS_EXCEPTION_TYPE: () => SEMATTRS_EXCEPTION_TYPE,
    SEMATTRS_FAAS_COLDSTART: () => SEMATTRS_FAAS_COLDSTART,
    SEMATTRS_FAAS_CRON: () => SEMATTRS_FAAS_CRON,
    SEMATTRS_FAAS_DOCUMENT_COLLECTION: () => SEMATTRS_FAAS_DOCUMENT_COLLECTION,
    SEMATTRS_FAAS_DOCUMENT_NAME: () => SEMATTRS_FAAS_DOCUMENT_NAME,
    SEMATTRS_FAAS_DOCUMENT_OPERATION: () => SEMATTRS_FAAS_DOCUMENT_OPERATION,
    SEMATTRS_FAAS_DOCUMENT_TIME: () => SEMATTRS_FAAS_DOCUMENT_TIME,
    SEMATTRS_FAAS_EXECUTION: () => SEMATTRS_FAAS_EXECUTION,
    SEMATTRS_FAAS_INVOKED_NAME: () => SEMATTRS_FAAS_INVOKED_NAME,
    SEMATTRS_FAAS_INVOKED_PROVIDER: () => SEMATTRS_FAAS_INVOKED_PROVIDER,
    SEMATTRS_FAAS_INVOKED_REGION: () => SEMATTRS_FAAS_INVOKED_REGION,
    SEMATTRS_FAAS_TIME: () => SEMATTRS_FAAS_TIME,
    SEMATTRS_FAAS_TRIGGER: () => SEMATTRS_FAAS_TRIGGER,
    SEMATTRS_HTTP_CLIENT_IP: () => SEMATTRS_HTTP_CLIENT_IP,
    SEMATTRS_HTTP_FLAVOR: () => SEMATTRS_HTTP_FLAVOR,
    SEMATTRS_HTTP_HOST: () => SEMATTRS_HTTP_HOST,
    SEMATTRS_HTTP_METHOD: () => SEMATTRS_HTTP_METHOD,
    SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH: () => SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH,
    SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED: () => SEMATTRS_HTTP_REQUEST_CONTENT_LENGTH_UNCOMPRESSED,
    SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH: () => SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH,
    SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED: () => SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED,
    SEMATTRS_HTTP_ROUTE: () => SEMATTRS_HTTP_ROUTE,
    SEMATTRS_HTTP_SCHEME: () => SEMATTRS_HTTP_SCHEME,
    SEMATTRS_HTTP_SERVER_NAME: () => SEMATTRS_HTTP_SERVER_NAME,
    SEMATTRS_HTTP_STATUS_CODE: () => SEMATTRS_HTTP_STATUS_CODE,
    SEMATTRS_HTTP_TARGET: () => SEMATTRS_HTTP_TARGET,
    SEMATTRS_HTTP_URL: () => SEMATTRS_HTTP_URL,
    SEMATTRS_HTTP_USER_AGENT: () => SEMATTRS_HTTP_USER_AGENT,
    SEMATTRS_MESSAGE_COMPRESSED_SIZE: () => SEMATTRS_MESSAGE_COMPRESSED_SIZE,
    SEMATTRS_MESSAGE_ID: () => SEMATTRS_MESSAGE_ID,
    SEMATTRS_MESSAGE_TYPE: () => SEMATTRS_MESSAGE_TYPE,
    SEMATTRS_MESSAGE_UNCOMPRESSED_SIZE: () => SEMATTRS_MESSAGE_UNCOMPRESSED_SIZE,
    SEMATTRS_MESSAGING_CONSUMER_ID: () => SEMATTRS_MESSAGING_CONSUMER_ID,
    SEMATTRS_MESSAGING_CONVERSATION_ID: () => SEMATTRS_MESSAGING_CONVERSATION_ID,
    SEMATTRS_MESSAGING_DESTINATION: () => SEMATTRS_MESSAGING_DESTINATION,
    SEMATTRS_MESSAGING_DESTINATION_KIND: () => SEMATTRS_MESSAGING_DESTINATION_KIND,
    SEMATTRS_MESSAGING_KAFKA_CLIENT_ID: () => SEMATTRS_MESSAGING_KAFKA_CLIENT_ID,
    SEMATTRS_MESSAGING_KAFKA_CONSUMER_GROUP: () => SEMATTRS_MESSAGING_KAFKA_CONSUMER_GROUP,
    SEMATTRS_MESSAGING_KAFKA_MESSAGE_KEY: () => SEMATTRS_MESSAGING_KAFKA_MESSAGE_KEY,
    SEMATTRS_MESSAGING_KAFKA_PARTITION: () => SEMATTRS_MESSAGING_KAFKA_PARTITION,
    SEMATTRS_MESSAGING_KAFKA_TOMBSTONE: () => SEMATTRS_MESSAGING_KAFKA_TOMBSTONE,
    SEMATTRS_MESSAGING_MESSAGE_ID: () => SEMATTRS_MESSAGING_MESSAGE_ID,
    SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES: () => SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES,
    SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES: () => SEMATTRS_MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES,
    SEMATTRS_MESSAGING_OPERATION: () => SEMATTRS_MESSAGING_OPERATION,
    SEMATTRS_MESSAGING_PROTOCOL: () => SEMATTRS_MESSAGING_PROTOCOL,
    SEMATTRS_MESSAGING_PROTOCOL_VERSION: () => SEMATTRS_MESSAGING_PROTOCOL_VERSION,
    SEMATTRS_MESSAGING_RABBITMQ_ROUTING_KEY: () => SEMATTRS_MESSAGING_RABBITMQ_ROUTING_KEY,
    SEMATTRS_MESSAGING_SYSTEM: () => SEMATTRS_MESSAGING_SYSTEM,
    SEMATTRS_MESSAGING_TEMP_DESTINATION: () => SEMATTRS_MESSAGING_TEMP_DESTINATION,
    SEMATTRS_MESSAGING_URL: () => SEMATTRS_MESSAGING_URL,
    SEMATTRS_NET_HOST_CARRIER_ICC: () => SEMATTRS_NET_HOST_CARRIER_ICC,
    SEMATTRS_NET_HOST_CARRIER_MCC: () => SEMATTRS_NET_HOST_CARRIER_MCC,
    SEMATTRS_NET_HOST_CARRIER_MNC: () => SEMATTRS_NET_HOST_CARRIER_MNC,
    SEMATTRS_NET_HOST_CARRIER_NAME: () => SEMATTRS_NET_HOST_CARRIER_NAME,
    SEMATTRS_NET_HOST_CONNECTION_SUBTYPE: () => SEMATTRS_NET_HOST_CONNECTION_SUBTYPE,
    SEMATTRS_NET_HOST_CONNECTION_TYPE: () => SEMATTRS_NET_HOST_CONNECTION_TYPE,
    SEMATTRS_NET_HOST_IP: () => SEMATTRS_NET_HOST_IP,
    SEMATTRS_NET_HOST_NAME: () => SEMATTRS_NET_HOST_NAME,
    SEMATTRS_NET_HOST_PORT: () => SEMATTRS_NET_HOST_PORT,
    SEMATTRS_NET_PEER_IP: () => SEMATTRS_NET_PEER_IP,
    SEMATTRS_NET_PEER_NAME: () => SEMATTRS_NET_PEER_NAME,
    SEMATTRS_NET_PEER_PORT: () => SEMATTRS_NET_PEER_PORT,
    SEMATTRS_NET_TRANSPORT: () => SEMATTRS_NET_TRANSPORT,
    SEMATTRS_PEER_SERVICE: () => SEMATTRS_PEER_SERVICE,
    SEMATTRS_RPC_GRPC_STATUS_CODE: () => SEMATTRS_RPC_GRPC_STATUS_CODE,
    SEMATTRS_RPC_JSONRPC_ERROR_CODE: () => SEMATTRS_RPC_JSONRPC_ERROR_CODE,
    SEMATTRS_RPC_JSONRPC_ERROR_MESSAGE: () => SEMATTRS_RPC_JSONRPC_ERROR_MESSAGE,
    SEMATTRS_RPC_JSONRPC_REQUEST_ID: () => SEMATTRS_RPC_JSONRPC_REQUEST_ID,
    SEMATTRS_RPC_JSONRPC_VERSION: () => SEMATTRS_RPC_JSONRPC_VERSION,
    SEMATTRS_RPC_METHOD: () => SEMATTRS_RPC_METHOD,
    SEMATTRS_RPC_SERVICE: () => SEMATTRS_RPC_SERVICE,
    SEMATTRS_RPC_SYSTEM: () => SEMATTRS_RPC_SYSTEM,
    SEMATTRS_THREAD_ID: () => SEMATTRS_THREAD_ID,
    SEMATTRS_THREAD_NAME: () => SEMATTRS_THREAD_NAME,
    SEMRESATTRS_AWS_ECS_CLUSTER_ARN: () => SEMRESATTRS_AWS_ECS_CLUSTER_ARN,
    SEMRESATTRS_AWS_ECS_CONTAINER_ARN: () => SEMRESATTRS_AWS_ECS_CONTAINER_ARN,
    SEMRESATTRS_AWS_ECS_LAUNCHTYPE: () => SEMRESATTRS_AWS_ECS_LAUNCHTYPE,
    SEMRESATTRS_AWS_ECS_TASK_ARN: () => SEMRESATTRS_AWS_ECS_TASK_ARN,
    SEMRESATTRS_AWS_ECS_TASK_FAMILY: () => SEMRESATTRS_AWS_ECS_TASK_FAMILY,
    SEMRESATTRS_AWS_ECS_TASK_REVISION: () => SEMRESATTRS_AWS_ECS_TASK_REVISION,
    SEMRESATTRS_AWS_EKS_CLUSTER_ARN: () => SEMRESATTRS_AWS_EKS_CLUSTER_ARN,
    SEMRESATTRS_AWS_LOG_GROUP_ARNS: () => SEMRESATTRS_AWS_LOG_GROUP_ARNS,
    SEMRESATTRS_AWS_LOG_GROUP_NAMES: () => SEMRESATTRS_AWS_LOG_GROUP_NAMES,
    SEMRESATTRS_AWS_LOG_STREAM_ARNS: () => SEMRESATTRS_AWS_LOG_STREAM_ARNS,
    SEMRESATTRS_AWS_LOG_STREAM_NAMES: () => SEMRESATTRS_AWS_LOG_STREAM_NAMES,
    SEMRESATTRS_CLOUD_ACCOUNT_ID: () => SEMRESATTRS_CLOUD_ACCOUNT_ID,
    SEMRESATTRS_CLOUD_AVAILABILITY_ZONE: () => SEMRESATTRS_CLOUD_AVAILABILITY_ZONE,
    SEMRESATTRS_CLOUD_PLATFORM: () => SEMRESATTRS_CLOUD_PLATFORM,
    SEMRESATTRS_CLOUD_PROVIDER: () => SEMRESATTRS_CLOUD_PROVIDER,
    SEMRESATTRS_CLOUD_REGION: () => SEMRESATTRS_CLOUD_REGION,
    SEMRESATTRS_CONTAINER_ID: () => SEMRESATTRS_CONTAINER_ID,
    SEMRESATTRS_CONTAINER_IMAGE_NAME: () => SEMRESATTRS_CONTAINER_IMAGE_NAME,
    SEMRESATTRS_CONTAINER_IMAGE_TAG: () => SEMRESATTRS_CONTAINER_IMAGE_TAG,
    SEMRESATTRS_CONTAINER_NAME: () => SEMRESATTRS_CONTAINER_NAME,
    SEMRESATTRS_CONTAINER_RUNTIME: () => SEMRESATTRS_CONTAINER_RUNTIME,
    SEMRESATTRS_DEPLOYMENT_ENVIRONMENT: () => SEMRESATTRS_DEPLOYMENT_ENVIRONMENT,
    SEMRESATTRS_DEVICE_ID: () => SEMRESATTRS_DEVICE_ID,
    SEMRESATTRS_DEVICE_MODEL_IDENTIFIER: () => SEMRESATTRS_DEVICE_MODEL_IDENTIFIER,
    SEMRESATTRS_DEVICE_MODEL_NAME: () => SEMRESATTRS_DEVICE_MODEL_NAME,
    SEMRESATTRS_FAAS_ID: () => SEMRESATTRS_FAAS_ID,
    SEMRESATTRS_FAAS_INSTANCE: () => SEMRESATTRS_FAAS_INSTANCE,
    SEMRESATTRS_FAAS_MAX_MEMORY: () => SEMRESATTRS_FAAS_MAX_MEMORY,
    SEMRESATTRS_FAAS_NAME: () => SEMRESATTRS_FAAS_NAME,
    SEMRESATTRS_FAAS_VERSION: () => SEMRESATTRS_FAAS_VERSION,
    SEMRESATTRS_HOST_ARCH: () => SEMRESATTRS_HOST_ARCH,
    SEMRESATTRS_HOST_ID: () => SEMRESATTRS_HOST_ID,
    SEMRESATTRS_HOST_IMAGE_ID: () => SEMRESATTRS_HOST_IMAGE_ID,
    SEMRESATTRS_HOST_IMAGE_NAME: () => SEMRESATTRS_HOST_IMAGE_NAME,
    SEMRESATTRS_HOST_IMAGE_VERSION: () => SEMRESATTRS_HOST_IMAGE_VERSION,
    SEMRESATTRS_HOST_NAME: () => SEMRESATTRS_HOST_NAME,
    SEMRESATTRS_HOST_TYPE: () => SEMRESATTRS_HOST_TYPE,
    SEMRESATTRS_K8S_CLUSTER_NAME: () => SEMRESATTRS_K8S_CLUSTER_NAME,
    SEMRESATTRS_K8S_CONTAINER_NAME: () => SEMRESATTRS_K8S_CONTAINER_NAME,
    SEMRESATTRS_K8S_CRONJOB_NAME: () => SEMRESATTRS_K8S_CRONJOB_NAME,
    SEMRESATTRS_K8S_CRONJOB_UID: () => SEMRESATTRS_K8S_CRONJOB_UID,
    SEMRESATTRS_K8S_DAEMONSET_NAME: () => SEMRESATTRS_K8S_DAEMONSET_NAME,
    SEMRESATTRS_K8S_DAEMONSET_UID: () => SEMRESATTRS_K8S_DAEMONSET_UID,
    SEMRESATTRS_K8S_DEPLOYMENT_NAME: () => SEMRESATTRS_K8S_DEPLOYMENT_NAME,
    SEMRESATTRS_K8S_DEPLOYMENT_UID: () => SEMRESATTRS_K8S_DEPLOYMENT_UID,
    SEMRESATTRS_K8S_JOB_NAME: () => SEMRESATTRS_K8S_JOB_NAME,
    SEMRESATTRS_K8S_JOB_UID: () => SEMRESATTRS_K8S_JOB_UID,
    SEMRESATTRS_K8S_NAMESPACE_NAME: () => SEMRESATTRS_K8S_NAMESPACE_NAME,
    SEMRESATTRS_K8S_NODE_NAME: () => SEMRESATTRS_K8S_NODE_NAME,
    SEMRESATTRS_K8S_NODE_UID: () => SEMRESATTRS_K8S_NODE_UID,
    SEMRESATTRS_K8S_POD_NAME: () => SEMRESATTRS_K8S_POD_NAME,
    SEMRESATTRS_K8S_POD_UID: () => SEMRESATTRS_K8S_POD_UID,
    SEMRESATTRS_K8S_REPLICASET_NAME: () => SEMRESATTRS_K8S_REPLICASET_NAME,
    SEMRESATTRS_K8S_REPLICASET_UID: () => SEMRESATTRS_K8S_REPLICASET_UID,
    SEMRESATTRS_K8S_STATEFULSET_NAME: () => SEMRESATTRS_K8S_STATEFULSET_NAME,
    SEMRESATTRS_K8S_STATEFULSET_UID: () => SEMRESATTRS_K8S_STATEFULSET_UID,
    SEMRESATTRS_OS_DESCRIPTION: () => SEMRESATTRS_OS_DESCRIPTION,
    SEMRESATTRS_OS_NAME: () => SEMRESATTRS_OS_NAME,
    SEMRESATTRS_OS_TYPE: () => SEMRESATTRS_OS_TYPE,
    SEMRESATTRS_OS_VERSION: () => SEMRESATTRS_OS_VERSION,
    SEMRESATTRS_PROCESS_COMMAND: () => SEMRESATTRS_PROCESS_COMMAND,
    SEMRESATTRS_PROCESS_COMMAND_ARGS: () => SEMRESATTRS_PROCESS_COMMAND_ARGS,
    SEMRESATTRS_PROCESS_COMMAND_LINE: () => SEMRESATTRS_PROCESS_COMMAND_LINE,
    SEMRESATTRS_PROCESS_EXECUTABLE_NAME: () => SEMRESATTRS_PROCESS_EXECUTABLE_NAME,
    SEMRESATTRS_PROCESS_EXECUTABLE_PATH: () => SEMRESATTRS_PROCESS_EXECUTABLE_PATH,
    SEMRESATTRS_PROCESS_OWNER: () => SEMRESATTRS_PROCESS_OWNER,
    SEMRESATTRS_PROCESS_PID: () => SEMRESATTRS_PROCESS_PID,
    SEMRESATTRS_PROCESS_RUNTIME_DESCRIPTION: () => SEMRESATTRS_PROCESS_RUNTIME_DESCRIPTION,
    SEMRESATTRS_PROCESS_RUNTIME_NAME: () => SEMRESATTRS_PROCESS_RUNTIME_NAME,
    SEMRESATTRS_PROCESS_RUNTIME_VERSION: () => SEMRESATTRS_PROCESS_RUNTIME_VERSION,
    SEMRESATTRS_SERVICE_INSTANCE_ID: () => SEMRESATTRS_SERVICE_INSTANCE_ID,
    SEMRESATTRS_SERVICE_NAME: () => SEMRESATTRS_SERVICE_NAME,
    SEMRESATTRS_SERVICE_NAMESPACE: () => SEMRESATTRS_SERVICE_NAMESPACE,
    SEMRESATTRS_SERVICE_VERSION: () => SEMRESATTRS_SERVICE_VERSION,
    SEMRESATTRS_TELEMETRY_AUTO_VERSION: () => SEMRESATTRS_TELEMETRY_AUTO_VERSION,
    SEMRESATTRS_TELEMETRY_SDK_LANGUAGE: () => SEMRESATTRS_TELEMETRY_SDK_LANGUAGE,
    SEMRESATTRS_TELEMETRY_SDK_NAME: () => SEMRESATTRS_TELEMETRY_SDK_NAME,
    SEMRESATTRS_TELEMETRY_SDK_VERSION: () => SEMRESATTRS_TELEMETRY_SDK_VERSION,
    SEMRESATTRS_WEBENGINE_DESCRIPTION: () => SEMRESATTRS_WEBENGINE_DESCRIPTION,
    SEMRESATTRS_WEBENGINE_NAME: () => SEMRESATTRS_WEBENGINE_NAME,
    SEMRESATTRS_WEBENGINE_VERSION: () => SEMRESATTRS_WEBENGINE_VERSION,
    SIGNALR_CONNECTION_STATUS_VALUE_APP_SHUTDOWN: () => SIGNALR_CONNECTION_STATUS_VALUE_APP_SHUTDOWN,
    SIGNALR_CONNECTION_STATUS_VALUE_NORMAL_CLOSURE: () => SIGNALR_CONNECTION_STATUS_VALUE_NORMAL_CLOSURE,
    SIGNALR_CONNECTION_STATUS_VALUE_TIMEOUT: () => SIGNALR_CONNECTION_STATUS_VALUE_TIMEOUT,
    SIGNALR_TRANSPORT_VALUE_LONG_POLLING: () => SIGNALR_TRANSPORT_VALUE_LONG_POLLING,
    SIGNALR_TRANSPORT_VALUE_SERVER_SENT_EVENTS: () => SIGNALR_TRANSPORT_VALUE_SERVER_SENT_EVENTS,
    SIGNALR_TRANSPORT_VALUE_WEB_SOCKETS: () => SIGNALR_TRANSPORT_VALUE_WEB_SOCKETS,
    SemanticAttributes: () => SemanticAttributes,
    SemanticResourceAttributes: () => SemanticResourceAttributes,
    TELEMETRYSDKLANGUAGEVALUES_CPP: () => TELEMETRYSDKLANGUAGEVALUES_CPP,
    TELEMETRYSDKLANGUAGEVALUES_DOTNET: () => TELEMETRYSDKLANGUAGEVALUES_DOTNET,
    TELEMETRYSDKLANGUAGEVALUES_ERLANG: () => TELEMETRYSDKLANGUAGEVALUES_ERLANG,
    TELEMETRYSDKLANGUAGEVALUES_GO: () => TELEMETRYSDKLANGUAGEVALUES_GO,
    TELEMETRYSDKLANGUAGEVALUES_JAVA: () => TELEMETRYSDKLANGUAGEVALUES_JAVA,
    TELEMETRYSDKLANGUAGEVALUES_NODEJS: () => TELEMETRYSDKLANGUAGEVALUES_NODEJS,
    TELEMETRYSDKLANGUAGEVALUES_PHP: () => TELEMETRYSDKLANGUAGEVALUES_PHP,
    TELEMETRYSDKLANGUAGEVALUES_PYTHON: () => TELEMETRYSDKLANGUAGEVALUES_PYTHON,
    TELEMETRYSDKLANGUAGEVALUES_RUBY: () => TELEMETRYSDKLANGUAGEVALUES_RUBY,
    TELEMETRYSDKLANGUAGEVALUES_WEBJS: () => TELEMETRYSDKLANGUAGEVALUES_WEBJS,
    TELEMETRY_SDK_LANGUAGE_VALUE_CPP: () => TELEMETRY_SDK_LANGUAGE_VALUE_CPP,
    TELEMETRY_SDK_LANGUAGE_VALUE_DOTNET: () => TELEMETRY_SDK_LANGUAGE_VALUE_DOTNET,
    TELEMETRY_SDK_LANGUAGE_VALUE_ERLANG: () => TELEMETRY_SDK_LANGUAGE_VALUE_ERLANG,
    TELEMETRY_SDK_LANGUAGE_VALUE_GO: () => TELEMETRY_SDK_LANGUAGE_VALUE_GO,
    TELEMETRY_SDK_LANGUAGE_VALUE_JAVA: () => TELEMETRY_SDK_LANGUAGE_VALUE_JAVA,
    TELEMETRY_SDK_LANGUAGE_VALUE_NODEJS: () => TELEMETRY_SDK_LANGUAGE_VALUE_NODEJS,
    TELEMETRY_SDK_LANGUAGE_VALUE_PHP: () => TELEMETRY_SDK_LANGUAGE_VALUE_PHP,
    TELEMETRY_SDK_LANGUAGE_VALUE_PYTHON: () => TELEMETRY_SDK_LANGUAGE_VALUE_PYTHON,
    TELEMETRY_SDK_LANGUAGE_VALUE_RUBY: () => TELEMETRY_SDK_LANGUAGE_VALUE_RUBY,
    TELEMETRY_SDK_LANGUAGE_VALUE_RUST: () => TELEMETRY_SDK_LANGUAGE_VALUE_RUST,
    TELEMETRY_SDK_LANGUAGE_VALUE_SWIFT: () => TELEMETRY_SDK_LANGUAGE_VALUE_SWIFT,
    TELEMETRY_SDK_LANGUAGE_VALUE_WEBJS: () => TELEMETRY_SDK_LANGUAGE_VALUE_WEBJS,
    TelemetrySdkLanguageValues: () => TelemetrySdkLanguageValues
  });
  var init_esm2 = __esm({
    "node_modules/@opentelemetry/semantic-conventions/build/esm/index.js"() {
      init_trace2();
      init_resource();
      init_stable_attributes();
      init_stable_metrics();
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/sdk-info.js
  var require_sdk_info = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/sdk-info.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.SDK_INFO = void 0;
      var version_1 = require_version();
      var semantic_conventions_1 = (init_esm2(), __toCommonJS(esm_exports2));
      exports.SDK_INFO = {
        [semantic_conventions_1.SEMRESATTRS_TELEMETRY_SDK_NAME]: "opentelemetry",
        [semantic_conventions_1.SEMRESATTRS_PROCESS_RUNTIME_NAME]: "browser",
        [semantic_conventions_1.SEMRESATTRS_TELEMETRY_SDK_LANGUAGE]: semantic_conventions_1.TELEMETRYSDKLANGUAGEVALUES_WEBJS,
        [semantic_conventions_1.SEMRESATTRS_TELEMETRY_SDK_VERSION]: version_1.VERSION
      };
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/timer-util.js
  var require_timer_util = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/timer-util.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.unrefTimer = void 0;
      function unrefTimer2(_timer) {
      }
      exports.unrefTimer = unrefTimer2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/platform/browser/index.js
  var require_browser = __commonJS({
    "node_modules/@opentelemetry/core/build/src/platform/browser/index.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.unrefTimer = exports.SDK_INFO = exports.otperformance = exports.RandomIdGenerator = exports.hexToBase64 = exports._globalThis = exports.getEnv = exports.getEnvWithoutDefaults = void 0;
      var environment_1 = require_environment2();
      Object.defineProperty(exports, "getEnvWithoutDefaults", { enumerable: true, get: function() {
        return environment_1.getEnvWithoutDefaults;
      } });
      Object.defineProperty(exports, "getEnv", { enumerable: true, get: function() {
        return environment_1.getEnv;
      } });
      var globalThis_1 = require_globalThis();
      Object.defineProperty(exports, "_globalThis", { enumerable: true, get: function() {
        return globalThis_1._globalThis;
      } });
      var hex_to_base64_1 = require_hex_to_base64();
      Object.defineProperty(exports, "hexToBase64", { enumerable: true, get: function() {
        return hex_to_base64_1.hexToBase64;
      } });
      var RandomIdGenerator_1 = require_RandomIdGenerator();
      Object.defineProperty(exports, "RandomIdGenerator", { enumerable: true, get: function() {
        return RandomIdGenerator_1.RandomIdGenerator;
      } });
      var performance_1 = require_performance();
      Object.defineProperty(exports, "otperformance", { enumerable: true, get: function() {
        return performance_1.otperformance;
      } });
      var sdk_info_1 = require_sdk_info();
      Object.defineProperty(exports, "SDK_INFO", { enumerable: true, get: function() {
        return sdk_info_1.SDK_INFO;
      } });
      var timer_util_1 = require_timer_util();
      Object.defineProperty(exports, "unrefTimer", { enumerable: true, get: function() {
        return timer_util_1.unrefTimer;
      } });
    }
  });

  // node_modules/@opentelemetry/core/build/src/common/time.js
  var require_time = __commonJS({
    "node_modules/@opentelemetry/core/build/src/common/time.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.addHrTimes = exports.isTimeInput = exports.isTimeInputHrTime = exports.hrTimeToMicroseconds = exports.hrTimeToMilliseconds = exports.hrTimeToNanoseconds = exports.hrTimeToTimeStamp = exports.hrTimeDuration = exports.timeInputToHrTime = exports.hrTime = exports.getTimeOrigin = exports.millisToHrTime = void 0;
      var platform_1 = require_browser();
      var NANOSECOND_DIGITS2 = 9;
      var NANOSECOND_DIGITS_IN_MILLIS2 = 6;
      var MILLISECONDS_TO_NANOSECONDS2 = Math.pow(10, NANOSECOND_DIGITS_IN_MILLIS2);
      var SECOND_TO_NANOSECONDS2 = Math.pow(10, NANOSECOND_DIGITS2);
      function millisToHrTime4(epochMillis) {
        const epochSeconds = epochMillis / 1e3;
        const seconds = Math.trunc(epochSeconds);
        const nanos = Math.round(epochMillis % 1e3 * MILLISECONDS_TO_NANOSECONDS2);
        return [seconds, nanos];
      }
      exports.millisToHrTime = millisToHrTime4;
      function getTimeOrigin3() {
        let timeOrigin = platform_1.otperformance.timeOrigin;
        if (typeof timeOrigin !== "number") {
          const perf = platform_1.otperformance;
          timeOrigin = perf.timing && perf.timing.fetchStart;
        }
        return timeOrigin;
      }
      exports.getTimeOrigin = getTimeOrigin3;
      function hrTime5(performanceNow) {
        const timeOrigin = millisToHrTime4(getTimeOrigin3());
        const now = millisToHrTime4(typeof performanceNow === "number" ? performanceNow : platform_1.otperformance.now());
        return addHrTimes3(timeOrigin, now);
      }
      exports.hrTime = hrTime5;
      function timeInputToHrTime3(time) {
        if (isTimeInputHrTime3(time)) {
          return time;
        } else if (typeof time === "number") {
          if (time < getTimeOrigin3()) {
            return hrTime5(time);
          } else {
            return millisToHrTime4(time);
          }
        } else if (time instanceof Date) {
          return millisToHrTime4(time.getTime());
        } else {
          throw TypeError("Invalid input type");
        }
      }
      exports.timeInputToHrTime = timeInputToHrTime3;
      function hrTimeDuration3(startTime, endTime) {
        let seconds = endTime[0] - startTime[0];
        let nanos = endTime[1] - startTime[1];
        if (nanos < 0) {
          seconds -= 1;
          nanos += SECOND_TO_NANOSECONDS2;
        }
        return [seconds, nanos];
      }
      exports.hrTimeDuration = hrTimeDuration3;
      function hrTimeToTimeStamp2(time) {
        const precision = NANOSECOND_DIGITS2;
        const tmp = `${"0".repeat(precision)}${time[1]}Z`;
        const nanoString = tmp.substr(tmp.length - precision - 1);
        const date = new Date(time[0] * 1e3).toISOString();
        return date.replace("000Z", nanoString);
      }
      exports.hrTimeToTimeStamp = hrTimeToTimeStamp2;
      function hrTimeToNanoseconds3(time) {
        return time[0] * SECOND_TO_NANOSECONDS2 + time[1];
      }
      exports.hrTimeToNanoseconds = hrTimeToNanoseconds3;
      function hrTimeToMilliseconds2(time) {
        return time[0] * 1e3 + time[1] / 1e6;
      }
      exports.hrTimeToMilliseconds = hrTimeToMilliseconds2;
      function hrTimeToMicroseconds3(time) {
        return time[0] * 1e6 + time[1] / 1e3;
      }
      exports.hrTimeToMicroseconds = hrTimeToMicroseconds3;
      function isTimeInputHrTime3(value) {
        return Array.isArray(value) && value.length === 2 && typeof value[0] === "number" && typeof value[1] === "number";
      }
      exports.isTimeInputHrTime = isTimeInputHrTime3;
      function isTimeInput3(value) {
        return isTimeInputHrTime3(value) || typeof value === "number" || value instanceof Date;
      }
      exports.isTimeInput = isTimeInput3;
      function addHrTimes3(time1, time2) {
        const out = [time1[0] + time2[0], time1[1] + time2[1]];
        if (out[1] >= SECOND_TO_NANOSECONDS2) {
          out[1] -= SECOND_TO_NANOSECONDS2;
          out[0] += 1;
        }
        return out;
      }
      exports.addHrTimes = addHrTimes3;
    }
  });

  // node_modules/@opentelemetry/core/build/src/ExportResult.js
  var require_ExportResult = __commonJS({
    "node_modules/@opentelemetry/core/build/src/ExportResult.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.ExportResultCode = void 0;
      var ExportResultCode5;
      (function(ExportResultCode6) {
        ExportResultCode6[ExportResultCode6["SUCCESS"] = 0] = "SUCCESS";
        ExportResultCode6[ExportResultCode6["FAILED"] = 1] = "FAILED";
      })(ExportResultCode5 = exports.ExportResultCode || (exports.ExportResultCode = {}));
    }
  });

  // node_modules/@opentelemetry/core/build/src/propagation/composite.js
  var require_composite = __commonJS({
    "node_modules/@opentelemetry/core/build/src/propagation/composite.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.CompositePropagator = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var CompositePropagator2 = class {
        /**
         * Construct a composite propagator from a list of propagators.
         *
         * @param [config] Configuration object for composite propagator
         */
        constructor(config = {}) {
          var _a2;
          this._propagators = (_a2 = config.propagators) !== null && _a2 !== void 0 ? _a2 : [];
          this._fields = Array.from(new Set(this._propagators.map((p) => typeof p.fields === "function" ? p.fields() : []).reduce((x, y) => x.concat(y), [])));
        }
        /**
         * Run each of the configured propagators with the given context and carrier.
         * Propagators are run in the order they are configured, so if multiple
         * propagators write the same carrier key, the propagator later in the list
         * will "win".
         *
         * @param context Context to inject
         * @param carrier Carrier into which context will be injected
         */
        inject(context2, carrier, setter) {
          for (const propagator of this._propagators) {
            try {
              propagator.inject(context2, carrier, setter);
            } catch (err2) {
              api_1.diag.warn(`Failed to inject with ${propagator.constructor.name}. Err: ${err2.message}`);
            }
          }
        }
        /**
         * Run each of the configured propagators with the given context and carrier.
         * Propagators are run in the order they are configured, so if multiple
         * propagators write the same context key, the propagator later in the list
         * will "win".
         *
         * @param context Context to add values to
         * @param carrier Carrier from which to extract context
         */
        extract(context2, carrier, getter) {
          return this._propagators.reduce((ctx, propagator) => {
            try {
              return propagator.extract(ctx, carrier, getter);
            } catch (err2) {
              api_1.diag.warn(`Failed to inject with ${propagator.constructor.name}. Err: ${err2.message}`);
            }
            return ctx;
          }, context2);
        }
        fields() {
          return this._fields.slice();
        }
      };
      exports.CompositePropagator = CompositePropagator2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/internal/validators.js
  var require_validators = __commonJS({
    "node_modules/@opentelemetry/core/build/src/internal/validators.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.validateValue = exports.validateKey = void 0;
      var VALID_KEY_CHAR_RANGE2 = "[_0-9a-z-*/]";
      var VALID_KEY2 = `[a-z]${VALID_KEY_CHAR_RANGE2}{0,255}`;
      var VALID_VENDOR_KEY2 = `[a-z0-9]${VALID_KEY_CHAR_RANGE2}{0,240}@[a-z]${VALID_KEY_CHAR_RANGE2}{0,13}`;
      var VALID_KEY_REGEX2 = new RegExp(`^(?:${VALID_KEY2}|${VALID_VENDOR_KEY2})$`);
      var VALID_VALUE_BASE_REGEX2 = /^[ -~]{0,255}[!-~]$/;
      var INVALID_VALUE_COMMA_EQUAL_REGEX2 = /,|=/;
      function validateKey2(key) {
        return VALID_KEY_REGEX2.test(key);
      }
      exports.validateKey = validateKey2;
      function validateValue2(value) {
        return VALID_VALUE_BASE_REGEX2.test(value) && !INVALID_VALUE_COMMA_EQUAL_REGEX2.test(value);
      }
      exports.validateValue = validateValue2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/TraceState.js
  var require_TraceState = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/TraceState.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.TraceState = void 0;
      var validators_1 = require_validators();
      var MAX_TRACE_STATE_ITEMS2 = 32;
      var MAX_TRACE_STATE_LEN2 = 512;
      var LIST_MEMBERS_SEPARATOR2 = ",";
      var LIST_MEMBER_KEY_VALUE_SPLITTER2 = "=";
      var TraceState = class _TraceState {
        constructor(rawTraceState) {
          this._internalState = /* @__PURE__ */ new Map();
          if (rawTraceState)
            this._parse(rawTraceState);
        }
        set(key, value) {
          const traceState = this._clone();
          if (traceState._internalState.has(key)) {
            traceState._internalState.delete(key);
          }
          traceState._internalState.set(key, value);
          return traceState;
        }
        unset(key) {
          const traceState = this._clone();
          traceState._internalState.delete(key);
          return traceState;
        }
        get(key) {
          return this._internalState.get(key);
        }
        serialize() {
          return this._keys().reduce((agg, key) => {
            agg.push(key + LIST_MEMBER_KEY_VALUE_SPLITTER2 + this.get(key));
            return agg;
          }, []).join(LIST_MEMBERS_SEPARATOR2);
        }
        _parse(rawTraceState) {
          if (rawTraceState.length > MAX_TRACE_STATE_LEN2)
            return;
          this._internalState = rawTraceState.split(LIST_MEMBERS_SEPARATOR2).reverse().reduce((agg, part) => {
            const listMember = part.trim();
            const i = listMember.indexOf(LIST_MEMBER_KEY_VALUE_SPLITTER2);
            if (i !== -1) {
              const key = listMember.slice(0, i);
              const value = listMember.slice(i + 1, part.length);
              if ((0, validators_1.validateKey)(key) && (0, validators_1.validateValue)(value)) {
                agg.set(key, value);
              } else {
              }
            }
            return agg;
          }, /* @__PURE__ */ new Map());
          if (this._internalState.size > MAX_TRACE_STATE_ITEMS2) {
            this._internalState = new Map(Array.from(this._internalState.entries()).reverse().slice(0, MAX_TRACE_STATE_ITEMS2));
          }
        }
        _keys() {
          return Array.from(this._internalState.keys()).reverse();
        }
        _clone() {
          const traceState = new _TraceState();
          traceState._internalState = new Map(this._internalState);
          return traceState;
        }
      };
      exports.TraceState = TraceState;
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/W3CTraceContextPropagator.js
  var require_W3CTraceContextPropagator = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/W3CTraceContextPropagator.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.W3CTraceContextPropagator = exports.parseTraceParent = exports.TRACE_STATE_HEADER = exports.TRACE_PARENT_HEADER = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var suppress_tracing_1 = require_suppress_tracing();
      var TraceState_1 = require_TraceState();
      exports.TRACE_PARENT_HEADER = "traceparent";
      exports.TRACE_STATE_HEADER = "tracestate";
      var VERSION5 = "00";
      var VERSION_PART = "(?!ff)[\\da-f]{2}";
      var TRACE_ID_PART = "(?![0]{32})[\\da-f]{32}";
      var PARENT_ID_PART = "(?![0]{16})[\\da-f]{16}";
      var FLAGS_PART = "[\\da-f]{2}";
      var TRACE_PARENT_REGEX = new RegExp(`^\\s?(${VERSION_PART})-(${TRACE_ID_PART})-(${PARENT_ID_PART})-(${FLAGS_PART})(-.*)?\\s?$`);
      function parseTraceParent(traceParent) {
        const match = TRACE_PARENT_REGEX.exec(traceParent);
        if (!match)
          return null;
        if (match[1] === "00" && match[5])
          return null;
        return {
          traceId: match[2],
          spanId: match[3],
          traceFlags: parseInt(match[4], 16)
        };
      }
      exports.parseTraceParent = parseTraceParent;
      var W3CTraceContextPropagator2 = class {
        inject(context2, carrier, setter) {
          const spanContext = api_1.trace.getSpanContext(context2);
          if (!spanContext || (0, suppress_tracing_1.isTracingSuppressed)(context2) || !(0, api_1.isSpanContextValid)(spanContext))
            return;
          const traceParent = `${VERSION5}-${spanContext.traceId}-${spanContext.spanId}-0${Number(spanContext.traceFlags || api_1.TraceFlags.NONE).toString(16)}`;
          setter.set(carrier, exports.TRACE_PARENT_HEADER, traceParent);
          if (spanContext.traceState) {
            setter.set(carrier, exports.TRACE_STATE_HEADER, spanContext.traceState.serialize());
          }
        }
        extract(context2, carrier, getter) {
          const traceParentHeader = getter.get(carrier, exports.TRACE_PARENT_HEADER);
          if (!traceParentHeader)
            return context2;
          const traceParent = Array.isArray(traceParentHeader) ? traceParentHeader[0] : traceParentHeader;
          if (typeof traceParent !== "string")
            return context2;
          const spanContext = parseTraceParent(traceParent);
          if (!spanContext)
            return context2;
          spanContext.isRemote = true;
          const traceStateHeader = getter.get(carrier, exports.TRACE_STATE_HEADER);
          if (traceStateHeader) {
            const state = Array.isArray(traceStateHeader) ? traceStateHeader.join(",") : traceStateHeader;
            spanContext.traceState = new TraceState_1.TraceState(typeof state === "string" ? state : void 0);
          }
          return api_1.trace.setSpanContext(context2, spanContext);
        }
        fields() {
          return [exports.TRACE_PARENT_HEADER, exports.TRACE_STATE_HEADER];
        }
      };
      exports.W3CTraceContextPropagator = W3CTraceContextPropagator2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/rpc-metadata.js
  var require_rpc_metadata = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/rpc-metadata.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.getRPCMetadata = exports.deleteRPCMetadata = exports.setRPCMetadata = exports.RPCType = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var RPC_METADATA_KEY = (0, api_1.createContextKey)("OpenTelemetry SDK Context Key RPC_METADATA");
      var RPCType;
      (function(RPCType2) {
        RPCType2["HTTP"] = "http";
      })(RPCType = exports.RPCType || (exports.RPCType = {}));
      function setRPCMetadata(context2, meta) {
        return context2.setValue(RPC_METADATA_KEY, meta);
      }
      exports.setRPCMetadata = setRPCMetadata;
      function deleteRPCMetadata(context2) {
        return context2.deleteValue(RPC_METADATA_KEY);
      }
      exports.deleteRPCMetadata = deleteRPCMetadata;
      function getRPCMetadata(context2) {
        return context2.getValue(RPC_METADATA_KEY);
      }
      exports.getRPCMetadata = getRPCMetadata;
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/sampler/AlwaysOffSampler.js
  var require_AlwaysOffSampler = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/sampler/AlwaysOffSampler.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.AlwaysOffSampler = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var AlwaysOffSampler2 = class {
        shouldSample() {
          return {
            decision: api_1.SamplingDecision.NOT_RECORD
          };
        }
        toString() {
          return "AlwaysOffSampler";
        }
      };
      exports.AlwaysOffSampler = AlwaysOffSampler2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/sampler/AlwaysOnSampler.js
  var require_AlwaysOnSampler = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/sampler/AlwaysOnSampler.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.AlwaysOnSampler = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var AlwaysOnSampler2 = class {
        shouldSample() {
          return {
            decision: api_1.SamplingDecision.RECORD_AND_SAMPLED
          };
        }
        toString() {
          return "AlwaysOnSampler";
        }
      };
      exports.AlwaysOnSampler = AlwaysOnSampler2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/sampler/ParentBasedSampler.js
  var require_ParentBasedSampler = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/sampler/ParentBasedSampler.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.ParentBasedSampler = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var global_error_handler_1 = require_global_error_handler();
      var AlwaysOffSampler_1 = require_AlwaysOffSampler();
      var AlwaysOnSampler_1 = require_AlwaysOnSampler();
      var ParentBasedSampler2 = class {
        constructor(config) {
          var _a2, _b, _c, _d;
          this._root = config.root;
          if (!this._root) {
            (0, global_error_handler_1.globalErrorHandler)(new Error("ParentBasedSampler must have a root sampler configured"));
            this._root = new AlwaysOnSampler_1.AlwaysOnSampler();
          }
          this._remoteParentSampled = (_a2 = config.remoteParentSampled) !== null && _a2 !== void 0 ? _a2 : new AlwaysOnSampler_1.AlwaysOnSampler();
          this._remoteParentNotSampled = (_b = config.remoteParentNotSampled) !== null && _b !== void 0 ? _b : new AlwaysOffSampler_1.AlwaysOffSampler();
          this._localParentSampled = (_c = config.localParentSampled) !== null && _c !== void 0 ? _c : new AlwaysOnSampler_1.AlwaysOnSampler();
          this._localParentNotSampled = (_d = config.localParentNotSampled) !== null && _d !== void 0 ? _d : new AlwaysOffSampler_1.AlwaysOffSampler();
        }
        shouldSample(context2, traceId, spanName, spanKind, attributes, links) {
          const parentContext = api_1.trace.getSpanContext(context2);
          if (!parentContext || !(0, api_1.isSpanContextValid)(parentContext)) {
            return this._root.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
          }
          if (parentContext.isRemote) {
            if (parentContext.traceFlags & api_1.TraceFlags.SAMPLED) {
              return this._remoteParentSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
            }
            return this._remoteParentNotSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
          }
          if (parentContext.traceFlags & api_1.TraceFlags.SAMPLED) {
            return this._localParentSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
          }
          return this._localParentNotSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
        }
        toString() {
          return `ParentBased{root=${this._root.toString()}, remoteParentSampled=${this._remoteParentSampled.toString()}, remoteParentNotSampled=${this._remoteParentNotSampled.toString()}, localParentSampled=${this._localParentSampled.toString()}, localParentNotSampled=${this._localParentNotSampled.toString()}}`;
        }
      };
      exports.ParentBasedSampler = ParentBasedSampler2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/trace/sampler/TraceIdRatioBasedSampler.js
  var require_TraceIdRatioBasedSampler = __commonJS({
    "node_modules/@opentelemetry/core/build/src/trace/sampler/TraceIdRatioBasedSampler.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.TraceIdRatioBasedSampler = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var TraceIdRatioBasedSampler2 = class {
        constructor(_ratio = 0) {
          this._ratio = _ratio;
          this._ratio = this._normalize(_ratio);
          this._upperBound = Math.floor(this._ratio * 4294967295);
        }
        shouldSample(context2, traceId) {
          return {
            decision: (0, api_1.isValidTraceId)(traceId) && this._accumulate(traceId) < this._upperBound ? api_1.SamplingDecision.RECORD_AND_SAMPLED : api_1.SamplingDecision.NOT_RECORD
          };
        }
        toString() {
          return `TraceIdRatioBased{${this._ratio}}`;
        }
        _normalize(ratio) {
          if (typeof ratio !== "number" || isNaN(ratio))
            return 0;
          return ratio >= 1 ? 1 : ratio <= 0 ? 0 : ratio;
        }
        _accumulate(traceId) {
          let accumulation = 0;
          for (let i = 0; i < traceId.length / 8; i++) {
            const pos = i * 8;
            const part = parseInt(traceId.slice(pos, pos + 8), 16);
            accumulation = (accumulation ^ part) >>> 0;
          }
          return accumulation;
        }
      };
      exports.TraceIdRatioBasedSampler = TraceIdRatioBasedSampler2;
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/lodash.merge.js
  var require_lodash_merge = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/lodash.merge.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.isPlainObject = void 0;
      var objectTag = "[object Object]";
      var nullTag = "[object Null]";
      var undefinedTag = "[object Undefined]";
      var funcProto = Function.prototype;
      var funcToString = funcProto.toString;
      var objectCtorString = funcToString.call(Object);
      var getPrototype = overArg(Object.getPrototypeOf, Object);
      var objectProto = Object.prototype;
      var hasOwnProperty = objectProto.hasOwnProperty;
      var symToStringTag = Symbol ? Symbol.toStringTag : void 0;
      var nativeObjectToString = objectProto.toString;
      function overArg(func, transform) {
        return function(arg) {
          return func(transform(arg));
        };
      }
      function isPlainObject(value) {
        if (!isObjectLike(value) || baseGetTag(value) !== objectTag) {
          return false;
        }
        const proto = getPrototype(value);
        if (proto === null) {
          return true;
        }
        const Ctor = hasOwnProperty.call(proto, "constructor") && proto.constructor;
        return typeof Ctor == "function" && Ctor instanceof Ctor && funcToString.call(Ctor) === objectCtorString;
      }
      exports.isPlainObject = isPlainObject;
      function isObjectLike(value) {
        return value != null && typeof value == "object";
      }
      function baseGetTag(value) {
        if (value == null) {
          return value === void 0 ? undefinedTag : nullTag;
        }
        return symToStringTag && symToStringTag in Object(value) ? getRawTag(value) : objectToString(value);
      }
      function getRawTag(value) {
        const isOwn = hasOwnProperty.call(value, symToStringTag), tag = value[symToStringTag];
        let unmasked = false;
        try {
          value[symToStringTag] = void 0;
          unmasked = true;
        } catch (e) {
        }
        const result = nativeObjectToString.call(value);
        if (unmasked) {
          if (isOwn) {
            value[symToStringTag] = tag;
          } else {
            delete value[symToStringTag];
          }
        }
        return result;
      }
      function objectToString(value) {
        return nativeObjectToString.call(value);
      }
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/merge.js
  var require_merge = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/merge.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.merge = void 0;
      var lodash_merge_1 = require_lodash_merge();
      var MAX_LEVEL = 20;
      function merge2(...args) {
        let result = args.shift();
        const objects = /* @__PURE__ */ new WeakMap();
        while (args.length > 0) {
          result = mergeTwoObjects(result, args.shift(), 0, objects);
        }
        return result;
      }
      exports.merge = merge2;
      function takeValue(value) {
        if (isArray(value)) {
          return value.slice();
        }
        return value;
      }
      function mergeTwoObjects(one, two, level = 0, objects) {
        let result;
        if (level > MAX_LEVEL) {
          return void 0;
        }
        level++;
        if (isPrimitive(one) || isPrimitive(two) || isFunction(two)) {
          result = takeValue(two);
        } else if (isArray(one)) {
          result = one.slice();
          if (isArray(two)) {
            for (let i = 0, j = two.length; i < j; i++) {
              result.push(takeValue(two[i]));
            }
          } else if (isObject(two)) {
            const keys = Object.keys(two);
            for (let i = 0, j = keys.length; i < j; i++) {
              const key = keys[i];
              result[key] = takeValue(two[key]);
            }
          }
        } else if (isObject(one)) {
          if (isObject(two)) {
            if (!shouldMerge(one, two)) {
              return two;
            }
            result = Object.assign({}, one);
            const keys = Object.keys(two);
            for (let i = 0, j = keys.length; i < j; i++) {
              const key = keys[i];
              const twoValue = two[key];
              if (isPrimitive(twoValue)) {
                if (typeof twoValue === "undefined") {
                  delete result[key];
                } else {
                  result[key] = twoValue;
                }
              } else {
                const obj1 = result[key];
                const obj2 = twoValue;
                if (wasObjectReferenced(one, key, objects) || wasObjectReferenced(two, key, objects)) {
                  delete result[key];
                } else {
                  if (isObject(obj1) && isObject(obj2)) {
                    const arr1 = objects.get(obj1) || [];
                    const arr2 = objects.get(obj2) || [];
                    arr1.push({ obj: one, key });
                    arr2.push({ obj: two, key });
                    objects.set(obj1, arr1);
                    objects.set(obj2, arr2);
                  }
                  result[key] = mergeTwoObjects(result[key], twoValue, level, objects);
                }
              }
            }
          } else {
            result = two;
          }
        }
        return result;
      }
      function wasObjectReferenced(obj, key, objects) {
        const arr = objects.get(obj[key]) || [];
        for (let i = 0, j = arr.length; i < j; i++) {
          const info = arr[i];
          if (info.key === key && info.obj === obj) {
            return true;
          }
        }
        return false;
      }
      function isArray(value) {
        return Array.isArray(value);
      }
      function isFunction(value) {
        return typeof value === "function";
      }
      function isObject(value) {
        return !isPrimitive(value) && !isArray(value) && !isFunction(value) && typeof value === "object";
      }
      function isPrimitive(value) {
        return typeof value === "string" || typeof value === "number" || typeof value === "boolean" || typeof value === "undefined" || value instanceof Date || value instanceof RegExp || value === null;
      }
      function shouldMerge(one, two) {
        if (!(0, lodash_merge_1.isPlainObject)(one) || !(0, lodash_merge_1.isPlainObject)(two)) {
          return false;
        }
        return true;
      }
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/timeout.js
  var require_timeout = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/timeout.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.callWithTimeout = exports.TimeoutError = void 0;
      var TimeoutError = class _TimeoutError extends Error {
        constructor(message) {
          super(message);
          Object.setPrototypeOf(this, _TimeoutError.prototype);
        }
      };
      exports.TimeoutError = TimeoutError;
      function callWithTimeout(promise, timeout) {
        let timeoutHandle;
        const timeoutPromise = new Promise(function timeoutFunction(_resolve, reject) {
          timeoutHandle = setTimeout(function timeoutHandler() {
            reject(new TimeoutError("Operation timed out."));
          }, timeout);
        });
        return Promise.race([promise, timeoutPromise]).then((result) => {
          clearTimeout(timeoutHandle);
          return result;
        }, (reason) => {
          clearTimeout(timeoutHandle);
          throw reason;
        });
      }
      exports.callWithTimeout = callWithTimeout;
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/url.js
  var require_url = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/url.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.isUrlIgnored = exports.urlMatches = void 0;
      function urlMatches2(url, urlToMatch) {
        if (typeof urlToMatch === "string") {
          return url === urlToMatch;
        } else {
          return !!url.match(urlToMatch);
        }
      }
      exports.urlMatches = urlMatches2;
      function isUrlIgnored3(url, ignoredUrls) {
        if (!ignoredUrls) {
          return false;
        }
        for (const ignoreUrl of ignoredUrls) {
          if (urlMatches2(url, ignoreUrl)) {
            return true;
          }
        }
        return false;
      }
      exports.isUrlIgnored = isUrlIgnored3;
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/wrap.js
  var require_wrap = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/wrap.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.isWrapped = void 0;
      function isWrapped3(func) {
        return typeof func === "function" && typeof func.__original === "function" && typeof func.__unwrap === "function" && func.__wrapped === true;
      }
      exports.isWrapped = isWrapped3;
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/promise.js
  var require_promise = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/promise.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.Deferred = void 0;
      var Deferred = class {
        constructor() {
          this._promise = new Promise((resolve, reject) => {
            this._resolve = resolve;
            this._reject = reject;
          });
        }
        get promise() {
          return this._promise;
        }
        resolve(val) {
          this._resolve(val);
        }
        reject(err2) {
          this._reject(err2);
        }
      };
      exports.Deferred = Deferred;
    }
  });

  // node_modules/@opentelemetry/core/build/src/utils/callback.js
  var require_callback = __commonJS({
    "node_modules/@opentelemetry/core/build/src/utils/callback.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.BindOnceFuture = void 0;
      var promise_1 = require_promise();
      var BindOnceFuture3 = class {
        constructor(_callback, _that) {
          this._callback = _callback;
          this._that = _that;
          this._isCalled = false;
          this._deferred = new promise_1.Deferred();
        }
        get isCalled() {
          return this._isCalled;
        }
        get promise() {
          return this._deferred.promise;
        }
        call(...args) {
          if (!this._isCalled) {
            this._isCalled = true;
            try {
              Promise.resolve(this._callback.call(this._that, ...args)).then((val) => this._deferred.resolve(val), (err2) => this._deferred.reject(err2));
            } catch (err2) {
              this._deferred.reject(err2);
            }
          }
          return this._deferred.promise;
        }
      };
      exports.BindOnceFuture = BindOnceFuture3;
    }
  });

  // node_modules/@opentelemetry/core/build/src/internal/exporter.js
  var require_exporter = __commonJS({
    "node_modules/@opentelemetry/core/build/src/internal/exporter.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports._export = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var suppress_tracing_1 = require_suppress_tracing();
      function _export(exporter, arg) {
        return new Promise((resolve) => {
          api_1.context.with((0, suppress_tracing_1.suppressTracing)(api_1.context.active()), () => {
            exporter.export(arg, (result) => {
              resolve(result);
            });
          });
        });
      }
      exports._export = _export;
    }
  });

  // node_modules/@opentelemetry/core/build/src/index.js
  var require_src = __commonJS({
    "node_modules/@opentelemetry/core/build/src/index.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT = exports.DEFAULT_ATTRIBUTE_COUNT_LIMIT = exports.TraceState = exports.unsuppressTracing = exports.suppressTracing = exports.isTracingSuppressed = exports.TraceIdRatioBasedSampler = exports.ParentBasedSampler = exports.AlwaysOnSampler = exports.AlwaysOffSampler = exports.setRPCMetadata = exports.getRPCMetadata = exports.deleteRPCMetadata = exports.RPCType = exports.parseTraceParent = exports.W3CTraceContextPropagator = exports.TRACE_STATE_HEADER = exports.TRACE_PARENT_HEADER = exports.CompositePropagator = exports.unrefTimer = exports.otperformance = exports.hexToBase64 = exports.getEnvWithoutDefaults = exports.getEnv = exports._globalThis = exports.SDK_INFO = exports.RandomIdGenerator = exports.baggageUtils = exports.ExportResultCode = exports.hexToBinary = exports.timeInputToHrTime = exports.millisToHrTime = exports.isTimeInputHrTime = exports.isTimeInput = exports.hrTimeToTimeStamp = exports.hrTimeToNanoseconds = exports.hrTimeToMilliseconds = exports.hrTimeToMicroseconds = exports.hrTimeDuration = exports.hrTime = exports.getTimeOrigin = exports.addHrTimes = exports.loggingErrorHandler = exports.setGlobalErrorHandler = exports.globalErrorHandler = exports.sanitizeAttributes = exports.isAttributeValue = exports.isAttributeKey = exports.AnchoredClock = exports.W3CBaggagePropagator = void 0;
      exports.internal = exports.VERSION = exports.BindOnceFuture = exports.isWrapped = exports.urlMatches = exports.isUrlIgnored = exports.callWithTimeout = exports.TimeoutError = exports.TracesSamplerValues = exports.merge = exports.parseEnvironment = exports.DEFAULT_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT = exports.DEFAULT_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT = exports.DEFAULT_ENVIRONMENT = void 0;
      var W3CBaggagePropagator_1 = require_W3CBaggagePropagator();
      Object.defineProperty(exports, "W3CBaggagePropagator", { enumerable: true, get: function() {
        return W3CBaggagePropagator_1.W3CBaggagePropagator;
      } });
      var anchored_clock_1 = require_anchored_clock();
      Object.defineProperty(exports, "AnchoredClock", { enumerable: true, get: function() {
        return anchored_clock_1.AnchoredClock;
      } });
      var attributes_1 = require_attributes();
      Object.defineProperty(exports, "isAttributeKey", { enumerable: true, get: function() {
        return attributes_1.isAttributeKey;
      } });
      Object.defineProperty(exports, "isAttributeValue", { enumerable: true, get: function() {
        return attributes_1.isAttributeValue;
      } });
      Object.defineProperty(exports, "sanitizeAttributes", { enumerable: true, get: function() {
        return attributes_1.sanitizeAttributes;
      } });
      var global_error_handler_1 = require_global_error_handler();
      Object.defineProperty(exports, "globalErrorHandler", { enumerable: true, get: function() {
        return global_error_handler_1.globalErrorHandler;
      } });
      Object.defineProperty(exports, "setGlobalErrorHandler", { enumerable: true, get: function() {
        return global_error_handler_1.setGlobalErrorHandler;
      } });
      var logging_error_handler_1 = require_logging_error_handler();
      Object.defineProperty(exports, "loggingErrorHandler", { enumerable: true, get: function() {
        return logging_error_handler_1.loggingErrorHandler;
      } });
      var time_1 = require_time();
      Object.defineProperty(exports, "addHrTimes", { enumerable: true, get: function() {
        return time_1.addHrTimes;
      } });
      Object.defineProperty(exports, "getTimeOrigin", { enumerable: true, get: function() {
        return time_1.getTimeOrigin;
      } });
      Object.defineProperty(exports, "hrTime", { enumerable: true, get: function() {
        return time_1.hrTime;
      } });
      Object.defineProperty(exports, "hrTimeDuration", { enumerable: true, get: function() {
        return time_1.hrTimeDuration;
      } });
      Object.defineProperty(exports, "hrTimeToMicroseconds", { enumerable: true, get: function() {
        return time_1.hrTimeToMicroseconds;
      } });
      Object.defineProperty(exports, "hrTimeToMilliseconds", { enumerable: true, get: function() {
        return time_1.hrTimeToMilliseconds;
      } });
      Object.defineProperty(exports, "hrTimeToNanoseconds", { enumerable: true, get: function() {
        return time_1.hrTimeToNanoseconds;
      } });
      Object.defineProperty(exports, "hrTimeToTimeStamp", { enumerable: true, get: function() {
        return time_1.hrTimeToTimeStamp;
      } });
      Object.defineProperty(exports, "isTimeInput", { enumerable: true, get: function() {
        return time_1.isTimeInput;
      } });
      Object.defineProperty(exports, "isTimeInputHrTime", { enumerable: true, get: function() {
        return time_1.isTimeInputHrTime;
      } });
      Object.defineProperty(exports, "millisToHrTime", { enumerable: true, get: function() {
        return time_1.millisToHrTime;
      } });
      Object.defineProperty(exports, "timeInputToHrTime", { enumerable: true, get: function() {
        return time_1.timeInputToHrTime;
      } });
      var hex_to_binary_1 = require_hex_to_binary();
      Object.defineProperty(exports, "hexToBinary", { enumerable: true, get: function() {
        return hex_to_binary_1.hexToBinary;
      } });
      var ExportResult_1 = require_ExportResult();
      Object.defineProperty(exports, "ExportResultCode", { enumerable: true, get: function() {
        return ExportResult_1.ExportResultCode;
      } });
      var utils_1 = require_utils();
      exports.baggageUtils = {
        getKeyPairs: utils_1.getKeyPairs,
        serializeKeyPairs: utils_1.serializeKeyPairs,
        parseKeyPairsIntoRecord: utils_1.parseKeyPairsIntoRecord,
        parsePairKeyValue: utils_1.parsePairKeyValue
      };
      var platform_1 = require_browser();
      Object.defineProperty(exports, "RandomIdGenerator", { enumerable: true, get: function() {
        return platform_1.RandomIdGenerator;
      } });
      Object.defineProperty(exports, "SDK_INFO", { enumerable: true, get: function() {
        return platform_1.SDK_INFO;
      } });
      Object.defineProperty(exports, "_globalThis", { enumerable: true, get: function() {
        return platform_1._globalThis;
      } });
      Object.defineProperty(exports, "getEnv", { enumerable: true, get: function() {
        return platform_1.getEnv;
      } });
      Object.defineProperty(exports, "getEnvWithoutDefaults", { enumerable: true, get: function() {
        return platform_1.getEnvWithoutDefaults;
      } });
      Object.defineProperty(exports, "hexToBase64", { enumerable: true, get: function() {
        return platform_1.hexToBase64;
      } });
      Object.defineProperty(exports, "otperformance", { enumerable: true, get: function() {
        return platform_1.otperformance;
      } });
      Object.defineProperty(exports, "unrefTimer", { enumerable: true, get: function() {
        return platform_1.unrefTimer;
      } });
      var composite_1 = require_composite();
      Object.defineProperty(exports, "CompositePropagator", { enumerable: true, get: function() {
        return composite_1.CompositePropagator;
      } });
      var W3CTraceContextPropagator_1 = require_W3CTraceContextPropagator();
      Object.defineProperty(exports, "TRACE_PARENT_HEADER", { enumerable: true, get: function() {
        return W3CTraceContextPropagator_1.TRACE_PARENT_HEADER;
      } });
      Object.defineProperty(exports, "TRACE_STATE_HEADER", { enumerable: true, get: function() {
        return W3CTraceContextPropagator_1.TRACE_STATE_HEADER;
      } });
      Object.defineProperty(exports, "W3CTraceContextPropagator", { enumerable: true, get: function() {
        return W3CTraceContextPropagator_1.W3CTraceContextPropagator;
      } });
      Object.defineProperty(exports, "parseTraceParent", { enumerable: true, get: function() {
        return W3CTraceContextPropagator_1.parseTraceParent;
      } });
      var rpc_metadata_1 = require_rpc_metadata();
      Object.defineProperty(exports, "RPCType", { enumerable: true, get: function() {
        return rpc_metadata_1.RPCType;
      } });
      Object.defineProperty(exports, "deleteRPCMetadata", { enumerable: true, get: function() {
        return rpc_metadata_1.deleteRPCMetadata;
      } });
      Object.defineProperty(exports, "getRPCMetadata", { enumerable: true, get: function() {
        return rpc_metadata_1.getRPCMetadata;
      } });
      Object.defineProperty(exports, "setRPCMetadata", { enumerable: true, get: function() {
        return rpc_metadata_1.setRPCMetadata;
      } });
      var AlwaysOffSampler_1 = require_AlwaysOffSampler();
      Object.defineProperty(exports, "AlwaysOffSampler", { enumerable: true, get: function() {
        return AlwaysOffSampler_1.AlwaysOffSampler;
      } });
      var AlwaysOnSampler_1 = require_AlwaysOnSampler();
      Object.defineProperty(exports, "AlwaysOnSampler", { enumerable: true, get: function() {
        return AlwaysOnSampler_1.AlwaysOnSampler;
      } });
      var ParentBasedSampler_1 = require_ParentBasedSampler();
      Object.defineProperty(exports, "ParentBasedSampler", { enumerable: true, get: function() {
        return ParentBasedSampler_1.ParentBasedSampler;
      } });
      var TraceIdRatioBasedSampler_1 = require_TraceIdRatioBasedSampler();
      Object.defineProperty(exports, "TraceIdRatioBasedSampler", { enumerable: true, get: function() {
        return TraceIdRatioBasedSampler_1.TraceIdRatioBasedSampler;
      } });
      var suppress_tracing_1 = require_suppress_tracing();
      Object.defineProperty(exports, "isTracingSuppressed", { enumerable: true, get: function() {
        return suppress_tracing_1.isTracingSuppressed;
      } });
      Object.defineProperty(exports, "suppressTracing", { enumerable: true, get: function() {
        return suppress_tracing_1.suppressTracing;
      } });
      Object.defineProperty(exports, "unsuppressTracing", { enumerable: true, get: function() {
        return suppress_tracing_1.unsuppressTracing;
      } });
      var TraceState_1 = require_TraceState();
      Object.defineProperty(exports, "TraceState", { enumerable: true, get: function() {
        return TraceState_1.TraceState;
      } });
      var environment_1 = require_environment();
      Object.defineProperty(exports, "DEFAULT_ATTRIBUTE_COUNT_LIMIT", { enumerable: true, get: function() {
        return environment_1.DEFAULT_ATTRIBUTE_COUNT_LIMIT;
      } });
      Object.defineProperty(exports, "DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT", { enumerable: true, get: function() {
        return environment_1.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT;
      } });
      Object.defineProperty(exports, "DEFAULT_ENVIRONMENT", { enumerable: true, get: function() {
        return environment_1.DEFAULT_ENVIRONMENT;
      } });
      Object.defineProperty(exports, "DEFAULT_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT", { enumerable: true, get: function() {
        return environment_1.DEFAULT_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT;
      } });
      Object.defineProperty(exports, "DEFAULT_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT", { enumerable: true, get: function() {
        return environment_1.DEFAULT_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT;
      } });
      Object.defineProperty(exports, "parseEnvironment", { enumerable: true, get: function() {
        return environment_1.parseEnvironment;
      } });
      var merge_1 = require_merge();
      Object.defineProperty(exports, "merge", { enumerable: true, get: function() {
        return merge_1.merge;
      } });
      var sampling_1 = require_sampling();
      Object.defineProperty(exports, "TracesSamplerValues", { enumerable: true, get: function() {
        return sampling_1.TracesSamplerValues;
      } });
      var timeout_1 = require_timeout();
      Object.defineProperty(exports, "TimeoutError", { enumerable: true, get: function() {
        return timeout_1.TimeoutError;
      } });
      Object.defineProperty(exports, "callWithTimeout", { enumerable: true, get: function() {
        return timeout_1.callWithTimeout;
      } });
      var url_1 = require_url();
      Object.defineProperty(exports, "isUrlIgnored", { enumerable: true, get: function() {
        return url_1.isUrlIgnored;
      } });
      Object.defineProperty(exports, "urlMatches", { enumerable: true, get: function() {
        return url_1.urlMatches;
      } });
      var wrap_1 = require_wrap();
      Object.defineProperty(exports, "isWrapped", { enumerable: true, get: function() {
        return wrap_1.isWrapped;
      } });
      var callback_1 = require_callback();
      Object.defineProperty(exports, "BindOnceFuture", { enumerable: true, get: function() {
        return callback_1.BindOnceFuture;
      } });
      var version_1 = require_version();
      Object.defineProperty(exports, "VERSION", { enumerable: true, get: function() {
        return version_1.VERSION;
      } });
      var exporter_1 = require_exporter();
      exports.internal = {
        _export: exporter_1._export
      };
    }
  });

  // node_modules/shimmer/index.js
  var require_shimmer = __commonJS({
    "node_modules/shimmer/index.js"(exports, module) {
      "use strict";
      function isFunction(funktion) {
        return typeof funktion === "function";
      }
      var logger = console.error.bind(console);
      function defineProperty(obj, name, value) {
        var enumerable = !!obj[name] && obj.propertyIsEnumerable(name);
        Object.defineProperty(obj, name, {
          configurable: true,
          enumerable,
          writable: true,
          value
        });
      }
      function shimmer5(options) {
        if (options && options.logger) {
          if (!isFunction(options.logger)) logger("new logger isn't a function, not replacing");
          else logger = options.logger;
        }
      }
      function wrap5(nodule, name, wrapper) {
        if (!nodule || !nodule[name]) {
          logger("no original function " + name + " to wrap");
          return;
        }
        if (!wrapper) {
          logger("no wrapper function");
          logger(new Error().stack);
          return;
        }
        if (!isFunction(nodule[name]) || !isFunction(wrapper)) {
          logger("original object and wrapper must be functions");
          return;
        }
        var original = nodule[name];
        var wrapped = wrapper(original, name);
        defineProperty(wrapped, "__original", original);
        defineProperty(wrapped, "__unwrap", function() {
          if (nodule[name] === wrapped) defineProperty(nodule, name, original);
        });
        defineProperty(wrapped, "__wrapped", true);
        defineProperty(nodule, name, wrapped);
        return wrapped;
      }
      function massWrap5(nodules, names, wrapper) {
        if (!nodules) {
          logger("must provide one or more modules to patch");
          logger(new Error().stack);
          return;
        } else if (!Array.isArray(nodules)) {
          nodules = [nodules];
        }
        if (!(names && Array.isArray(names))) {
          logger("must provide one or more functions to wrap on modules");
          return;
        }
        nodules.forEach(function(nodule) {
          names.forEach(function(name) {
            wrap5(nodule, name, wrapper);
          });
        });
      }
      function unwrap5(nodule, name) {
        if (!nodule || !nodule[name]) {
          logger("no function to unwrap.");
          logger(new Error().stack);
          return;
        }
        if (!nodule[name].__unwrap) {
          logger("no original to unwrap to -- has " + name + " already been unwrapped?");
        } else {
          return nodule[name].__unwrap();
        }
      }
      function massUnwrap5(nodules, names) {
        if (!nodules) {
          logger("must provide one or more modules to patch");
          logger(new Error().stack);
          return;
        } else if (!Array.isArray(nodules)) {
          nodules = [nodules];
        }
        if (!(names && Array.isArray(names))) {
          logger("must provide one or more functions to unwrap on modules");
          return;
        }
        nodules.forEach(function(nodule) {
          names.forEach(function(name) {
            unwrap5(nodule, name);
          });
        });
      }
      shimmer5.wrap = wrap5;
      shimmer5.massWrap = massWrap5;
      shimmer5.unwrap = unwrap5;
      shimmer5.massUnwrap = massUnwrap5;
      module.exports = shimmer5;
    }
  });

  // node_modules/@apexthirdparty/opentelemetry-sdk-trace-base/build/src/export/BatchSpanProcessorBase.js
  var require_BatchSpanProcessorBase = __commonJS({
    "node_modules/@apexthirdparty/opentelemetry-sdk-trace-base/build/src/export/BatchSpanProcessorBase.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.BatchSpanProcessorBase = void 0;
      var api_1 = (init_esm(), __toCommonJS(esm_exports));
      var core_1 = require_src();
      var BatchSpanProcessorBase3 = class {
        constructor(_exporter, config) {
          this._exporter = _exporter;
          this._isExporting = false;
          this._finishedSpans = [];
          this._droppedSpansCount = 0;
          const env2 = (0, core_1.getEnv)();
          this._maxExportBatchSize = typeof (config === null || config === void 0 ? void 0 : config.maxExportBatchSize) === "number" ? config.maxExportBatchSize : env2.OTEL_BSP_MAX_EXPORT_BATCH_SIZE;
          this._maxQueueSize = typeof (config === null || config === void 0 ? void 0 : config.maxQueueSize) === "number" ? config.maxQueueSize : env2.OTEL_BSP_MAX_QUEUE_SIZE;
          this._scheduledDelayMillis = typeof (config === null || config === void 0 ? void 0 : config.scheduledDelayMillis) === "number" ? config.scheduledDelayMillis : env2.OTEL_BSP_SCHEDULE_DELAY;
          this._exportTimeoutMillis = typeof (config === null || config === void 0 ? void 0 : config.exportTimeoutMillis) === "number" ? config.exportTimeoutMillis : env2.OTEL_BSP_EXPORT_TIMEOUT;
          this._shutdownOnce = new core_1.BindOnceFuture(this._shutdown, this);
          if (this._maxExportBatchSize > this._maxQueueSize) {
            api_1.diag.warn("BatchSpanProcessor: maxExportBatchSize must be smaller or equal to maxQueueSize, setting maxExportBatchSize to match maxQueueSize");
            this._maxExportBatchSize = this._maxQueueSize;
          }
        }
        forceFlush() {
          if (this._shutdownOnce.isCalled) {
            return this._shutdownOnce.promise;
          }
          return this._flushAll();
        }
        // does nothing.
        onStart(_span, _parentContext) {
        }
        onEnd(span) {
          if (this._shutdownOnce.isCalled) {
            return;
          }
          if ((span.spanContext().traceFlags & api_1.TraceFlags.SAMPLED) === 0) {
            return;
          }
          this._addToBuffer(span);
        }
        shutdown() {
          return this._shutdownOnce.call();
        }
        _shutdown() {
          return Promise.resolve().then(() => {
            return this.onShutdown();
          }).then(() => {
            return this._flushAll();
          }).then(() => {
            return this._exporter.shutdown();
          });
        }
        /** Add a span in the buffer. */
        _addToBuffer(span) {
          if (this._finishedSpans.length >= this._maxQueueSize) {
            if (this._droppedSpansCount === 0) {
              api_1.diag.debug("maxQueueSize reached, dropping spans");
            }
            this._droppedSpansCount++;
            return;
          }
          if (this._droppedSpansCount > 0) {
            api_1.diag.warn(`Dropped ${this._droppedSpansCount} spans because maxQueueSize reached`);
            this._droppedSpansCount = 0;
          }
          this._finishedSpans.push(span);
          this._maybeStartTimer();
        }
        /**
         * Send all spans to the exporter respecting the batch size limit
         * This function is used only on forceFlush or shutdown,
         * for all other cases _flush should be used
         * */
        _flushAll() {
          return new Promise((resolve, reject) => {
            const promises = [];
            const count = Math.ceil(this._finishedSpans.length / this._maxExportBatchSize);
            for (let i = 0, j = count; i < j; i++) {
              promises.push(this._flushOneBatch());
            }
            Promise.all(promises).then(() => {
              resolve();
            }).catch(reject);
          });
        }
        _flushOneBatch() {
          this._clearTimer();
          if (this._finishedSpans.length === 0) {
            return Promise.resolve();
          }
          return new Promise((resolve, reject) => {
            const timer = setTimeout(() => {
              reject(new Error("Timeout"));
            }, this._exportTimeoutMillis);
            api_1.context.with((0, core_1.suppressTracing)(api_1.context.active()), () => {
              let spans;
              if (this._finishedSpans.length <= this._maxExportBatchSize) {
                spans = this._finishedSpans;
                this._finishedSpans = [];
              } else {
                spans = this._finishedSpans.splice(0, this._maxExportBatchSize);
              }
              const doExport = () => this._exporter.export(spans, (result) => {
                var _a2;
                clearTimeout(timer);
                if (result.code === core_1.ExportResultCode.SUCCESS) {
                  resolve();
                } else {
                  reject((_a2 = result.error) !== null && _a2 !== void 0 ? _a2 : new Error("BatchSpanProcessor: span export failed"));
                }
              });
              let pendingResources = null;
              for (let i = 0, len = spans.length; i < len; i++) {
                const span = spans[i];
                if (span.resource.asyncAttributesPending && span.resource.waitForAsyncAttributes) {
                  pendingResources !== null && pendingResources !== void 0 ? pendingResources : pendingResources = [];
                  pendingResources.push(span.resource.waitForAsyncAttributes());
                }
              }
              if (pendingResources === null) {
                doExport();
              } else {
                Promise.all(pendingResources).then(doExport, (err2) => {
                  (0, core_1.globalErrorHandler)(err2);
                  reject(err2);
                });
              }
            });
          });
        }
        _maybeStartTimer() {
          if (this._isExporting)
            return;
          const flush = () => {
            this._isExporting = true;
            this._flushOneBatch().finally(() => {
              this._isExporting = false;
              if (this._finishedSpans.length > 0) {
                this._clearTimer();
                this._maybeStartTimer();
              }
            }).catch((e) => {
              this._isExporting = false;
              (0, core_1.globalErrorHandler)(e);
            });
          };
          if (this._finishedSpans.length >= this._maxExportBatchSize) {
            return flush();
          }
          if (this._timer !== void 0)
            return;
          this._timer = setTimeout(() => flush(), this._scheduledDelayMillis);
          (0, core_1.unrefTimer)(this._timer);
        }
        _clearTimer() {
          if (this._timer !== void 0) {
            clearTimeout(this._timer);
            this._timer = void 0;
          }
        }
      };
      exports.BatchSpanProcessorBase = BatchSpanProcessorBase3;
    }
  });

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/Tracer.js
  init_esm();
  var import_core6 = __toESM(require_src());

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/Span.js
  init_esm();
  var import_core = __toESM(require_src());
  init_esm2();

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/enums.js
  var ExceptionEventName = "exception";

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/Span.js
  var __values2 = function(o) {
    var s = typeof Symbol === "function" && Symbol.iterator, m = s && o[s], i = 0;
    if (m) return m.call(o);
    if (o && typeof o.length === "number") return {
      next: function() {
        if (o && i >= o.length) o = void 0;
        return { value: o && o[i++], done: !o };
      }
    };
    throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
  };
  var __read6 = function(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
      while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    } catch (error) {
      e = { error };
    } finally {
      try {
        if (r && !r.done && (m = i["return"])) m.call(i);
      } finally {
        if (e) throw e.error;
      }
    }
    return ar;
  };
  var __spreadArray5 = function(to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
      if (ar || !(i in from)) {
        if (!ar) ar = Array.prototype.slice.call(from, 0, i);
        ar[i] = from[i];
      }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
  };
  var Span = (
    /** @class */
    function() {
      function Span2(parentTracer, context2, spanName, spanContext, kind, parentSpanId, links, startTime, _deprecatedClock, attributes) {
        if (links === void 0) {
          links = [];
        }
        this.attributes = {};
        this.links = [];
        this.events = [];
        this._droppedAttributesCount = 0;
        this._droppedEventsCount = 0;
        this._droppedLinksCount = 0;
        this.status = {
          code: SpanStatusCode.UNSET
        };
        this.endTime = [0, 0];
        this._ended = false;
        this._duration = [-1, -1];
        this.name = spanName;
        this._spanContext = spanContext;
        this.parentSpanId = parentSpanId;
        this.kind = kind;
        this.links = links;
        var now = Date.now();
        this._performanceStartTime = import_core.otperformance.now();
        this._performanceOffset = now - (this._performanceStartTime + (0, import_core.getTimeOrigin)());
        this._startTimeProvided = startTime != null;
        this.startTime = this._getTime(startTime !== null && startTime !== void 0 ? startTime : now);
        this.resource = parentTracer.resource;
        this.instrumentationLibrary = parentTracer.instrumentationLibrary;
        this._spanLimits = parentTracer.getSpanLimits();
        this._attributeValueLengthLimit = this._spanLimits.attributeValueLengthLimit || 0;
        if (attributes != null) {
          this.setAttributes(attributes);
        }
        this._spanProcessor = parentTracer.getActiveSpanProcessor();
        this._spanProcessor.onStart(this, context2);
      }
      Span2.prototype.spanContext = function() {
        return this._spanContext;
      };
      Span2.prototype.setAttribute = function(key, value) {
        if (value == null || this._isSpanEnded())
          return this;
        if (key.length === 0) {
          diag2.warn("Invalid attribute key: " + key);
          return this;
        }
        if (!(0, import_core.isAttributeValue)(value)) {
          diag2.warn("Invalid attribute value set for key: " + key);
          return this;
        }
        if (Object.keys(this.attributes).length >= this._spanLimits.attributeCountLimit && !Object.prototype.hasOwnProperty.call(this.attributes, key)) {
          this._droppedAttributesCount++;
          return this;
        }
        this.attributes[key] = this._truncateToSize(value);
        return this;
      };
      Span2.prototype.setAttributes = function(attributes) {
        var e_1, _a2;
        try {
          for (var _b = __values2(Object.entries(attributes)), _c = _b.next(); !_c.done; _c = _b.next()) {
            var _d = __read6(_c.value, 2), k = _d[0], v = _d[1];
            this.setAttribute(k, v);
          }
        } catch (e_1_1) {
          e_1 = { error: e_1_1 };
        } finally {
          try {
            if (_c && !_c.done && (_a2 = _b.return)) _a2.call(_b);
          } finally {
            if (e_1) throw e_1.error;
          }
        }
        return this;
      };
      Span2.prototype.addEvent = function(name, attributesOrStartTime, timeStamp) {
        if (this._isSpanEnded())
          return this;
        if (this._spanLimits.eventCountLimit === 0) {
          diag2.warn("No events allowed.");
          this._droppedEventsCount++;
          return this;
        }
        if (this.events.length >= this._spanLimits.eventCountLimit) {
          if (this._droppedEventsCount === 0) {
            diag2.debug("Dropping extra events.");
          }
          this.events.shift();
          this._droppedEventsCount++;
        }
        if ((0, import_core.isTimeInput)(attributesOrStartTime)) {
          if (!(0, import_core.isTimeInput)(timeStamp)) {
            timeStamp = attributesOrStartTime;
          }
          attributesOrStartTime = void 0;
        }
        var attributes = (0, import_core.sanitizeAttributes)(attributesOrStartTime);
        this.events.push({
          name,
          attributes,
          time: this._getTime(timeStamp),
          droppedAttributesCount: 0
        });
        return this;
      };
      Span2.prototype.addLink = function(link) {
        this.links.push(link);
        return this;
      };
      Span2.prototype.addLinks = function(links) {
        var _a2;
        (_a2 = this.links).push.apply(_a2, __spreadArray5([], __read6(links), false));
        return this;
      };
      Span2.prototype.setStatus = function(status) {
        if (this._isSpanEnded())
          return this;
        this.status = status;
        return this;
      };
      Span2.prototype.updateName = function(name) {
        if (this._isSpanEnded())
          return this;
        this.name = name;
        return this;
      };
      Span2.prototype.end = function(endTime) {
        if (this._isSpanEnded()) {
          diag2.error(this.name + " " + this._spanContext.traceId + "-" + this._spanContext.spanId + " - You can only call end() on a span once.");
          return;
        }
        this._ended = true;
        this.endTime = this._getTime(endTime);
        this._duration = (0, import_core.hrTimeDuration)(this.startTime, this.endTime);
        if (this._duration[0] < 0) {
          diag2.warn("Inconsistent start and end time, startTime > endTime. Setting span duration to 0ms.", this.startTime, this.endTime);
          this.endTime = this.startTime.slice();
          this._duration = [0, 0];
        }
        if (this._droppedEventsCount > 0) {
          diag2.warn("Dropped " + this._droppedEventsCount + " events because eventCountLimit reached");
        }
        this._spanProcessor.onEnd(this);
      };
      Span2.prototype._getTime = function(inp) {
        if (typeof inp === "number" && inp < import_core.otperformance.now()) {
          return (0, import_core.hrTime)(inp + this._performanceOffset);
        }
        if (typeof inp === "number") {
          return (0, import_core.millisToHrTime)(inp);
        }
        if (inp instanceof Date) {
          return (0, import_core.millisToHrTime)(inp.getTime());
        }
        if ((0, import_core.isTimeInputHrTime)(inp)) {
          return inp;
        }
        if (this._startTimeProvided) {
          return (0, import_core.millisToHrTime)(Date.now());
        }
        var msDuration = import_core.otperformance.now() - this._performanceStartTime;
        return (0, import_core.addHrTimes)(this.startTime, (0, import_core.millisToHrTime)(msDuration));
      };
      Span2.prototype.isRecording = function() {
        return this._ended === false;
      };
      Span2.prototype.recordException = function(exception, time) {
        var attributes = {};
        if (typeof exception === "string") {
          attributes[SEMATTRS_EXCEPTION_MESSAGE] = exception;
        } else if (exception) {
          if (exception.code) {
            attributes[SEMATTRS_EXCEPTION_TYPE] = exception.code.toString();
          } else if (exception.name) {
            attributes[SEMATTRS_EXCEPTION_TYPE] = exception.name;
          }
          if (exception.message) {
            attributes[SEMATTRS_EXCEPTION_MESSAGE] = exception.message;
          }
          if (exception.stack) {
            attributes[SEMATTRS_EXCEPTION_STACKTRACE] = exception.stack;
          }
        }
        if (attributes[SEMATTRS_EXCEPTION_TYPE] || attributes[SEMATTRS_EXCEPTION_MESSAGE]) {
          this.addEvent(ExceptionEventName, attributes, time);
        } else {
          diag2.warn("Failed to record an exception " + exception);
        }
      };
      Object.defineProperty(Span2.prototype, "duration", {
        get: function() {
          return this._duration;
        },
        enumerable: false,
        configurable: true
      });
      Object.defineProperty(Span2.prototype, "ended", {
        get: function() {
          return this._ended;
        },
        enumerable: false,
        configurable: true
      });
      Object.defineProperty(Span2.prototype, "droppedAttributesCount", {
        get: function() {
          return this._droppedAttributesCount;
        },
        enumerable: false,
        configurable: true
      });
      Object.defineProperty(Span2.prototype, "droppedEventsCount", {
        get: function() {
          return this._droppedEventsCount;
        },
        enumerable: false,
        configurable: true
      });
      Object.defineProperty(Span2.prototype, "droppedLinksCount", {
        get: function() {
          return this._droppedLinksCount;
        },
        enumerable: false,
        configurable: true
      });
      Span2.prototype._isSpanEnded = function() {
        if (this._ended) {
          diag2.warn("Can not execute the operation on ended Span {traceId: " + this._spanContext.traceId + ", spanId: " + this._spanContext.spanId + "}");
        }
        return this._ended;
      };
      Span2.prototype._truncateToLimitUtil = function(value, limit) {
        if (value.length <= limit) {
          return value;
        }
        return value.substr(0, limit);
      };
      Span2.prototype._truncateToSize = function(value) {
        var _this = this;
        var limit = this._attributeValueLengthLimit;
        if (limit <= 0) {
          diag2.warn("Attribute value limit must be positive, got " + limit);
          return value;
        }
        if (typeof value === "string") {
          return this._truncateToLimitUtil(value, limit);
        }
        if (Array.isArray(value)) {
          return value.map(function(val) {
            return typeof val === "string" ? _this._truncateToLimitUtil(val, limit) : val;
          });
        }
        return value;
      };
      return Span2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/config.js
  init_esm();
  var import_core3 = __toESM(require_src());

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/Sampler.js
  var SamplingDecision2;
  (function(SamplingDecision3) {
    SamplingDecision3[SamplingDecision3["NOT_RECORD"] = 0] = "NOT_RECORD";
    SamplingDecision3[SamplingDecision3["RECORD"] = 1] = "RECORD";
    SamplingDecision3[SamplingDecision3["RECORD_AND_SAMPLED"] = 2] = "RECORD_AND_SAMPLED";
  })(SamplingDecision2 || (SamplingDecision2 = {}));

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/sampler/AlwaysOffSampler.js
  var AlwaysOffSampler = (
    /** @class */
    function() {
      function AlwaysOffSampler2() {
      }
      AlwaysOffSampler2.prototype.shouldSample = function() {
        return {
          decision: SamplingDecision2.NOT_RECORD
        };
      };
      AlwaysOffSampler2.prototype.toString = function() {
        return "AlwaysOffSampler";
      };
      return AlwaysOffSampler2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/sampler/AlwaysOnSampler.js
  var AlwaysOnSampler = (
    /** @class */
    function() {
      function AlwaysOnSampler2() {
      }
      AlwaysOnSampler2.prototype.shouldSample = function() {
        return {
          decision: SamplingDecision2.RECORD_AND_SAMPLED
        };
      };
      AlwaysOnSampler2.prototype.toString = function() {
        return "AlwaysOnSampler";
      };
      return AlwaysOnSampler2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/sampler/ParentBasedSampler.js
  init_esm();
  var import_core2 = __toESM(require_src());
  var ParentBasedSampler = (
    /** @class */
    function() {
      function ParentBasedSampler2(config) {
        var _a2, _b, _c, _d;
        this._root = config.root;
        if (!this._root) {
          (0, import_core2.globalErrorHandler)(new Error("ParentBasedSampler must have a root sampler configured"));
          this._root = new AlwaysOnSampler();
        }
        this._remoteParentSampled = (_a2 = config.remoteParentSampled) !== null && _a2 !== void 0 ? _a2 : new AlwaysOnSampler();
        this._remoteParentNotSampled = (_b = config.remoteParentNotSampled) !== null && _b !== void 0 ? _b : new AlwaysOffSampler();
        this._localParentSampled = (_c = config.localParentSampled) !== null && _c !== void 0 ? _c : new AlwaysOnSampler();
        this._localParentNotSampled = (_d = config.localParentNotSampled) !== null && _d !== void 0 ? _d : new AlwaysOffSampler();
      }
      ParentBasedSampler2.prototype.shouldSample = function(context2, traceId, spanName, spanKind, attributes, links) {
        var parentContext = trace.getSpanContext(context2);
        if (!parentContext || !isSpanContextValid(parentContext)) {
          return this._root.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
        }
        if (parentContext.isRemote) {
          if (parentContext.traceFlags & TraceFlags.SAMPLED) {
            return this._remoteParentSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
          }
          return this._remoteParentNotSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
        }
        if (parentContext.traceFlags & TraceFlags.SAMPLED) {
          return this._localParentSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
        }
        return this._localParentNotSampled.shouldSample(context2, traceId, spanName, spanKind, attributes, links);
      };
      ParentBasedSampler2.prototype.toString = function() {
        return "ParentBased{root=" + this._root.toString() + ", remoteParentSampled=" + this._remoteParentSampled.toString() + ", remoteParentNotSampled=" + this._remoteParentNotSampled.toString() + ", localParentSampled=" + this._localParentSampled.toString() + ", localParentNotSampled=" + this._localParentNotSampled.toString() + "}";
      };
      return ParentBasedSampler2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/sampler/TraceIdRatioBasedSampler.js
  init_esm();
  var TraceIdRatioBasedSampler = (
    /** @class */
    function() {
      function TraceIdRatioBasedSampler2(_ratio) {
        if (_ratio === void 0) {
          _ratio = 0;
        }
        this._ratio = _ratio;
        this._ratio = this._normalize(_ratio);
        this._upperBound = Math.floor(this._ratio * 4294967295);
      }
      TraceIdRatioBasedSampler2.prototype.shouldSample = function(context2, traceId) {
        return {
          decision: isValidTraceId(traceId) && this._accumulate(traceId) < this._upperBound ? SamplingDecision2.RECORD_AND_SAMPLED : SamplingDecision2.NOT_RECORD
        };
      };
      TraceIdRatioBasedSampler2.prototype.toString = function() {
        return "TraceIdRatioBased{" + this._ratio + "}";
      };
      TraceIdRatioBasedSampler2.prototype._normalize = function(ratio) {
        if (typeof ratio !== "number" || isNaN(ratio))
          return 0;
        return ratio >= 1 ? 1 : ratio <= 0 ? 0 : ratio;
      };
      TraceIdRatioBasedSampler2.prototype._accumulate = function(traceId) {
        var accumulation = 0;
        for (var i = 0; i < traceId.length / 8; i++) {
          var pos = i * 8;
          var part = parseInt(traceId.slice(pos, pos + 8), 16);
          accumulation = (accumulation ^ part) >>> 0;
        }
        return accumulation;
      };
      return TraceIdRatioBasedSampler2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/config.js
  var env = (0, import_core3.getEnv)();
  var FALLBACK_OTEL_TRACES_SAMPLER = import_core3.TracesSamplerValues.AlwaysOn;
  var DEFAULT_RATIO = 1;
  function loadDefaultConfig() {
    var _env = (0, import_core3.getEnv)();
    return {
      sampler: buildSamplerFromEnv(env),
      forceFlushTimeoutMillis: 3e4,
      generalLimits: {
        attributeValueLengthLimit: _env.OTEL_ATTRIBUTE_VALUE_LENGTH_LIMIT,
        attributeCountLimit: _env.OTEL_ATTRIBUTE_COUNT_LIMIT
      },
      spanLimits: {
        attributeValueLengthLimit: _env.OTEL_SPAN_ATTRIBUTE_VALUE_LENGTH_LIMIT,
        attributeCountLimit: _env.OTEL_SPAN_ATTRIBUTE_COUNT_LIMIT,
        linkCountLimit: _env.OTEL_SPAN_LINK_COUNT_LIMIT,
        eventCountLimit: _env.OTEL_SPAN_EVENT_COUNT_LIMIT,
        attributePerEventCountLimit: _env.OTEL_SPAN_ATTRIBUTE_PER_EVENT_COUNT_LIMIT,
        attributePerLinkCountLimit: _env.OTEL_SPAN_ATTRIBUTE_PER_LINK_COUNT_LIMIT
      }
    };
  }
  function buildSamplerFromEnv(environment) {
    if (environment === void 0) {
      environment = (0, import_core3.getEnv)();
    }
    switch (environment.OTEL_TRACES_SAMPLER) {
      case import_core3.TracesSamplerValues.AlwaysOn:
        return new AlwaysOnSampler();
      case import_core3.TracesSamplerValues.AlwaysOff:
        return new AlwaysOffSampler();
      case import_core3.TracesSamplerValues.ParentBasedAlwaysOn:
        return new ParentBasedSampler({
          root: new AlwaysOnSampler()
        });
      case import_core3.TracesSamplerValues.ParentBasedAlwaysOff:
        return new ParentBasedSampler({
          root: new AlwaysOffSampler()
        });
      case import_core3.TracesSamplerValues.TraceIdRatio:
        return new TraceIdRatioBasedSampler(getSamplerProbabilityFromEnv(environment));
      case import_core3.TracesSamplerValues.ParentBasedTraceIdRatio:
        return new ParentBasedSampler({
          root: new TraceIdRatioBasedSampler(getSamplerProbabilityFromEnv(environment))
        });
      default:
        diag2.error('OTEL_TRACES_SAMPLER value "' + environment.OTEL_TRACES_SAMPLER + " invalid, defaulting to " + FALLBACK_OTEL_TRACES_SAMPLER + '".');
        return new AlwaysOnSampler();
    }
  }
  function getSamplerProbabilityFromEnv(environment) {
    if (environment.OTEL_TRACES_SAMPLER_ARG === void 0 || environment.OTEL_TRACES_SAMPLER_ARG === "") {
      diag2.error("OTEL_TRACES_SAMPLER_ARG is blank, defaulting to " + DEFAULT_RATIO + ".");
      return DEFAULT_RATIO;
    }
    var probability = Number(environment.OTEL_TRACES_SAMPLER_ARG);
    if (isNaN(probability)) {
      diag2.error("OTEL_TRACES_SAMPLER_ARG=" + environment.OTEL_TRACES_SAMPLER_ARG + " was given, but it is invalid, defaulting to " + DEFAULT_RATIO + ".");
      return DEFAULT_RATIO;
    }
    if (probability < 0 || probability > 1) {
      diag2.error("OTEL_TRACES_SAMPLER_ARG=" + environment.OTEL_TRACES_SAMPLER_ARG + " was given, but it is out of range ([0..1]), defaulting to " + DEFAULT_RATIO + ".");
      return DEFAULT_RATIO;
    }
    return probability;
  }

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/utility.js
  var import_core4 = __toESM(require_src());
  function mergeConfig(userConfig) {
    var perInstanceDefaults = {
      sampler: buildSamplerFromEnv()
    };
    var DEFAULT_CONFIG = loadDefaultConfig();
    var target = Object.assign({}, DEFAULT_CONFIG, perInstanceDefaults, userConfig);
    target.generalLimits = Object.assign({}, DEFAULT_CONFIG.generalLimits, userConfig.generalLimits || {});
    target.spanLimits = Object.assign({}, DEFAULT_CONFIG.spanLimits, userConfig.spanLimits || {});
    return target;
  }
  function reconfigureLimits(userConfig) {
    var _a2, _b, _c, _d, _e, _f, _g, _h, _j, _k, _l, _m;
    var spanLimits = Object.assign({}, userConfig.spanLimits);
    var parsedEnvConfig = (0, import_core4.getEnvWithoutDefaults)();
    spanLimits.attributeCountLimit = (_f = (_e = (_d = (_b = (_a2 = userConfig.spanLimits) === null || _a2 === void 0 ? void 0 : _a2.attributeCountLimit) !== null && _b !== void 0 ? _b : (_c = userConfig.generalLimits) === null || _c === void 0 ? void 0 : _c.attributeCountLimit) !== null && _d !== void 0 ? _d : parsedEnvConfig.OTEL_SPAN_ATTRIBUTE_COUNT_LIMIT) !== null && _e !== void 0 ? _e : parsedEnvConfig.OTEL_ATTRIBUTE_COUNT_LIMIT) !== null && _f !== void 0 ? _f : import_core4.DEFAULT_ATTRIBUTE_COUNT_LIMIT;
    spanLimits.attributeValueLengthLimit = (_m = (_l = (_k = (_h = (_g = userConfig.spanLimits) === null || _g === void 0 ? void 0 : _g.attributeValueLengthLimit) !== null && _h !== void 0 ? _h : (_j = userConfig.generalLimits) === null || _j === void 0 ? void 0 : _j.attributeValueLengthLimit) !== null && _k !== void 0 ? _k : parsedEnvConfig.OTEL_SPAN_ATTRIBUTE_VALUE_LENGTH_LIMIT) !== null && _l !== void 0 ? _l : parsedEnvConfig.OTEL_ATTRIBUTE_VALUE_LENGTH_LIMIT) !== null && _m !== void 0 ? _m : import_core4.DEFAULT_ATTRIBUTE_VALUE_LENGTH_LIMIT;
    return Object.assign({}, userConfig, { spanLimits });
  }

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/export/BatchSpanProcessorBase.js
  init_esm();
  var import_core5 = __toESM(require_src());
  var BatchSpanProcessorBase = (
    /** @class */
    function() {
      function BatchSpanProcessorBase3(_exporter, config) {
        this._exporter = _exporter;
        this._isExporting = false;
        this._finishedSpans = [];
        this._droppedSpansCount = 0;
        var env2 = (0, import_core5.getEnv)();
        this._maxExportBatchSize = typeof (config === null || config === void 0 ? void 0 : config.maxExportBatchSize) === "number" ? config.maxExportBatchSize : env2.OTEL_BSP_MAX_EXPORT_BATCH_SIZE;
        this._maxQueueSize = typeof (config === null || config === void 0 ? void 0 : config.maxQueueSize) === "number" ? config.maxQueueSize : env2.OTEL_BSP_MAX_QUEUE_SIZE;
        this._scheduledDelayMillis = typeof (config === null || config === void 0 ? void 0 : config.scheduledDelayMillis) === "number" ? config.scheduledDelayMillis : env2.OTEL_BSP_SCHEDULE_DELAY;
        this._exportTimeoutMillis = typeof (config === null || config === void 0 ? void 0 : config.exportTimeoutMillis) === "number" ? config.exportTimeoutMillis : env2.OTEL_BSP_EXPORT_TIMEOUT;
        this._shutdownOnce = new import_core5.BindOnceFuture(this._shutdown, this);
        if (this._maxExportBatchSize > this._maxQueueSize) {
          diag2.warn("BatchSpanProcessor: maxExportBatchSize must be smaller or equal to maxQueueSize, setting maxExportBatchSize to match maxQueueSize");
          this._maxExportBatchSize = this._maxQueueSize;
        }
      }
      BatchSpanProcessorBase3.prototype.forceFlush = function() {
        if (this._shutdownOnce.isCalled) {
          return this._shutdownOnce.promise;
        }
        return this._flushAll();
      };
      BatchSpanProcessorBase3.prototype.onStart = function(_span, _parentContext) {
      };
      BatchSpanProcessorBase3.prototype.onEnd = function(span) {
        if (this._shutdownOnce.isCalled) {
          return;
        }
        if ((span.spanContext().traceFlags & TraceFlags.SAMPLED) === 0) {
          return;
        }
        this._addToBuffer(span);
      };
      BatchSpanProcessorBase3.prototype.shutdown = function() {
        return this._shutdownOnce.call();
      };
      BatchSpanProcessorBase3.prototype._shutdown = function() {
        var _this = this;
        return Promise.resolve().then(function() {
          return _this.onShutdown();
        }).then(function() {
          return _this._flushAll();
        }).then(function() {
          return _this._exporter.shutdown();
        });
      };
      BatchSpanProcessorBase3.prototype._addToBuffer = function(span) {
        if (this._finishedSpans.length >= this._maxQueueSize) {
          if (this._droppedSpansCount === 0) {
            diag2.debug("maxQueueSize reached, dropping spans");
          }
          this._droppedSpansCount++;
          return;
        }
        if (this._droppedSpansCount > 0) {
          diag2.warn("Dropped " + this._droppedSpansCount + " spans because maxQueueSize reached");
          this._droppedSpansCount = 0;
        }
        this._finishedSpans.push(span);
        this._maybeStartTimer();
      };
      BatchSpanProcessorBase3.prototype._flushAll = function() {
        var _this = this;
        return new Promise(function(resolve, reject) {
          var promises = [];
          var count = Math.ceil(_this._finishedSpans.length / _this._maxExportBatchSize);
          for (var i = 0, j = count; i < j; i++) {
            promises.push(_this._flushOneBatch());
          }
          Promise.all(promises).then(function() {
            resolve();
          }).catch(reject);
        });
      };
      BatchSpanProcessorBase3.prototype._flushOneBatch = function() {
        var _this = this;
        this._clearTimer();
        if (this._finishedSpans.length === 0) {
          return Promise.resolve();
        }
        return new Promise(function(resolve, reject) {
          var timer = setTimeout(function() {
            reject(new Error("Timeout"));
          }, _this._exportTimeoutMillis);
          context.with((0, import_core5.suppressTracing)(context.active()), function() {
            var spans;
            if (_this._finishedSpans.length <= _this._maxExportBatchSize) {
              spans = _this._finishedSpans;
              _this._finishedSpans = [];
            } else {
              spans = _this._finishedSpans.splice(0, _this._maxExportBatchSize);
            }
            var doExport = function() {
              return _this._exporter.export(spans, function(result) {
                var _a2;
                clearTimeout(timer);
                if (result.code === import_core5.ExportResultCode.SUCCESS) {
                  resolve();
                } else {
                  reject((_a2 = result.error) !== null && _a2 !== void 0 ? _a2 : new Error("BatchSpanProcessor: span export failed"));
                }
              });
            };
            var pendingResources = null;
            for (var i = 0, len = spans.length; i < len; i++) {
              var span = spans[i];
              if (span.resource.asyncAttributesPending && span.resource.waitForAsyncAttributes) {
                pendingResources !== null && pendingResources !== void 0 ? pendingResources : pendingResources = [];
                pendingResources.push(span.resource.waitForAsyncAttributes());
              }
            }
            if (pendingResources === null) {
              doExport();
            } else {
              Promise.all(pendingResources).then(doExport, function(err2) {
                (0, import_core5.globalErrorHandler)(err2);
                reject(err2);
              });
            }
          });
        });
      };
      BatchSpanProcessorBase3.prototype._maybeStartTimer = function() {
        var _this = this;
        if (this._isExporting)
          return;
        var flush = function() {
          _this._isExporting = true;
          _this._flushOneBatch().finally(function() {
            _this._isExporting = false;
            if (_this._finishedSpans.length > 0) {
              _this._clearTimer();
              _this._maybeStartTimer();
            }
          }).catch(function(e) {
            _this._isExporting = false;
            (0, import_core5.globalErrorHandler)(e);
          });
        };
        if (this._finishedSpans.length >= this._maxExportBatchSize) {
          return flush();
        }
        if (this._timer !== void 0)
          return;
        this._timer = setTimeout(function() {
          return flush();
        }, this._scheduledDelayMillis);
        (0, import_core5.unrefTimer)(this._timer);
      };
      BatchSpanProcessorBase3.prototype._clearTimer = function() {
        if (this._timer !== void 0) {
          clearTimeout(this._timer);
          this._timer = void 0;
        }
      };
      return BatchSpanProcessorBase3;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/platform/browser/export/BatchSpanProcessor.js
  var __extends2 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var BatchSpanProcessor = (
    /** @class */
    function(_super) {
      __extends2(BatchSpanProcessor3, _super);
      function BatchSpanProcessor3(_exporter, config) {
        var _this = _super.call(this, _exporter, config) || this;
        _this.onInit(config);
        return _this;
      }
      BatchSpanProcessor3.prototype.onInit = function(config) {
        var _this = this;
        if ((config === null || config === void 0 ? void 0 : config.disableAutoFlushOnDocumentHide) !== true && typeof document !== "undefined") {
          this._visibilityChangeListener = function() {
            if (document.visibilityState === "hidden") {
              void _this.forceFlush();
            }
          };
          this._pageHideListener = function() {
            void _this.forceFlush();
          };
          document.addEventListener("visibilitychange", this._visibilityChangeListener);
          document.addEventListener("pagehide", this._pageHideListener);
        }
      };
      BatchSpanProcessor3.prototype.onShutdown = function() {
        if (typeof document !== "undefined") {
          if (this._visibilityChangeListener) {
            document.removeEventListener("visibilitychange", this._visibilityChangeListener);
          }
          if (this._pageHideListener) {
            document.removeEventListener("pagehide", this._pageHideListener);
          }
        }
      };
      return BatchSpanProcessor3;
    }(BatchSpanProcessorBase)
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/platform/browser/RandomIdGenerator.js
  var SPAN_ID_BYTES = 8;
  var TRACE_ID_BYTES = 16;
  var RandomIdGenerator = (
    /** @class */
    /* @__PURE__ */ function() {
      function RandomIdGenerator3() {
        this.generateTraceId = getIdGenerator(TRACE_ID_BYTES);
        this.generateSpanId = getIdGenerator(SPAN_ID_BYTES);
      }
      return RandomIdGenerator3;
    }()
  );
  var SHARED_CHAR_CODES_ARRAY = Array(32);
  function getIdGenerator(bytes) {
    return function generateId() {
      for (var i = 0; i < bytes * 2; i++) {
        SHARED_CHAR_CODES_ARRAY[i] = Math.floor(Math.random() * 16) + 48;
        if (SHARED_CHAR_CODES_ARRAY[i] >= 58) {
          SHARED_CHAR_CODES_ARRAY[i] += 39;
        }
      }
      return String.fromCharCode.apply(null, SHARED_CHAR_CODES_ARRAY.slice(0, bytes * 2));
    };
  }

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/Tracer.js
  var Tracer = (
    /** @class */
    function() {
      function Tracer2(instrumentationLibrary, config, _tracerProvider) {
        this._tracerProvider = _tracerProvider;
        var localConfig = mergeConfig(config);
        this._sampler = localConfig.sampler;
        this._generalLimits = localConfig.generalLimits;
        this._spanLimits = localConfig.spanLimits;
        this._idGenerator = config.idGenerator || new RandomIdGenerator();
        this.resource = _tracerProvider.resource;
        this.instrumentationLibrary = instrumentationLibrary;
      }
      Tracer2.prototype.startSpan = function(name, options, context2) {
        var _a2, _b, _c;
        if (options === void 0) {
          options = {};
        }
        if (context2 === void 0) {
          context2 = context.active();
        }
        if (options.root) {
          context2 = trace.deleteSpan(context2);
        }
        var parentSpan = trace.getSpan(context2);
        if ((0, import_core6.isTracingSuppressed)(context2)) {
          diag2.debug("Instrumentation suppressed, returning Noop Span");
          var nonRecordingSpan = trace.wrapSpanContext(INVALID_SPAN_CONTEXT);
          return nonRecordingSpan;
        }
        var parentSpanContext = parentSpan === null || parentSpan === void 0 ? void 0 : parentSpan.spanContext();
        var spanId = this._idGenerator.generateSpanId();
        var traceId;
        var traceState;
        var parentSpanId;
        if (!parentSpanContext || !trace.isSpanContextValid(parentSpanContext)) {
          traceId = this._idGenerator.generateTraceId();
        } else {
          traceId = parentSpanContext.traceId;
          traceState = parentSpanContext.traceState;
          parentSpanId = parentSpanContext.spanId;
        }
        var spanKind = (_a2 = options.kind) !== null && _a2 !== void 0 ? _a2 : SpanKind.INTERNAL;
        var links = ((_b = options.links) !== null && _b !== void 0 ? _b : []).map(function(link) {
          return {
            context: link.context,
            attributes: (0, import_core6.sanitizeAttributes)(link.attributes)
          };
        });
        var attributes = (0, import_core6.sanitizeAttributes)(options.attributes);
        var samplingResult = this._sampler.shouldSample(context2, traceId, name, spanKind, attributes, links);
        traceState = (_c = samplingResult.traceState) !== null && _c !== void 0 ? _c : traceState;
        var traceFlags = samplingResult.decision === SamplingDecision.RECORD_AND_SAMPLED ? TraceFlags.SAMPLED : TraceFlags.NONE;
        var spanContext = { traceId, spanId, traceFlags, traceState };
        if (samplingResult.decision === SamplingDecision.NOT_RECORD) {
          diag2.debug("Recording is off, propagating context in a non-recording span");
          var nonRecordingSpan = trace.wrapSpanContext(spanContext);
          return nonRecordingSpan;
        }
        var initAttributes = (0, import_core6.sanitizeAttributes)(Object.assign(attributes, samplingResult.attributes));
        var span = new Span(this, context2, name, spanContext, spanKind, parentSpanId, links, options.startTime, void 0, initAttributes);
        return span;
      };
      Tracer2.prototype.startActiveSpan = function(name, arg2, arg3, arg4) {
        var opts;
        var ctx;
        var fn;
        if (arguments.length < 2) {
          return;
        } else if (arguments.length === 2) {
          fn = arg2;
        } else if (arguments.length === 3) {
          opts = arg2;
          fn = arg3;
        } else {
          opts = arg2;
          ctx = arg3;
          fn = arg4;
        }
        var parentContext = ctx !== null && ctx !== void 0 ? ctx : context.active();
        var span = this.startSpan(name, opts, parentContext);
        var contextWithSpanSet = trace.setSpan(parentContext, span);
        return context.with(contextWithSpanSet, fn, void 0, span);
      };
      Tracer2.prototype.getGeneralLimits = function() {
        return this._generalLimits;
      };
      Tracer2.prototype.getSpanLimits = function() {
        return this._spanLimits;
      };
      Tracer2.prototype.getActiveSpanProcessor = function() {
        return this._tracerProvider.getActiveSpanProcessor();
      };
      return Tracer2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/BasicTracerProvider.js
  init_esm();
  var import_core9 = __toESM(require_src());

  // node_modules/@opentelemetry/resources/build/esm/Resource.js
  init_esm();
  init_esm2();
  var import_core7 = __toESM(require_src());

  // node_modules/@opentelemetry/resources/build/esm/platform/browser/default-service-name.js
  function defaultServiceName() {
    return "unknown_service";
  }

  // node_modules/@opentelemetry/resources/build/esm/Resource.js
  var __assign = function() {
    __assign = Object.assign || function(t) {
      for (var s, i = 1, n = arguments.length; i < n; i++) {
        s = arguments[i];
        for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
          t[p] = s[p];
      }
      return t;
    };
    return __assign.apply(this, arguments);
  };
  var __awaiter = function(thisArg, _arguments, P, generator) {
    function adopt(value) {
      return value instanceof P ? value : new P(function(resolve) {
        resolve(value);
      });
    }
    return new (P || (P = Promise))(function(resolve, reject) {
      function fulfilled(value) {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      }
      function rejected(value) {
        try {
          step(generator["throw"](value));
        } catch (e) {
          reject(e);
        }
      }
      function step(result) {
        result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected);
      }
      step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
  };
  var __generator = function(thisArg, body) {
    var _ = { label: 0, sent: function() {
      if (t[0] & 1) throw t[1];
      return t[1];
    }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() {
      return this;
    }), g;
    function verb(n) {
      return function(v) {
        return step([n, v]);
      };
    }
    function step(op) {
      if (f) throw new TypeError("Generator is already executing.");
      while (_) try {
        if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
        if (y = 0, t) op = [op[0] & 2, t.value];
        switch (op[0]) {
          case 0:
          case 1:
            t = op;
            break;
          case 4:
            _.label++;
            return { value: op[1], done: false };
          case 5:
            _.label++;
            y = op[1];
            op = [0];
            continue;
          case 7:
            op = _.ops.pop();
            _.trys.pop();
            continue;
          default:
            if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) {
              _ = 0;
              continue;
            }
            if (op[0] === 3 && (!t || op[1] > t[0] && op[1] < t[3])) {
              _.label = op[1];
              break;
            }
            if (op[0] === 6 && _.label < t[1]) {
              _.label = t[1];
              t = op;
              break;
            }
            if (t && _.label < t[2]) {
              _.label = t[2];
              _.ops.push(op);
              break;
            }
            if (t[2]) _.ops.pop();
            _.trys.pop();
            continue;
        }
        op = body.call(thisArg, _);
      } catch (e) {
        op = [6, e];
        y = 0;
      } finally {
        f = t = 0;
      }
      if (op[0] & 5) throw op[1];
      return { value: op[0] ? op[1] : void 0, done: true };
    }
  };
  var __read7 = function(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
      while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    } catch (error) {
      e = { error };
    } finally {
      try {
        if (r && !r.done && (m = i["return"])) m.call(i);
      } finally {
        if (e) throw e.error;
      }
    }
    return ar;
  };
  var Resource = (
    /** @class */
    function() {
      function Resource2(attributes, asyncAttributesPromise) {
        var _this = this;
        var _a2;
        this._attributes = attributes;
        this.asyncAttributesPending = asyncAttributesPromise != null;
        this._syncAttributes = (_a2 = this._attributes) !== null && _a2 !== void 0 ? _a2 : {};
        this._asyncAttributesPromise = asyncAttributesPromise === null || asyncAttributesPromise === void 0 ? void 0 : asyncAttributesPromise.then(function(asyncAttributes) {
          _this._attributes = Object.assign({}, _this._attributes, asyncAttributes);
          _this.asyncAttributesPending = false;
          return asyncAttributes;
        }, function(err2) {
          diag2.debug("a resource's async attributes promise rejected: %s", err2);
          _this.asyncAttributesPending = false;
          return {};
        });
      }
      Resource2.empty = function() {
        return Resource2.EMPTY;
      };
      Resource2.default = function() {
        var _a2;
        return new Resource2((_a2 = {}, _a2[SEMRESATTRS_SERVICE_NAME] = defaultServiceName(), _a2[SEMRESATTRS_TELEMETRY_SDK_LANGUAGE] = import_core7.SDK_INFO[SEMRESATTRS_TELEMETRY_SDK_LANGUAGE], _a2[SEMRESATTRS_TELEMETRY_SDK_NAME] = import_core7.SDK_INFO[SEMRESATTRS_TELEMETRY_SDK_NAME], _a2[SEMRESATTRS_TELEMETRY_SDK_VERSION] = import_core7.SDK_INFO[SEMRESATTRS_TELEMETRY_SDK_VERSION], _a2));
      };
      Object.defineProperty(Resource2.prototype, "attributes", {
        get: function() {
          var _a2;
          if (this.asyncAttributesPending) {
            diag2.error("Accessing resource attributes before async attributes settled");
          }
          return (_a2 = this._attributes) !== null && _a2 !== void 0 ? _a2 : {};
        },
        enumerable: false,
        configurable: true
      });
      Resource2.prototype.waitForAsyncAttributes = function() {
        return __awaiter(this, void 0, void 0, function() {
          return __generator(this, function(_a2) {
            switch (_a2.label) {
              case 0:
                if (!this.asyncAttributesPending) return [3, 2];
                return [4, this._asyncAttributesPromise];
              case 1:
                _a2.sent();
                _a2.label = 2;
              case 2:
                return [
                  2
                  /*return*/
                ];
            }
          });
        });
      };
      Resource2.prototype.merge = function(other) {
        var _this = this;
        var _a2;
        if (!other)
          return this;
        var mergedSyncAttributes = __assign(__assign({}, this._syncAttributes), (_a2 = other._syncAttributes) !== null && _a2 !== void 0 ? _a2 : other.attributes);
        if (!this._asyncAttributesPromise && !other._asyncAttributesPromise) {
          return new Resource2(mergedSyncAttributes);
        }
        var mergedAttributesPromise = Promise.all([
          this._asyncAttributesPromise,
          other._asyncAttributesPromise
        ]).then(function(_a3) {
          var _b;
          var _c = __read7(_a3, 2), thisAsyncAttributes = _c[0], otherAsyncAttributes = _c[1];
          return __assign(__assign(__assign(__assign({}, _this._syncAttributes), thisAsyncAttributes), (_b = other._syncAttributes) !== null && _b !== void 0 ? _b : other.attributes), otherAsyncAttributes);
        });
        return new Resource2(mergedSyncAttributes, mergedAttributesPromise);
      };
      Resource2.EMPTY = new Resource2({});
      return Resource2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/MultiSpanProcessor.js
  var import_core8 = __toESM(require_src());
  var __values3 = function(o) {
    var s = typeof Symbol === "function" && Symbol.iterator, m = s && o[s], i = 0;
    if (m) return m.call(o);
    if (o && typeof o.length === "number") return {
      next: function() {
        if (o && i >= o.length) o = void 0;
        return { value: o && o[i++], done: !o };
      }
    };
    throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
  };
  var MultiSpanProcessor = (
    /** @class */
    function() {
      function MultiSpanProcessor3(_spanProcessors) {
        this._spanProcessors = _spanProcessors;
      }
      MultiSpanProcessor3.prototype.forceFlush = function() {
        var e_1, _a2;
        var promises = [];
        try {
          for (var _b = __values3(this._spanProcessors), _c = _b.next(); !_c.done; _c = _b.next()) {
            var spanProcessor = _c.value;
            promises.push(spanProcessor.forceFlush());
          }
        } catch (e_1_1) {
          e_1 = { error: e_1_1 };
        } finally {
          try {
            if (_c && !_c.done && (_a2 = _b.return)) _a2.call(_b);
          } finally {
            if (e_1) throw e_1.error;
          }
        }
        return new Promise(function(resolve) {
          Promise.all(promises).then(function() {
            resolve();
          }).catch(function(error) {
            (0, import_core8.globalErrorHandler)(error || new Error("MultiSpanProcessor: forceFlush failed"));
            resolve();
          });
        });
      };
      MultiSpanProcessor3.prototype.onStart = function(span, context2) {
        var e_2, _a2;
        try {
          for (var _b = __values3(this._spanProcessors), _c = _b.next(); !_c.done; _c = _b.next()) {
            var spanProcessor = _c.value;
            spanProcessor.onStart(span, context2);
          }
        } catch (e_2_1) {
          e_2 = { error: e_2_1 };
        } finally {
          try {
            if (_c && !_c.done && (_a2 = _b.return)) _a2.call(_b);
          } finally {
            if (e_2) throw e_2.error;
          }
        }
      };
      MultiSpanProcessor3.prototype.onEnd = function(span) {
        var e_3, _a2;
        try {
          for (var _b = __values3(this._spanProcessors), _c = _b.next(); !_c.done; _c = _b.next()) {
            var spanProcessor = _c.value;
            spanProcessor.onEnd(span);
          }
        } catch (e_3_1) {
          e_3 = { error: e_3_1 };
        } finally {
          try {
            if (_c && !_c.done && (_a2 = _b.return)) _a2.call(_b);
          } finally {
            if (e_3) throw e_3.error;
          }
        }
      };
      MultiSpanProcessor3.prototype.shutdown = function() {
        var e_4, _a2;
        var promises = [];
        try {
          for (var _b = __values3(this._spanProcessors), _c = _b.next(); !_c.done; _c = _b.next()) {
            var spanProcessor = _c.value;
            promises.push(spanProcessor.shutdown());
          }
        } catch (e_4_1) {
          e_4 = { error: e_4_1 };
        } finally {
          try {
            if (_c && !_c.done && (_a2 = _b.return)) _a2.call(_b);
          } finally {
            if (e_4) throw e_4.error;
          }
        }
        return new Promise(function(resolve, reject) {
          Promise.all(promises).then(function() {
            resolve();
          }, reject);
        });
      };
      return MultiSpanProcessor3;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/export/NoopSpanProcessor.js
  var NoopSpanProcessor = (
    /** @class */
    function() {
      function NoopSpanProcessor2() {
      }
      NoopSpanProcessor2.prototype.onStart = function(_span, _context) {
      };
      NoopSpanProcessor2.prototype.onEnd = function(_span) {
      };
      NoopSpanProcessor2.prototype.shutdown = function() {
        return Promise.resolve();
      };
      NoopSpanProcessor2.prototype.forceFlush = function() {
        return Promise.resolve();
      };
      return NoopSpanProcessor2;
    }()
  );

  // node_modules/@opentelemetry/sdk-trace-base/build/esm/BasicTracerProvider.js
  var ForceFlushState;
  (function(ForceFlushState2) {
    ForceFlushState2[ForceFlushState2["resolved"] = 0] = "resolved";
    ForceFlushState2[ForceFlushState2["timeout"] = 1] = "timeout";
    ForceFlushState2[ForceFlushState2["error"] = 2] = "error";
    ForceFlushState2[ForceFlushState2["unresolved"] = 3] = "unresolved";
  })(ForceFlushState || (ForceFlushState = {}));
  var BasicTracerProvider = (
    /** @class */
    function() {
      function BasicTracerProvider2(config) {
        if (config === void 0) {
          config = {};
        }
        var _a2;
        this._registeredSpanProcessors = [];
        this._tracers = /* @__PURE__ */ new Map();
        var mergedConfig = (0, import_core9.merge)({}, loadDefaultConfig(), reconfigureLimits(config));
        this.resource = (_a2 = mergedConfig.resource) !== null && _a2 !== void 0 ? _a2 : Resource.empty();
        this.resource = Resource.default().merge(this.resource);
        this._config = Object.assign({}, mergedConfig, {
          resource: this.resource
        });
        var defaultExporter = this._buildExporterFromEnv();
        if (defaultExporter !== void 0) {
          var batchProcessor = new BatchSpanProcessor(defaultExporter);
          this.activeSpanProcessor = batchProcessor;
        } else {
          this.activeSpanProcessor = new NoopSpanProcessor();
        }
      }
      BasicTracerProvider2.prototype.getTracer = function(name, version, options) {
        var key = name + "@" + (version || "") + ":" + ((options === null || options === void 0 ? void 0 : options.schemaUrl) || "");
        if (!this._tracers.has(key)) {
          this._tracers.set(key, new Tracer({ name, version, schemaUrl: options === null || options === void 0 ? void 0 : options.schemaUrl }, this._config, this));
        }
        return this._tracers.get(key);
      };
      BasicTracerProvider2.prototype.addSpanProcessor = function(spanProcessor) {
        if (this._registeredSpanProcessors.length === 0) {
          this.activeSpanProcessor.shutdown().catch(function(err2) {
            return diag2.error("Error while trying to shutdown current span processor", err2);
          });
        }
        this._registeredSpanProcessors.push(spanProcessor);
        this.activeSpanProcessor = new MultiSpanProcessor(this._registeredSpanProcessors);
      };
      BasicTracerProvider2.prototype.getActiveSpanProcessor = function() {
        return this.activeSpanProcessor;
      };
      BasicTracerProvider2.prototype.register = function(config) {
        if (config === void 0) {
          config = {};
        }
        trace.setGlobalTracerProvider(this);
        if (config.propagator === void 0) {
          config.propagator = this._buildPropagatorFromEnv();
        }
        if (config.contextManager) {
          context.setGlobalContextManager(config.contextManager);
        }
        if (config.propagator) {
          propagation.setGlobalPropagator(config.propagator);
        }
      };
      BasicTracerProvider2.prototype.forceFlush = function() {
        var timeout = this._config.forceFlushTimeoutMillis;
        var promises = this._registeredSpanProcessors.map(function(spanProcessor) {
          return new Promise(function(resolve) {
            var state;
            var timeoutInterval = setTimeout(function() {
              resolve(new Error("Span processor did not completed within timeout period of " + timeout + " ms"));
              state = ForceFlushState.timeout;
            }, timeout);
            spanProcessor.forceFlush().then(function() {
              clearTimeout(timeoutInterval);
              if (state !== ForceFlushState.timeout) {
                state = ForceFlushState.resolved;
                resolve(state);
              }
            }).catch(function(error) {
              clearTimeout(timeoutInterval);
              state = ForceFlushState.error;
              resolve(error);
            });
          });
        });
        return new Promise(function(resolve, reject) {
          Promise.all(promises).then(function(results) {
            var errors = results.filter(function(result) {
              return result !== ForceFlushState.resolved;
            });
            if (errors.length > 0) {
              reject(errors);
            } else {
              resolve();
            }
          }).catch(function(error) {
            return reject([error]);
          });
        });
      };
      BasicTracerProvider2.prototype.shutdown = function() {
        return this.activeSpanProcessor.shutdown();
      };
      BasicTracerProvider2.prototype._getPropagator = function(name) {
        var _a2;
        return (_a2 = this.constructor._registeredPropagators.get(name)) === null || _a2 === void 0 ? void 0 : _a2();
      };
      BasicTracerProvider2.prototype._getSpanExporter = function(name) {
        var _a2;
        return (_a2 = this.constructor._registeredExporters.get(name)) === null || _a2 === void 0 ? void 0 : _a2();
      };
      BasicTracerProvider2.prototype._buildPropagatorFromEnv = function() {
        var _this = this;
        var uniquePropagatorNames = Array.from(new Set((0, import_core9.getEnv)().OTEL_PROPAGATORS));
        var propagators = uniquePropagatorNames.map(function(name) {
          var propagator = _this._getPropagator(name);
          if (!propagator) {
            diag2.warn('Propagator "' + name + '" requested through environment variable is unavailable.');
          }
          return propagator;
        });
        var validPropagators = propagators.reduce(function(list, item) {
          if (item) {
            list.push(item);
          }
          return list;
        }, []);
        if (validPropagators.length === 0) {
          return;
        } else if (uniquePropagatorNames.length === 1) {
          return validPropagators[0];
        } else {
          return new import_core9.CompositePropagator({
            propagators: validPropagators
          });
        }
      };
      BasicTracerProvider2.prototype._buildExporterFromEnv = function() {
        var exporterName = (0, import_core9.getEnv)().OTEL_TRACES_EXPORTER;
        if (exporterName === "none" || exporterName === "")
          return;
        var exporter = this._getSpanExporter(exporterName);
        if (!exporter) {
          diag2.error('Exporter "' + exporterName + '" requested through environment variable is unavailable.');
        }
        return exporter;
      };
      BasicTracerProvider2._registeredPropagators = /* @__PURE__ */ new Map([
        ["tracecontext", function() {
          return new import_core9.W3CTraceContextPropagator();
        }],
        ["baggage", function() {
          return new import_core9.W3CBaggagePropagator();
        }]
      ]);
      BasicTracerProvider2._registeredExporters = /* @__PURE__ */ new Map();
      return BasicTracerProvider2;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-sdk-trace-web/build/esm/StackContextManager.js
  init_esm();
  var __read8 = function(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
      while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    } catch (error) {
      e = { error };
    } finally {
      try {
        if (r && !r.done && (m = i["return"])) m.call(i);
      } finally {
        if (e) throw e.error;
      }
    }
    return ar;
  };
  var __spreadArray6 = function(to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
      if (ar || !(i in from)) {
        if (!ar) ar = Array.prototype.slice.call(from, 0, i);
        ar[i] = from[i];
      }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
  };
  var StackContextManager = (
    /** @class */
    function() {
      function StackContextManager2() {
        this._enabled = false;
        this._currentContext = ROOT_CONTEXT;
      }
      StackContextManager2.prototype._bindFunction = function(context2, target) {
        if (context2 === void 0) {
          context2 = ROOT_CONTEXT;
        }
        var manager = this;
        var contextWrapper = function() {
          var _this = this;
          var args = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
          }
          return manager.with(context2, function() {
            return target.apply(_this, args);
          });
        };
        Object.defineProperty(contextWrapper, "length", {
          enumerable: false,
          configurable: true,
          writable: false,
          value: target.length
        });
        return contextWrapper;
      };
      StackContextManager2.prototype.active = function() {
        return this._currentContext;
      };
      StackContextManager2.prototype.bind = function(context2, target) {
        if (context2 === void 0) {
          context2 = this.active();
        }
        if (typeof target === "function") {
          return this._bindFunction(context2, target);
        }
        return target;
      };
      StackContextManager2.prototype.disable = function() {
        this._currentContext = ROOT_CONTEXT;
        this._enabled = false;
        return this;
      };
      StackContextManager2.prototype.enable = function() {
        if (this._enabled) {
          return this;
        }
        this._enabled = true;
        this._currentContext = ROOT_CONTEXT;
        return this;
      };
      StackContextManager2.prototype.with = function(context2, fn, thisArg) {
        var args = [];
        for (var _i = 3; _i < arguments.length; _i++) {
          args[_i - 3] = arguments[_i];
        }
        var previousContext = this._currentContext;
        this._currentContext = context2 || ROOT_CONTEXT;
        try {
          return fn.call.apply(fn, __spreadArray6([thisArg], __read8(args), false));
        } finally {
          this._currentContext = previousContext;
        }
      };
      return StackContextManager2;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-sdk-trace-web/build/esm/WebTracerProvider.js
  var __extends3 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var WebTracerProvider = (
    /** @class */
    function(_super) {
      __extends3(WebTracerProvider2, _super);
      function WebTracerProvider2(config) {
        if (config === void 0) {
          config = {};
        }
        var _this = _super.call(this, config) || this;
        if (config.contextManager) {
          throw "contextManager should be defined in register method not in constructor";
        }
        if (config.propagator) {
          throw "propagator should be defined in register method not in constructor";
        }
        return _this;
      }
      WebTracerProvider2.prototype.register = function(config) {
        if (config === void 0) {
          config = {};
        }
        if (config.contextManager === void 0) {
          config.contextManager = new StackContextManager();
        }
        if (config.contextManager) {
          config.contextManager.enable();
        }
        _super.prototype.register.call(this, config);
      };
      return WebTracerProvider2;
    }(BasicTracerProvider)
  );

  // node_modules/@apexthirdparty/opentelemetry-sdk-trace-base/build/esm/platform/browser/RandomIdGenerator.js
  var SPAN_ID_BYTES2 = 8;
  var TRACE_ID_BYTES2 = 16;
  var RandomIdGenerator2 = (
    /** @class */
    /* @__PURE__ */ function() {
      function RandomIdGenerator3() {
        this.generateTraceId = getIdGenerator2(TRACE_ID_BYTES2);
        this.generateSpanId = getIdGenerator2(SPAN_ID_BYTES2);
      }
      return RandomIdGenerator3;
    }()
  );
  var SHARED_CHAR_CODES_ARRAY2 = Array(32);
  function getIdGenerator2(bytes) {
    return function generateId() {
      for (var i = 0; i < bytes * 2; i++) {
        SHARED_CHAR_CODES_ARRAY2[i] = Math.floor(Math.random() * 16) + 48;
        if (SHARED_CHAR_CODES_ARRAY2[i] >= 58) {
          SHARED_CHAR_CODES_ARRAY2[i] += 39;
        }
      }
      return String.fromCharCode.apply(null, SHARED_CHAR_CODES_ARRAY2.slice(0, bytes * 2));
    };
  }

  // node_modules/@apexthirdparty/opentelemetry-sdk-trace-base/build/esm/export/ConsoleSpanExporter.js
  var import_core10 = __toESM(require_src());
  var __values4 = function(o) {
    var s = typeof Symbol === "function" && Symbol.iterator, m = s && o[s], i = 0;
    if (m) return m.call(o);
    if (o && typeof o.length === "number") return {
      next: function() {
        if (o && i >= o.length) o = void 0;
        return { value: o && o[i++], done: !o };
      }
    };
    throw new TypeError(s ? "Object is not iterable." : "Symbol.iterator is not defined.");
  };
  var ConsoleSpanExporter = (
    /** @class */
    function() {
      function ConsoleSpanExporter2() {
      }
      ConsoleSpanExporter2.prototype.export = function(spans, resultCallback) {
        return this._sendSpans(spans, resultCallback);
      };
      ConsoleSpanExporter2.prototype.shutdown = function() {
        this._sendSpans([]);
        return this.forceFlush();
      };
      ConsoleSpanExporter2.prototype.forceFlush = function() {
        return Promise.resolve();
      };
      ConsoleSpanExporter2.prototype._exportInfo = function(span) {
        var _a2;
        return {
          resource: {
            attributes: span.resource.attributes
          },
          instrumentationScope: span.instrumentationLibrary,
          traceId: span.spanContext().traceId,
          parentId: span.parentSpanId,
          traceState: (_a2 = span.spanContext().traceState) === null || _a2 === void 0 ? void 0 : _a2.serialize(),
          name: span.name,
          id: span.spanContext().spanId,
          kind: span.kind,
          timestamp: (0, import_core10.hrTimeToMicroseconds)(span.startTime),
          duration: (0, import_core10.hrTimeToMicroseconds)(span.duration),
          attributes: span.attributes,
          status: span.status,
          events: span.events,
          links: span.links
        };
      };
      ConsoleSpanExporter2.prototype._sendSpans = function(spans, done) {
        var e_1, _a2;
        try {
          for (var spans_1 = __values4(spans), spans_1_1 = spans_1.next(); !spans_1_1.done; spans_1_1 = spans_1.next()) {
            var span = spans_1_1.value;
            console.dir(this._exportInfo(span), { depth: 3 });
          }
        } catch (e_1_1) {
          e_1 = { error: e_1_1 };
        } finally {
          try {
            if (spans_1_1 && !spans_1_1.done && (_a2 = spans_1.return)) _a2.call(spans_1);
          } finally {
            if (e_1) throw e_1.error;
          }
        }
        if (done) {
          return done({ code: import_core10.ExportResultCode.SUCCESS });
        }
      };
      return ConsoleSpanExporter2;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-sdk-trace-base/build/esm/export/SimpleSpanProcessor.js
  init_esm();
  var import_core11 = __toESM(require_src());
  var __awaiter2 = function(thisArg, _arguments, P, generator) {
    function adopt(value) {
      return value instanceof P ? value : new P(function(resolve) {
        resolve(value);
      });
    }
    return new (P || (P = Promise))(function(resolve, reject) {
      function fulfilled(value) {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      }
      function rejected(value) {
        try {
          step(generator["throw"](value));
        } catch (e) {
          reject(e);
        }
      }
      function step(result) {
        result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected);
      }
      step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
  };
  var __generator2 = function(thisArg, body) {
    var _ = { label: 0, sent: function() {
      if (t[0] & 1) throw t[1];
      return t[1];
    }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() {
      return this;
    }), g;
    function verb(n) {
      return function(v) {
        return step([n, v]);
      };
    }
    function step(op) {
      if (f) throw new TypeError("Generator is already executing.");
      while (_) try {
        if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
        if (y = 0, t) op = [op[0] & 2, t.value];
        switch (op[0]) {
          case 0:
          case 1:
            t = op;
            break;
          case 4:
            _.label++;
            return { value: op[1], done: false };
          case 5:
            _.label++;
            y = op[1];
            op = [0];
            continue;
          case 7:
            op = _.ops.pop();
            _.trys.pop();
            continue;
          default:
            if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) {
              _ = 0;
              continue;
            }
            if (op[0] === 3 && (!t || op[1] > t[0] && op[1] < t[3])) {
              _.label = op[1];
              break;
            }
            if (op[0] === 6 && _.label < t[1]) {
              _.label = t[1];
              t = op;
              break;
            }
            if (t && _.label < t[2]) {
              _.label = t[2];
              _.ops.push(op);
              break;
            }
            if (t[2]) _.ops.pop();
            _.trys.pop();
            continue;
        }
        op = body.call(thisArg, _);
      } catch (e) {
        op = [6, e];
        y = 0;
      } finally {
        f = t = 0;
      }
      if (op[0] & 5) throw op[1];
      return { value: op[0] ? op[1] : void 0, done: true };
    }
  };
  var SimpleSpanProcessor = (
    /** @class */
    function() {
      function SimpleSpanProcessor2(_exporter) {
        this._exporter = _exporter;
        this._shutdownOnce = new import_core11.BindOnceFuture(this._shutdown, this);
        this._unresolvedExports = /* @__PURE__ */ new Set();
      }
      SimpleSpanProcessor2.prototype.forceFlush = function() {
        return __awaiter2(this, void 0, void 0, function() {
          return __generator2(this, function(_a2) {
            switch (_a2.label) {
              case 0:
                return [4, Promise.all(Array.from(this._unresolvedExports))];
              case 1:
                _a2.sent();
                if (!this._exporter.forceFlush) return [3, 3];
                return [4, this._exporter.forceFlush()];
              case 2:
                _a2.sent();
                _a2.label = 3;
              case 3:
                return [
                  2
                  /*return*/
                ];
            }
          });
        });
      };
      SimpleSpanProcessor2.prototype.onStart = function(_span, _parentContext) {
      };
      SimpleSpanProcessor2.prototype.onEnd = function(span) {
        var _this = this;
        var _a2, _b;
        if (this._shutdownOnce.isCalled) {
          return;
        }
        if ((span.spanContext().traceFlags & TraceFlags.SAMPLED) === 0) {
          return;
        }
        var doExport = function() {
          return import_core11.internal._export(_this._exporter, [span]).then(function(result) {
            var _a3;
            if (result.code !== import_core11.ExportResultCode.SUCCESS) {
              (0, import_core11.globalErrorHandler)((_a3 = result.error) !== null && _a3 !== void 0 ? _a3 : new Error("SimpleSpanProcessor: span export failed (status " + result + ")"));
            }
          }).catch(function(error) {
            (0, import_core11.globalErrorHandler)(error);
          });
        };
        if (span.resource.asyncAttributesPending) {
          var exportPromise_1 = (_b = (_a2 = span.resource).waitForAsyncAttributes) === null || _b === void 0 ? void 0 : _b.call(_a2).then(function() {
            if (exportPromise_1 != null) {
              _this._unresolvedExports.delete(exportPromise_1);
            }
            return doExport();
          }, function(err2) {
            return (0, import_core11.globalErrorHandler)(err2);
          });
          if (exportPromise_1 != null) {
            this._unresolvedExports.add(exportPromise_1);
          }
        } else {
          void doExport();
        }
      };
      SimpleSpanProcessor2.prototype.shutdown = function() {
        return this._shutdownOnce.call();
      };
      SimpleSpanProcessor2.prototype._shutdown = function() {
        return this._exporter.shutdown();
      };
      return SimpleSpanProcessor2;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/instrumentation.js
  init_esm();
  var import_core14 = __toESM(require_src());

  // node_modules/@opentelemetry/sdk-trace-web/build/esm/enums/PerformanceTimingNames.js
  var PerformanceTimingNames;
  (function(PerformanceTimingNames2) {
    PerformanceTimingNames2["CONNECT_END"] = "connectEnd";
    PerformanceTimingNames2["CONNECT_START"] = "connectStart";
    PerformanceTimingNames2["DECODED_BODY_SIZE"] = "decodedBodySize";
    PerformanceTimingNames2["DOM_COMPLETE"] = "domComplete";
    PerformanceTimingNames2["DOM_CONTENT_LOADED_EVENT_END"] = "domContentLoadedEventEnd";
    PerformanceTimingNames2["DOM_CONTENT_LOADED_EVENT_START"] = "domContentLoadedEventStart";
    PerformanceTimingNames2["DOM_INTERACTIVE"] = "domInteractive";
    PerformanceTimingNames2["DOMAIN_LOOKUP_END"] = "domainLookupEnd";
    PerformanceTimingNames2["DOMAIN_LOOKUP_START"] = "domainLookupStart";
    PerformanceTimingNames2["ENCODED_BODY_SIZE"] = "encodedBodySize";
    PerformanceTimingNames2["FETCH_START"] = "fetchStart";
    PerformanceTimingNames2["LOAD_EVENT_END"] = "loadEventEnd";
    PerformanceTimingNames2["LOAD_EVENT_START"] = "loadEventStart";
    PerformanceTimingNames2["NAVIGATION_START"] = "navigationStart";
    PerformanceTimingNames2["REDIRECT_END"] = "redirectEnd";
    PerformanceTimingNames2["REDIRECT_START"] = "redirectStart";
    PerformanceTimingNames2["REQUEST_START"] = "requestStart";
    PerformanceTimingNames2["RESPONSE_END"] = "responseEnd";
    PerformanceTimingNames2["RESPONSE_START"] = "responseStart";
    PerformanceTimingNames2["SECURE_CONNECTION_START"] = "secureConnectionStart";
    PerformanceTimingNames2["UNLOAD_EVENT_END"] = "unloadEventEnd";
    PerformanceTimingNames2["UNLOAD_EVENT_START"] = "unloadEventStart";
  })(PerformanceTimingNames || (PerformanceTimingNames = {}));

  // node_modules/@opentelemetry/sdk-trace-web/build/esm/utils.js
  var import_core12 = __toESM(require_src());
  init_esm2();
  var urlNormalizingAnchor;
  function getUrlNormalizingAnchor() {
    if (!urlNormalizingAnchor) {
      urlNormalizingAnchor = document.createElement("a");
    }
    return urlNormalizingAnchor;
  }
  function hasKey(obj, key) {
    return key in obj;
  }
  function addSpanNetworkEvent(span, performanceName, entries, refPerfName) {
    var perfTime = void 0;
    var refTime = void 0;
    if (hasKey(entries, performanceName) && typeof entries[performanceName] === "number") {
      perfTime = entries[performanceName];
    }
    var refName = refPerfName || PerformanceTimingNames.FETCH_START;
    if (hasKey(entries, refName) && typeof entries[refName] === "number") {
      refTime = entries[refName];
    }
    if (perfTime !== void 0 && refTime !== void 0 && perfTime >= refTime) {
      span.addEvent(performanceName, perfTime);
      return span;
    }
    return void 0;
  }
  function addSpanNetworkEvents(span, resource) {
    addSpanNetworkEvent(span, PerformanceTimingNames.FETCH_START, resource);
    addSpanNetworkEvent(span, PerformanceTimingNames.DOMAIN_LOOKUP_START, resource);
    addSpanNetworkEvent(span, PerformanceTimingNames.DOMAIN_LOOKUP_END, resource);
    addSpanNetworkEvent(span, PerformanceTimingNames.CONNECT_START, resource);
    if (hasKey(resource, "name") && resource["name"].startsWith("https:")) {
      addSpanNetworkEvent(span, PerformanceTimingNames.SECURE_CONNECTION_START, resource);
    }
    addSpanNetworkEvent(span, PerformanceTimingNames.CONNECT_END, resource);
    addSpanNetworkEvent(span, PerformanceTimingNames.REQUEST_START, resource);
    addSpanNetworkEvent(span, PerformanceTimingNames.RESPONSE_START, resource);
    addSpanNetworkEvent(span, PerformanceTimingNames.RESPONSE_END, resource);
    var encodedLength = resource[PerformanceTimingNames.ENCODED_BODY_SIZE];
    if (encodedLength !== void 0) {
      span.setAttribute(SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH, encodedLength);
    }
    var decodedLength = resource[PerformanceTimingNames.DECODED_BODY_SIZE];
    if (decodedLength !== void 0 && encodedLength !== decodedLength) {
      span.setAttribute(SEMATTRS_HTTP_RESPONSE_CONTENT_LENGTH_UNCOMPRESSED, decodedLength);
    }
  }
  function sortResources(filteredResources) {
    return filteredResources.slice().sort(function(a, b) {
      var valueA = a[PerformanceTimingNames.FETCH_START];
      var valueB = b[PerformanceTimingNames.FETCH_START];
      if (valueA > valueB) {
        return 1;
      } else if (valueA < valueB) {
        return -1;
      }
      return 0;
    });
  }
  function getOrigin() {
    return typeof location !== "undefined" ? location.origin : void 0;
  }
  function getResource(spanUrl, startTimeHR, endTimeHR, resources, ignoredResources, initiatorType) {
    if (ignoredResources === void 0) {
      ignoredResources = /* @__PURE__ */ new WeakSet();
    }
    var parsedSpanUrl = parseUrl(spanUrl);
    spanUrl = parsedSpanUrl.toString();
    var filteredResources = filterResourcesForSpan(spanUrl, startTimeHR, endTimeHR, resources, ignoredResources, initiatorType);
    if (filteredResources.length === 0) {
      return {
        mainRequest: void 0
      };
    }
    if (filteredResources.length === 1) {
      return {
        mainRequest: filteredResources[0]
      };
    }
    var sorted = sortResources(filteredResources);
    if (parsedSpanUrl.origin !== getOrigin() && sorted.length > 1) {
      var corsPreFlightRequest = sorted[0];
      var mainRequest = findMainRequest(sorted, corsPreFlightRequest[PerformanceTimingNames.RESPONSE_END], endTimeHR);
      var responseEnd = corsPreFlightRequest[PerformanceTimingNames.RESPONSE_END];
      var fetchStart = mainRequest[PerformanceTimingNames.FETCH_START];
      if (fetchStart < responseEnd) {
        mainRequest = corsPreFlightRequest;
        corsPreFlightRequest = void 0;
      }
      return {
        corsPreFlightRequest,
        mainRequest
      };
    } else {
      return {
        mainRequest: filteredResources[0]
      };
    }
  }
  function findMainRequest(resources, corsPreFlightRequestEndTime, spanEndTimeHR) {
    var spanEndTime = (0, import_core12.hrTimeToNanoseconds)(spanEndTimeHR);
    var minTime = (0, import_core12.hrTimeToNanoseconds)((0, import_core12.timeInputToHrTime)(corsPreFlightRequestEndTime));
    var mainRequest = resources[1];
    var bestGap;
    var length = resources.length;
    for (var i = 1; i < length; i++) {
      var resource = resources[i];
      var resourceStartTime = (0, import_core12.hrTimeToNanoseconds)((0, import_core12.timeInputToHrTime)(resource[PerformanceTimingNames.FETCH_START]));
      var resourceEndTime = (0, import_core12.hrTimeToNanoseconds)((0, import_core12.timeInputToHrTime)(resource[PerformanceTimingNames.RESPONSE_END]));
      var currentGap = spanEndTime - resourceEndTime;
      if (resourceStartTime >= minTime && (!bestGap || currentGap < bestGap)) {
        bestGap = currentGap;
        mainRequest = resource;
      }
    }
    return mainRequest;
  }
  function filterResourcesForSpan(spanUrl, startTimeHR, endTimeHR, resources, ignoredResources, initiatorType) {
    var startTime = (0, import_core12.hrTimeToNanoseconds)(startTimeHR);
    var endTime = (0, import_core12.hrTimeToNanoseconds)(endTimeHR);
    var filteredResources = resources.filter(function(resource) {
      var resourceStartTime = (0, import_core12.hrTimeToNanoseconds)((0, import_core12.timeInputToHrTime)(resource[PerformanceTimingNames.FETCH_START]));
      var resourceEndTime = (0, import_core12.hrTimeToNanoseconds)((0, import_core12.timeInputToHrTime)(resource[PerformanceTimingNames.RESPONSE_END]));
      return resource.initiatorType.toLowerCase() === (initiatorType || "xmlhttprequest") && resource.name === spanUrl && resourceStartTime >= startTime && resourceEndTime <= endTime;
    });
    if (filteredResources.length > 0) {
      filteredResources = filteredResources.filter(function(resource) {
        return !ignoredResources.has(resource);
      });
    }
    return filteredResources;
  }
  function parseUrl(url) {
    if (typeof URL === "function") {
      return new URL(url, typeof document !== "undefined" ? document.baseURI : typeof location !== "undefined" ? location.href : void 0);
    }
    var element = getUrlNormalizingAnchor();
    element.href = url;
    return element;
  }
  function shouldPropagateTraceHeaders(spanUrl, propagateTraceHeaderCorsUrls) {
    var propagateTraceHeaderUrls = propagateTraceHeaderCorsUrls || [];
    if (typeof propagateTraceHeaderUrls === "string" || propagateTraceHeaderUrls instanceof RegExp) {
      propagateTraceHeaderUrls = [propagateTraceHeaderUrls];
    }
    var parsedSpanUrl = parseUrl(spanUrl);
    if (parsedSpanUrl.origin === getOrigin()) {
      return true;
    } else {
      return propagateTraceHeaderUrls.some(function(propagateTraceHeaderUrl) {
        return (0, import_core12.urlMatches)(spanUrl, propagateTraceHeaderUrl);
      });
    }
  }

  // node_modules/@opentelemetry/instrumentation/node_modules/@opentelemetry/api-logs/build/esm/NoopLogger.js
  var NoopLogger = (
    /** @class */
    function() {
      function NoopLogger3() {
      }
      NoopLogger3.prototype.emit = function(_logRecord) {
      };
      return NoopLogger3;
    }()
  );
  var NOOP_LOGGER = new NoopLogger();

  // node_modules/@opentelemetry/instrumentation/node_modules/@opentelemetry/api-logs/build/esm/NoopLoggerProvider.js
  var NoopLoggerProvider = (
    /** @class */
    function() {
      function NoopLoggerProvider3() {
      }
      NoopLoggerProvider3.prototype.getLogger = function(_name, _version, _options) {
        return new NoopLogger();
      };
      return NoopLoggerProvider3;
    }()
  );
  var NOOP_LOGGER_PROVIDER = new NoopLoggerProvider();

  // node_modules/@opentelemetry/instrumentation/node_modules/@opentelemetry/api-logs/build/esm/platform/browser/globalThis.js
  var _globalThis2 = typeof globalThis === "object" ? globalThis : typeof self === "object" ? self : typeof window === "object" ? window : typeof global === "object" ? global : {};

  // node_modules/@opentelemetry/instrumentation/node_modules/@opentelemetry/api-logs/build/esm/internal/global-utils.js
  var GLOBAL_LOGS_API_KEY = Symbol.for("io.opentelemetry.js.api.logs");
  var _global2 = _globalThis2;
  function makeGetter(requiredVersion, instance, fallback) {
    return function(version) {
      return version === requiredVersion ? instance : fallback;
    };
  }
  var API_BACKWARDS_COMPATIBILITY_VERSION = 1;

  // node_modules/@opentelemetry/instrumentation/node_modules/@opentelemetry/api-logs/build/esm/api/logs.js
  var LogsAPI = (
    /** @class */
    function() {
      function LogsAPI3() {
      }
      LogsAPI3.getInstance = function() {
        if (!this._instance) {
          this._instance = new LogsAPI3();
        }
        return this._instance;
      };
      LogsAPI3.prototype.setGlobalLoggerProvider = function(provider) {
        if (_global2[GLOBAL_LOGS_API_KEY]) {
          return this.getLoggerProvider();
        }
        _global2[GLOBAL_LOGS_API_KEY] = makeGetter(API_BACKWARDS_COMPATIBILITY_VERSION, provider, NOOP_LOGGER_PROVIDER);
        return provider;
      };
      LogsAPI3.prototype.getLoggerProvider = function() {
        var _a2, _b;
        return (_b = (_a2 = _global2[GLOBAL_LOGS_API_KEY]) === null || _a2 === void 0 ? void 0 : _a2.call(_global2, API_BACKWARDS_COMPATIBILITY_VERSION)) !== null && _b !== void 0 ? _b : NOOP_LOGGER_PROVIDER;
      };
      LogsAPI3.prototype.getLogger = function(name, version, options) {
        return this.getLoggerProvider().getLogger(name, version, options);
      };
      LogsAPI3.prototype.disable = function() {
        delete _global2[GLOBAL_LOGS_API_KEY];
      };
      return LogsAPI3;
    }()
  );

  // node_modules/@opentelemetry/instrumentation/node_modules/@opentelemetry/api-logs/build/esm/index.js
  var logs = LogsAPI.getInstance();

  // node_modules/@opentelemetry/instrumentation/build/esm/instrumentation.js
  init_esm();
  var shimmer = __toESM(require_shimmer());
  var __assign2 = function() {
    __assign2 = Object.assign || function(t) {
      for (var s, i = 1, n = arguments.length; i < n; i++) {
        s = arguments[i];
        for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
          t[p] = s[p];
      }
      return t;
    };
    return __assign2.apply(this, arguments);
  };
  var InstrumentationAbstract = (
    /** @class */
    function() {
      function InstrumentationAbstract5(instrumentationName, instrumentationVersion, config) {
        this.instrumentationName = instrumentationName;
        this.instrumentationVersion = instrumentationVersion;
        this._wrap = shimmer.wrap;
        this._unwrap = shimmer.unwrap;
        this._massWrap = shimmer.massWrap;
        this._massUnwrap = shimmer.massUnwrap;
        this._config = __assign2({ enabled: true }, config);
        this._diag = diag2.createComponentLogger({
          namespace: instrumentationName
        });
        this._tracer = trace.getTracer(instrumentationName, instrumentationVersion);
        this._meter = metrics.getMeter(instrumentationName, instrumentationVersion);
        this._logger = logs.getLogger(instrumentationName, instrumentationVersion);
        this._updateMetricInstruments();
      }
      Object.defineProperty(InstrumentationAbstract5.prototype, "meter", {
        /* Returns meter */
        get: function() {
          return this._meter;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setMeterProvider = function(meterProvider) {
        this._meter = meterProvider.getMeter(this.instrumentationName, this.instrumentationVersion);
        this._updateMetricInstruments();
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "logger", {
        /* Returns logger */
        get: function() {
          return this._logger;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setLoggerProvider = function(loggerProvider) {
        this._logger = loggerProvider.getLogger(this.instrumentationName, this.instrumentationVersion);
      };
      InstrumentationAbstract5.prototype.getModuleDefinitions = function() {
        var _a2;
        var initResult = (_a2 = this.init()) !== null && _a2 !== void 0 ? _a2 : [];
        if (!Array.isArray(initResult)) {
          return [initResult];
        }
        return initResult;
      };
      InstrumentationAbstract5.prototype._updateMetricInstruments = function() {
        return;
      };
      InstrumentationAbstract5.prototype.getConfig = function() {
        return this._config;
      };
      InstrumentationAbstract5.prototype.setConfig = function(config) {
        this._config = __assign2({}, config);
      };
      InstrumentationAbstract5.prototype.setTracerProvider = function(tracerProvider) {
        this._tracer = tracerProvider.getTracer(this.instrumentationName, this.instrumentationVersion);
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "tracer", {
        /* Returns tracer */
        get: function() {
          return this._tracer;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype._runSpanCustomizationHook = function(hookHandler, triggerName, span, info) {
        if (!hookHandler) {
          return;
        }
        try {
          hookHandler(span, info);
        } catch (e) {
          this._diag.error("Error running span customization hook due to exception in handler", { triggerName }, e);
        }
      };
      return InstrumentationAbstract5;
    }()
  );

  // node_modules/@opentelemetry/instrumentation/build/esm/platform/browser/instrumentation.js
  var __extends4 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var InstrumentationBase = (
    /** @class */
    function(_super) {
      __extends4(InstrumentationBase5, _super);
      function InstrumentationBase5(instrumentationName, instrumentationVersion, config) {
        var _this = _super.call(this, instrumentationName, instrumentationVersion, config) || this;
        if (_this._config.enabled) {
          _this.enable();
        }
        return _this;
      }
      return InstrumentationBase5;
    }(InstrumentationAbstract)
  );

  // node_modules/@opentelemetry/instrumentation/build/esm/utils.js
  function safeExecuteInTheMiddle(execute, onFinish, preventThrowingError) {
    var error;
    var result;
    try {
      result = execute();
    } catch (e) {
      error = e;
    } finally {
      onFinish(error, result);
      if (error && !preventThrowingError) {
        throw error;
      }
      return result;
    }
  }

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/enums/AttributeNames.js
  var AttributeNames;
  (function(AttributeNames4) {
    AttributeNames4["DOCUMENT_LOAD"] = "documentLoad";
    AttributeNames4["DOCUMENT_FETCH"] = "documentFetch";
    AttributeNames4["RESOURCE_FETCH"] = "resourceFetch";
  })(AttributeNames || (AttributeNames = {}));

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/version.js
  var PACKAGE_VERSION = "0.39.0";
  var PACKAGE_NAME = "@opentelemetry/instrumentation-document-load";

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/instrumentation.js
  init_esm2();

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/utils.js
  var import_core13 = __toESM(require_src());

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/enums/EventNames.js
  var EventNames;
  (function(EventNames4) {
    EventNames4["FIRST_PAINT"] = "firstPaint";
    EventNames4["FIRST_CONTENTFUL_PAINT"] = "firstContentfulPaint";
  })(EventNames || (EventNames = {}));

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/utils.js
  var getPerformanceNavigationEntries = function() {
    var _a2, _b;
    var entries = {};
    var performanceNavigationTiming = (_b = (_a2 = import_core13.otperformance).getEntriesByType) === null || _b === void 0 ? void 0 : _b.call(_a2, "navigation")[0];
    if (performanceNavigationTiming) {
      var keys = Object.values(PerformanceTimingNames);
      keys.forEach(function(key) {
        if (hasKey(performanceNavigationTiming, key)) {
          var value = performanceNavigationTiming[key];
          if (typeof value === "number") {
            entries[key] = value;
          }
        }
      });
    } else {
      var perf = import_core13.otperformance;
      var performanceTiming_1 = perf.timing;
      if (performanceTiming_1) {
        var keys = Object.values(PerformanceTimingNames);
        keys.forEach(function(key) {
          if (hasKey(performanceTiming_1, key)) {
            var value = performanceTiming_1[key];
            if (typeof value === "number") {
              entries[key] = value;
            }
          }
        });
      }
    }
    return entries;
  };
  var performancePaintNames = {
    "first-paint": EventNames.FIRST_PAINT,
    "first-contentful-paint": EventNames.FIRST_CONTENTFUL_PAINT
  };
  var addSpanPerformancePaintEvents = function(span) {
    var _a2, _b;
    var performancePaintTiming = (_b = (_a2 = import_core13.otperformance).getEntriesByType) === null || _b === void 0 ? void 0 : _b.call(_a2, "paint");
    if (performancePaintTiming) {
      performancePaintTiming.forEach(function(_a3) {
        var name = _a3.name, startTime = _a3.startTime;
        if (hasKey(performancePaintNames, name)) {
          span.addEvent(performancePaintNames[name], startTime);
        }
      });
    }
  };

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-document-load/build/esm/instrumentation.js
  var __extends5 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var DocumentLoadInstrumentation = (
    /** @class */
    function(_super) {
      __extends5(DocumentLoadInstrumentation2, _super);
      function DocumentLoadInstrumentation2(config) {
        if (config === void 0) {
          config = {};
        }
        var _this = _super.call(this, PACKAGE_NAME, PACKAGE_VERSION, config) || this;
        _this.component = "document-load";
        _this.version = "1";
        _this.moduleName = _this.component;
        return _this;
      }
      DocumentLoadInstrumentation2.prototype.init = function() {
      };
      DocumentLoadInstrumentation2.prototype._onDocumentLoaded = function() {
        var _this = this;
        window.setTimeout(function() {
          _this._collectPerformance();
        });
      };
      DocumentLoadInstrumentation2.prototype._addResourcesSpans = function(rootSpan) {
        var _this = this;
        var _a2, _b;
        var resources = (_b = (_a2 = import_core14.otperformance).getEntriesByType) === null || _b === void 0 ? void 0 : _b.call(_a2, "resource");
        if (resources) {
          resources.forEach(function(resource) {
            _this._initResourceSpan(resource, rootSpan);
          });
        }
      };
      DocumentLoadInstrumentation2.prototype._collectPerformance = function() {
        var _this = this;
        var metaElement = Array.from(document.getElementsByTagName("meta")).find(function(e) {
          return e.getAttribute("name") === import_core14.TRACE_PARENT_HEADER;
        });
        var entries = getPerformanceNavigationEntries();
        var traceparent = metaElement && metaElement.content || "";
        context.with(propagation.extract(ROOT_CONTEXT, { traceparent }), function() {
          var _a2;
          var rootSpan = _this._startSpan(AttributeNames.DOCUMENT_LOAD, PerformanceTimingNames.FETCH_START, entries);
          if (!rootSpan) {
            return;
          }
          context.with(trace.setSpan(context.active(), rootSpan), function() {
            var fetchSpan = _this._startSpan(AttributeNames.DOCUMENT_FETCH, PerformanceTimingNames.FETCH_START, entries);
            if (fetchSpan) {
              fetchSpan.setAttribute(SEMATTRS_HTTP_URL, location.href);
              context.with(trace.setSpan(context.active(), fetchSpan), function() {
                var _a3;
                if (!_this._getConfig().ignoreNetworkEvents) {
                  addSpanNetworkEvents(fetchSpan, entries);
                }
                _this._addCustomAttributesOnSpan(fetchSpan, (_a3 = _this._getConfig().applyCustomAttributesOnSpan) === null || _a3 === void 0 ? void 0 : _a3.documentFetch);
                _this._endSpan(fetchSpan, PerformanceTimingNames.RESPONSE_END, entries);
              });
            }
          });
          rootSpan.setAttribute(SEMATTRS_HTTP_URL, location.href);
          rootSpan.setAttribute(SEMATTRS_HTTP_USER_AGENT, navigator.userAgent);
          _this._addResourcesSpans(rootSpan);
          if (!_this._getConfig().ignoreNetworkEvents) {
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.FETCH_START, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.UNLOAD_EVENT_START, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.UNLOAD_EVENT_END, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.DOM_INTERACTIVE, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.DOM_CONTENT_LOADED_EVENT_START, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.DOM_CONTENT_LOADED_EVENT_END, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.DOM_COMPLETE, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.LOAD_EVENT_START, entries);
            addSpanNetworkEvent(rootSpan, PerformanceTimingNames.LOAD_EVENT_END, entries);
          }
          if (!_this._getConfig().ignorePerformancePaintEvents) {
            addSpanPerformancePaintEvents(rootSpan);
          }
          _this._addCustomAttributesOnSpan(rootSpan, (_a2 = _this._getConfig().applyCustomAttributesOnSpan) === null || _a2 === void 0 ? void 0 : _a2.documentLoad);
          _this._endSpan(rootSpan, PerformanceTimingNames.LOAD_EVENT_END, entries);
        });
      };
      DocumentLoadInstrumentation2.prototype._endSpan = function(span, performanceName, entries) {
        if (span) {
          if (hasKey(entries, performanceName)) {
            span.end(entries[performanceName]);
          } else {
            span.end();
          }
        }
      };
      DocumentLoadInstrumentation2.prototype._initResourceSpan = function(resource, parentSpan) {
        var _a2;
        var span = this._startSpan(AttributeNames.RESOURCE_FETCH, PerformanceTimingNames.FETCH_START, resource, parentSpan);
        if (span) {
          span.setAttribute(SEMATTRS_HTTP_URL, resource.name);
          if (!this._getConfig().ignoreNetworkEvents) {
            addSpanNetworkEvents(span, resource);
          }
          this._addCustomAttributesOnResourceSpan(span, resource, (_a2 = this._getConfig().applyCustomAttributesOnSpan) === null || _a2 === void 0 ? void 0 : _a2.resourceFetch);
          this._endSpan(span, PerformanceTimingNames.RESPONSE_END, resource);
        }
      };
      DocumentLoadInstrumentation2.prototype._startSpan = function(spanName, performanceName, entries, parentSpan) {
        if (hasKey(entries, performanceName) && typeof entries[performanceName] === "number") {
          var span = this.tracer.startSpan(spanName, {
            startTime: entries[performanceName]
          }, parentSpan ? trace.setSpan(context.active(), parentSpan) : void 0);
          return span;
        }
        return void 0;
      };
      DocumentLoadInstrumentation2.prototype._waitForPageLoad = function() {
        if (window.document.readyState === "complete") {
          this._onDocumentLoaded();
        } else {
          this._onDocumentLoaded = this._onDocumentLoaded.bind(this);
          window.addEventListener("load", this._onDocumentLoaded);
        }
      };
      DocumentLoadInstrumentation2.prototype._getConfig = function() {
        return this._config;
      };
      DocumentLoadInstrumentation2.prototype._addCustomAttributesOnSpan = function(span, applyCustomAttributesOnSpan) {
        var _this = this;
        if (applyCustomAttributesOnSpan) {
          safeExecuteInTheMiddle(function() {
            return applyCustomAttributesOnSpan(span);
          }, function(error) {
            if (!error) {
              return;
            }
            _this._diag.error("addCustomAttributesOnSpan", error);
          }, true);
        }
      };
      DocumentLoadInstrumentation2.prototype._addCustomAttributesOnResourceSpan = function(span, resource, applyCustomAttributesOnSpan) {
        var _this = this;
        if (applyCustomAttributesOnSpan) {
          safeExecuteInTheMiddle(function() {
            return applyCustomAttributesOnSpan(span, resource);
          }, function(error) {
            if (!error) {
              return;
            }
            _this._diag.error("addCustomAttributesOnResourceSpan", error);
          }, true);
        }
      };
      DocumentLoadInstrumentation2.prototype.enable = function() {
        window.removeEventListener("load", this._onDocumentLoaded);
        this._waitForPageLoad();
      };
      DocumentLoadInstrumentation2.prototype.disable = function() {
        window.removeEventListener("load", this._onDocumentLoaded);
      };
      return DocumentLoadInstrumentation2;
    }(InstrumentationBase)
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/build/esm/fetch.js
  init_esm();

  // node_modules/@opentelemetry/api-logs/build/esm/NoopLogger.js
  var NoopLogger2 = (
    /** @class */
    function() {
      function NoopLogger3() {
      }
      NoopLogger3.prototype.emit = function(_logRecord) {
      };
      return NoopLogger3;
    }()
  );
  var NOOP_LOGGER2 = new NoopLogger2();

  // node_modules/@opentelemetry/api-logs/build/esm/NoopLoggerProvider.js
  var NoopLoggerProvider2 = (
    /** @class */
    function() {
      function NoopLoggerProvider3() {
      }
      NoopLoggerProvider3.prototype.getLogger = function(_name, _version, _options) {
        return new NoopLogger2();
      };
      return NoopLoggerProvider3;
    }()
  );
  var NOOP_LOGGER_PROVIDER2 = new NoopLoggerProvider2();

  // node_modules/@opentelemetry/api-logs/build/esm/platform/browser/globalThis.js
  var _globalThis3 = typeof globalThis === "object" ? globalThis : typeof self === "object" ? self : typeof window === "object" ? window : typeof global === "object" ? global : {};

  // node_modules/@opentelemetry/api-logs/build/esm/internal/global-utils.js
  var GLOBAL_LOGS_API_KEY2 = Symbol.for("io.opentelemetry.js.api.logs");
  var _global3 = _globalThis3;
  function makeGetter2(requiredVersion, instance, fallback) {
    return function(version) {
      return version === requiredVersion ? instance : fallback;
    };
  }
  var API_BACKWARDS_COMPATIBILITY_VERSION2 = 1;

  // node_modules/@opentelemetry/api-logs/build/esm/api/logs.js
  var LogsAPI2 = (
    /** @class */
    function() {
      function LogsAPI3() {
      }
      LogsAPI3.getInstance = function() {
        if (!this._instance) {
          this._instance = new LogsAPI3();
        }
        return this._instance;
      };
      LogsAPI3.prototype.setGlobalLoggerProvider = function(provider) {
        if (_global3[GLOBAL_LOGS_API_KEY2]) {
          return this.getLoggerProvider();
        }
        _global3[GLOBAL_LOGS_API_KEY2] = makeGetter2(API_BACKWARDS_COMPATIBILITY_VERSION2, provider, NOOP_LOGGER_PROVIDER2);
        return provider;
      };
      LogsAPI3.prototype.getLoggerProvider = function() {
        var _a2, _b;
        return (_b = (_a2 = _global3[GLOBAL_LOGS_API_KEY2]) === null || _a2 === void 0 ? void 0 : _a2.call(_global3, API_BACKWARDS_COMPATIBILITY_VERSION2)) !== null && _b !== void 0 ? _b : NOOP_LOGGER_PROVIDER2;
      };
      LogsAPI3.prototype.getLogger = function(name, version, options) {
        return this.getLoggerProvider().getLogger(name, version, options);
      };
      LogsAPI3.prototype.disable = function() {
        delete _global3[GLOBAL_LOGS_API_KEY2];
      };
      return LogsAPI3;
    }()
  );

  // node_modules/@opentelemetry/api-logs/build/esm/index.js
  var logs2 = LogsAPI2.getInstance();

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/node_modules/@opentelemetry/instrumentation/build/esm/instrumentation.js
  init_esm();
  var shimmer2 = __toESM(require_shimmer());
  var __assign3 = function() {
    __assign3 = Object.assign || function(t) {
      for (var s, i = 1, n = arguments.length; i < n; i++) {
        s = arguments[i];
        for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
          t[p] = s[p];
      }
      return t;
    };
    return __assign3.apply(this, arguments);
  };
  var InstrumentationAbstract2 = (
    /** @class */
    function() {
      function InstrumentationAbstract5(instrumentationName, instrumentationVersion, config) {
        this.instrumentationName = instrumentationName;
        this.instrumentationVersion = instrumentationVersion;
        this._config = {};
        this._wrap = shimmer2.wrap;
        this._unwrap = shimmer2.unwrap;
        this._massWrap = shimmer2.massWrap;
        this._massUnwrap = shimmer2.massUnwrap;
        this.setConfig(config);
        this._diag = diag2.createComponentLogger({
          namespace: instrumentationName
        });
        this._tracer = trace.getTracer(instrumentationName, instrumentationVersion);
        this._meter = metrics.getMeter(instrumentationName, instrumentationVersion);
        this._logger = logs2.getLogger(instrumentationName, instrumentationVersion);
        this._updateMetricInstruments();
      }
      Object.defineProperty(InstrumentationAbstract5.prototype, "meter", {
        /* Returns meter */
        get: function() {
          return this._meter;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setMeterProvider = function(meterProvider) {
        this._meter = meterProvider.getMeter(this.instrumentationName, this.instrumentationVersion);
        this._updateMetricInstruments();
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "logger", {
        /* Returns logger */
        get: function() {
          return this._logger;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setLoggerProvider = function(loggerProvider) {
        this._logger = loggerProvider.getLogger(this.instrumentationName, this.instrumentationVersion);
      };
      InstrumentationAbstract5.prototype.getModuleDefinitions = function() {
        var _a2;
        var initResult = (_a2 = this.init()) !== null && _a2 !== void 0 ? _a2 : [];
        if (!Array.isArray(initResult)) {
          return [initResult];
        }
        return initResult;
      };
      InstrumentationAbstract5.prototype._updateMetricInstruments = function() {
        return;
      };
      InstrumentationAbstract5.prototype.getConfig = function() {
        return this._config;
      };
      InstrumentationAbstract5.prototype.setConfig = function(config) {
        this._config = __assign3({ enabled: true }, config);
      };
      InstrumentationAbstract5.prototype.setTracerProvider = function(tracerProvider) {
        this._tracer = tracerProvider.getTracer(this.instrumentationName, this.instrumentationVersion);
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "tracer", {
        /* Returns tracer */
        get: function() {
          return this._tracer;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype._runSpanCustomizationHook = function(hookHandler, triggerName, span, info) {
        if (!hookHandler) {
          return;
        }
        try {
          hookHandler(span, info);
        } catch (e) {
          this._diag.error("Error running span customization hook due to exception in handler", { triggerName }, e);
        }
      };
      return InstrumentationAbstract5;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/node_modules/@opentelemetry/instrumentation/build/esm/platform/browser/instrumentation.js
  var __extends6 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var InstrumentationBase2 = (
    /** @class */
    function(_super) {
      __extends6(InstrumentationBase5, _super);
      function InstrumentationBase5(instrumentationName, instrumentationVersion, config) {
        var _this = _super.call(this, instrumentationName, instrumentationVersion, config) || this;
        if (_this._config.enabled) {
          _this.enable();
        }
        return _this;
      }
      return InstrumentationBase5;
    }(InstrumentationAbstract2)
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/node_modules/@opentelemetry/instrumentation/build/esm/utils.js
  function safeExecuteInTheMiddle2(execute, onFinish, preventThrowingError) {
    var error;
    var result;
    try {
      result = execute();
    } catch (e) {
      error = e;
    } finally {
      onFinish(error, result);
      if (error && !preventThrowingError) {
        throw error;
      }
      return result;
    }
  }
  function isWrapped(func) {
    return typeof func === "function" && typeof func.__original === "function" && typeof func.__unwrap === "function" && func.__wrapped === true;
  }

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/build/esm/fetch.js
  var core = __toESM(require_src());

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/build/esm/enums/AttributeNames.js
  var AttributeNames2;
  (function(AttributeNames4) {
    AttributeNames4["COMPONENT"] = "component";
    AttributeNames4["HTTP_ERROR_NAME"] = "http.error_name";
    AttributeNames4["HTTP_STATUS_TEXT"] = "http.status_text";
  })(AttributeNames2 || (AttributeNames2 = {}));

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/build/esm/fetch.js
  init_esm2();

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/build/esm/version.js
  var VERSION2 = "0.53.0";

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-fetch/build/esm/fetch.js
  var import_core15 = __toESM(require_src());
  var __extends7 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var _a;
  var OBSERVER_WAIT_TIME_MS = 300;
  var isNode = typeof process === "object" && ((_a = process.release) === null || _a === void 0 ? void 0 : _a.name) === "node";
  var FetchInstrumentation = (
    /** @class */
    function(_super) {
      __extends7(FetchInstrumentation2, _super);
      function FetchInstrumentation2(config) {
        if (config === void 0) {
          config = {};
        }
        var _this = _super.call(this, "@opentelemetry/instrumentation-fetch", VERSION2, config) || this;
        _this.component = "fetch";
        _this.version = VERSION2;
        _this.moduleName = _this.component;
        _this._usedResources = /* @__PURE__ */ new WeakSet();
        _this._tasksCount = 0;
        return _this;
      }
      FetchInstrumentation2.prototype.init = function() {
      };
      FetchInstrumentation2.prototype._addChildSpan = function(span, corsPreFlightRequest) {
        var childSpan = this.tracer.startSpan("CORS Preflight", {
          startTime: corsPreFlightRequest[PerformanceTimingNames.FETCH_START]
        }, trace.setSpan(context.active(), span));
        if (!this.getConfig().ignoreNetworkEvents) {
          addSpanNetworkEvents(childSpan, corsPreFlightRequest);
        }
        childSpan.end(corsPreFlightRequest[PerformanceTimingNames.RESPONSE_END]);
      };
      FetchInstrumentation2.prototype._addFinalSpanAttributes = function(span, response) {
        var parsedUrl = parseUrl(response.url);
        span.setAttribute(SEMATTRS_HTTP_STATUS_CODE, response.status);
        if (response.statusText != null) {
          span.setAttribute(AttributeNames2.HTTP_STATUS_TEXT, response.statusText);
        }
        span.setAttribute(SEMATTRS_HTTP_HOST, parsedUrl.host);
        span.setAttribute(SEMATTRS_HTTP_SCHEME, parsedUrl.protocol.replace(":", ""));
        if (typeof navigator !== "undefined") {
          span.setAttribute(SEMATTRS_HTTP_USER_AGENT, navigator.userAgent);
        }
      };
      FetchInstrumentation2.prototype._addHeaders = function(options, spanUrl) {
        if (!shouldPropagateTraceHeaders(spanUrl, this.getConfig().propagateTraceHeaderCorsUrls)) {
          var headers = {};
          propagation.inject(context.active(), headers);
          if (Object.keys(headers).length > 0) {
            this._diag.debug("headers inject skipped due to CORS policy");
          }
          return;
        }
        if (options instanceof Request) {
          propagation.inject(context.active(), options.headers, {
            set: function(h, k, v) {
              return h.set(k, typeof v === "string" ? v : String(v));
            }
          });
        } else if (options.headers instanceof Headers) {
          propagation.inject(context.active(), options.headers, {
            set: function(h, k, v) {
              return h.set(k, typeof v === "string" ? v : String(v));
            }
          });
        } else if (options.headers instanceof Map) {
          propagation.inject(context.active(), options.headers, {
            set: function(h, k, v) {
              return h.set(k, typeof v === "string" ? v : String(v));
            }
          });
        } else {
          var headers = {};
          propagation.inject(context.active(), headers);
          options.headers = Object.assign({}, headers, options.headers || {});
        }
      };
      FetchInstrumentation2.prototype._clearResources = function() {
        if (this._tasksCount === 0 && this.getConfig().clearTimingResources) {
          performance.clearResourceTimings();
          this._usedResources = /* @__PURE__ */ new WeakSet();
        }
      };
      FetchInstrumentation2.prototype._createSpan = function(url, options) {
        var _a2;
        if (options === void 0) {
          options = {};
        }
        if (core.isUrlIgnored(url, this.getConfig().ignoreUrls)) {
          this._diag.debug("ignoring span as url matches ignored url");
          return;
        }
        var method = (options.method || "GET").toUpperCase();
        var spanName = "HTTP " + method;
        return this.tracer.startSpan(spanName, {
          kind: SpanKind.CLIENT,
          attributes: (_a2 = {}, _a2[AttributeNames2.COMPONENT] = this.moduleName, _a2[SEMATTRS_HTTP_METHOD] = method, _a2[SEMATTRS_HTTP_URL] = url, _a2)
        });
      };
      FetchInstrumentation2.prototype._findResourceAndAddNetworkEvents = function(span, resourcesObserver, endTime) {
        var resources = resourcesObserver.entries;
        if (!resources.length) {
          if (!performance.getEntriesByType) {
            return;
          }
          resources = performance.getEntriesByType("resource");
        }
        var resource = getResource(resourcesObserver.spanUrl, resourcesObserver.startTime, endTime, resources, this._usedResources, "fetch");
        if (resource.mainRequest) {
          var mainRequest = resource.mainRequest;
          this._markResourceAsUsed(mainRequest);
          var corsPreFlightRequest = resource.corsPreFlightRequest;
          if (corsPreFlightRequest) {
            this._addChildSpan(span, corsPreFlightRequest);
            this._markResourceAsUsed(corsPreFlightRequest);
          }
          if (!this.getConfig().ignoreNetworkEvents) {
            addSpanNetworkEvents(span, mainRequest);
          }
        }
      };
      FetchInstrumentation2.prototype._markResourceAsUsed = function(resource) {
        this._usedResources.add(resource);
      };
      FetchInstrumentation2.prototype._endSpan = function(span, spanData, response) {
        var _this = this;
        var endTime = core.millisToHrTime(Date.now());
        var performanceEndTime = core.hrTime();
        this._addFinalSpanAttributes(span, response);
        setTimeout(function() {
          var _a2;
          (_a2 = spanData.observer) === null || _a2 === void 0 ? void 0 : _a2.disconnect();
          _this._findResourceAndAddNetworkEvents(span, spanData, performanceEndTime);
          _this._tasksCount--;
          _this._clearResources();
          span.end(endTime);
        }, OBSERVER_WAIT_TIME_MS);
      };
      FetchInstrumentation2.prototype._patchConstructor = function() {
        var _this = this;
        return function(original) {
          var plugin = _this;
          return function patchConstructor() {
            var args = [];
            for (var _i = 0; _i < arguments.length; _i++) {
              args[_i] = arguments[_i];
            }
            var self2 = this;
            var url = parseUrl(args[0] instanceof Request ? args[0].url : String(args[0])).href;
            var options = args[0] instanceof Request ? args[0] : args[1] || {};
            var createdSpan = plugin._createSpan(url, options);
            if (!createdSpan) {
              return original.apply(this, args);
            }
            var spanData = plugin._prepareSpanData(url);
            function endSpanOnError(span, error) {
              plugin._applyAttributesAfterFetch(span, options, error);
              plugin._endSpan(span, spanData, {
                status: error.status || 0,
                statusText: error.message,
                url
              });
            }
            function endSpanOnSuccess(span, response) {
              plugin._applyAttributesAfterFetch(span, options, response);
              if (response.status >= 200 && response.status < 400) {
                plugin._endSpan(span, spanData, response);
              } else {
                plugin._endSpan(span, spanData, {
                  status: response.status,
                  statusText: response.statusText,
                  url
                });
              }
            }
            function onSuccess(span, resolve, response) {
              try {
                var resClone = response.clone();
                var resClone4Hook_1 = response.clone();
                var body = resClone.body;
                if (body) {
                  var reader_1 = body.getReader();
                  var read_1 = function() {
                    reader_1.read().then(function(_a2) {
                      var done = _a2.done;
                      if (done) {
                        endSpanOnSuccess(span, resClone4Hook_1);
                      } else {
                        read_1();
                      }
                    }, function(error) {
                      endSpanOnError(span, error);
                    });
                  };
                  read_1();
                } else {
                  endSpanOnSuccess(span, response);
                }
              } finally {
                resolve(response);
              }
            }
            function onError(span, reject, error) {
              try {
                endSpanOnError(span, error);
              } finally {
                reject(error);
              }
            }
            return new Promise(function(resolve, reject) {
              return context.with(trace.setSpan(context.active(), createdSpan), function() {
                plugin._addHeaders(options, url);
                plugin._tasksCount++;
                return original.apply(self2, options instanceof Request ? [options] : [url, options]).then(onSuccess.bind(self2, createdSpan, resolve), onError.bind(self2, createdSpan, reject));
              });
            });
          };
        };
      };
      FetchInstrumentation2.prototype._applyAttributesAfterFetch = function(span, request, result) {
        var _this = this;
        var applyCustomAttributesOnSpan = this.getConfig().applyCustomAttributesOnSpan;
        if (applyCustomAttributesOnSpan) {
          safeExecuteInTheMiddle2(function() {
            return applyCustomAttributesOnSpan(span, request, result);
          }, function(error) {
            if (!error) {
              return;
            }
            _this._diag.error("applyCustomAttributesOnSpan", error);
          }, true);
        }
      };
      FetchInstrumentation2.prototype._prepareSpanData = function(spanUrl) {
        var startTime = core.hrTime();
        var entries = [];
        if (typeof PerformanceObserver !== "function") {
          return { entries, startTime, spanUrl };
        }
        var observer = new PerformanceObserver(function(list) {
          var perfObsEntries = list.getEntries();
          perfObsEntries.forEach(function(entry) {
            if (entry.initiatorType === "fetch" && entry.name === spanUrl) {
              entries.push(entry);
            }
          });
        });
        observer.observe({
          entryTypes: ["resource"]
        });
        return { entries, observer, startTime, spanUrl };
      };
      FetchInstrumentation2.prototype.enable = function() {
        if (isNode) {
          this._diag.warn("this instrumentation is intended for web usage only, it does not instrument Node.js's fetch()");
          return;
        }
        if (isWrapped(fetch)) {
          this._unwrap(import_core15._globalThis, "fetch");
          this._diag.debug("removing previous patch for constructor");
        }
        this._wrap(import_core15._globalThis, "fetch", this._patchConstructor());
      };
      FetchInstrumentation2.prototype.disable = function() {
        if (isNode) {
          return;
        }
        this._unwrap(import_core15._globalThis, "fetch");
        this._usedResources = /* @__PURE__ */ new WeakSet();
      };
      return FetchInstrumentation2;
    }(InstrumentationBase2)
  );

  // node_modules/@apexthirdparty/opentelemetry-sdk-trace-base/build/esnext/MultiSpanProcessor.js
  var import_core16 = __toESM(require_src());
  var MultiSpanProcessor2 = class {
    constructor(_spanProcessors) {
      this._spanProcessors = _spanProcessors;
    }
    forceFlush() {
      const promises = [];
      for (const spanProcessor of this._spanProcessors) {
        promises.push(spanProcessor.forceFlush());
      }
      return new Promise((resolve) => {
        Promise.all(promises).then(() => {
          resolve();
        }).catch((error) => {
          (0, import_core16.globalErrorHandler)(error || new Error("MultiSpanProcessor: forceFlush failed"));
          resolve();
        });
      });
    }
    onStart(span, context2) {
      for (const spanProcessor of this._spanProcessors) {
        spanProcessor.onStart(span, context2);
      }
    }
    onEnd(span) {
      for (const spanProcessor of this._spanProcessors) {
        spanProcessor.onEnd(span);
      }
    }
    shutdown() {
      const promises = [];
      for (const spanProcessor of this._spanProcessors) {
        promises.push(spanProcessor.shutdown());
      }
      return new Promise((resolve, reject) => {
        Promise.all(promises).then(() => {
          resolve();
        }, reject);
      });
    }
  };

  // node_modules/@apexthirdparty/opentelemetry-instrumentation/build/esm/autoLoader.js
  init_esm();

  // node_modules/@apexthirdparty/opentelemetry-instrumentation/build/esm/autoLoaderUtils.js
  function enableInstrumentations(instrumentations, tracerProvider, meterProvider, loggerProvider) {
    for (var i = 0, j = instrumentations.length; i < j; i++) {
      var instrumentation = instrumentations[i];
      if (tracerProvider) {
        instrumentation.setTracerProvider(tracerProvider);
      }
      if (meterProvider) {
        instrumentation.setMeterProvider(meterProvider);
      }
      if (loggerProvider && instrumentation.setLoggerProvider) {
        instrumentation.setLoggerProvider(loggerProvider);
      }
      if (!instrumentation.getConfig().enabled) {
        instrumentation.enable();
      }
    }
  }
  function disableInstrumentations(instrumentations) {
    instrumentations.forEach(function(instrumentation) {
      return instrumentation.disable();
    });
  }

  // node_modules/@apexthirdparty/opentelemetry-instrumentation/build/esm/autoLoader.js
  function registerInstrumentations(options) {
    var _a2, _b;
    var tracerProvider = options.tracerProvider || trace.getTracerProvider();
    var meterProvider = options.meterProvider || metrics.getMeterProvider();
    var loggerProvider = options.loggerProvider || logs2.getLoggerProvider();
    var instrumentations = (_b = (_a2 = options.instrumentations) === null || _a2 === void 0 ? void 0 : _a2.flat()) !== null && _b !== void 0 ? _b : [];
    enableInstrumentations(instrumentations, tracerProvider, meterProvider, loggerProvider);
    return function() {
      disableInstrumentations(instrumentations);
    };
  }

  // node_modules/@apexthirdparty/opentelemetry-instrumentation/build/esm/instrumentation.js
  init_esm();
  var shimmer3 = __toESM(require_shimmer());
  var __assign4 = function() {
    __assign4 = Object.assign || function(t) {
      for (var s, i = 1, n = arguments.length; i < n; i++) {
        s = arguments[i];
        for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
          t[p] = s[p];
      }
      return t;
    };
    return __assign4.apply(this, arguments);
  };
  var InstrumentationAbstract3 = (
    /** @class */
    function() {
      function InstrumentationAbstract5(instrumentationName, instrumentationVersion, config) {
        this.instrumentationName = instrumentationName;
        this.instrumentationVersion = instrumentationVersion;
        this._config = {};
        this._wrap = shimmer3.wrap;
        this._unwrap = shimmer3.unwrap;
        this._massWrap = shimmer3.massWrap;
        this._massUnwrap = shimmer3.massUnwrap;
        this.setConfig(config);
        this._diag = diag2.createComponentLogger({
          namespace: instrumentationName
        });
        this._tracer = trace.getTracer(instrumentationName, instrumentationVersion);
        this._meter = metrics.getMeter(instrumentationName, instrumentationVersion);
        this._logger = logs2.getLogger(instrumentationName, instrumentationVersion);
        this._updateMetricInstruments();
      }
      Object.defineProperty(InstrumentationAbstract5.prototype, "meter", {
        /* Returns meter */
        get: function() {
          return this._meter;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setMeterProvider = function(meterProvider) {
        this._meter = meterProvider.getMeter(this.instrumentationName, this.instrumentationVersion);
        this._updateMetricInstruments();
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "logger", {
        /* Returns logger */
        get: function() {
          return this._logger;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setLoggerProvider = function(loggerProvider) {
        this._logger = loggerProvider.getLogger(this.instrumentationName, this.instrumentationVersion);
      };
      InstrumentationAbstract5.prototype.getModuleDefinitions = function() {
        var _a2;
        var initResult = (_a2 = this.init()) !== null && _a2 !== void 0 ? _a2 : [];
        if (!Array.isArray(initResult)) {
          return [initResult];
        }
        return initResult;
      };
      InstrumentationAbstract5.prototype._updateMetricInstruments = function() {
        return;
      };
      InstrumentationAbstract5.prototype.getConfig = function() {
        return this._config;
      };
      InstrumentationAbstract5.prototype.setConfig = function(config) {
        this._config = __assign4({ enabled: true }, config);
      };
      InstrumentationAbstract5.prototype.setTracerProvider = function(tracerProvider) {
        this._tracer = tracerProvider.getTracer(this.instrumentationName, this.instrumentationVersion);
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "tracer", {
        /* Returns tracer */
        get: function() {
          return this._tracer;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype._runSpanCustomizationHook = function(hookHandler, triggerName, span, info) {
        if (!hookHandler) {
          return;
        }
        try {
          hookHandler(span, info);
        } catch (e) {
          this._diag.error("Error running span customization hook due to exception in handler", { triggerName }, e);
        }
      };
      return InstrumentationAbstract5;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation/build/esm/platform/browser/instrumentation.js
  var __extends8 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var InstrumentationBase3 = (
    /** @class */
    function(_super) {
      __extends8(InstrumentationBase5, _super);
      function InstrumentationBase5(instrumentationName, instrumentationVersion, config) {
        var _this = _super.call(this, instrumentationName, instrumentationVersion, config) || this;
        if (_this._config.enabled) {
          _this.enable();
        }
        return _this;
      }
      return InstrumentationBase5;
    }(InstrumentationAbstract3)
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esm/xhr.js
  init_esm();

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/node_modules/@opentelemetry/instrumentation/build/esm/instrumentation.js
  init_esm();
  var shimmer4 = __toESM(require_shimmer());
  var __assign5 = function() {
    __assign5 = Object.assign || function(t) {
      for (var s, i = 1, n = arguments.length; i < n; i++) {
        s = arguments[i];
        for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p))
          t[p] = s[p];
      }
      return t;
    };
    return __assign5.apply(this, arguments);
  };
  var InstrumentationAbstract4 = (
    /** @class */
    function() {
      function InstrumentationAbstract5(instrumentationName, instrumentationVersion, config) {
        this.instrumentationName = instrumentationName;
        this.instrumentationVersion = instrumentationVersion;
        this._config = {};
        this._wrap = shimmer4.wrap;
        this._unwrap = shimmer4.unwrap;
        this._massWrap = shimmer4.massWrap;
        this._massUnwrap = shimmer4.massUnwrap;
        this.setConfig(config);
        this._diag = diag2.createComponentLogger({
          namespace: instrumentationName
        });
        this._tracer = trace.getTracer(instrumentationName, instrumentationVersion);
        this._meter = metrics.getMeter(instrumentationName, instrumentationVersion);
        this._logger = logs2.getLogger(instrumentationName, instrumentationVersion);
        this._updateMetricInstruments();
      }
      Object.defineProperty(InstrumentationAbstract5.prototype, "meter", {
        /* Returns meter */
        get: function() {
          return this._meter;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setMeterProvider = function(meterProvider) {
        this._meter = meterProvider.getMeter(this.instrumentationName, this.instrumentationVersion);
        this._updateMetricInstruments();
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "logger", {
        /* Returns logger */
        get: function() {
          return this._logger;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype.setLoggerProvider = function(loggerProvider) {
        this._logger = loggerProvider.getLogger(this.instrumentationName, this.instrumentationVersion);
      };
      InstrumentationAbstract5.prototype.getModuleDefinitions = function() {
        var _a2;
        var initResult = (_a2 = this.init()) !== null && _a2 !== void 0 ? _a2 : [];
        if (!Array.isArray(initResult)) {
          return [initResult];
        }
        return initResult;
      };
      InstrumentationAbstract5.prototype._updateMetricInstruments = function() {
        return;
      };
      InstrumentationAbstract5.prototype.getConfig = function() {
        return this._config;
      };
      InstrumentationAbstract5.prototype.setConfig = function(config) {
        this._config = __assign5({ enabled: true }, config);
      };
      InstrumentationAbstract5.prototype.setTracerProvider = function(tracerProvider) {
        this._tracer = tracerProvider.getTracer(this.instrumentationName, this.instrumentationVersion);
      };
      Object.defineProperty(InstrumentationAbstract5.prototype, "tracer", {
        /* Returns tracer */
        get: function() {
          return this._tracer;
        },
        enumerable: false,
        configurable: true
      });
      InstrumentationAbstract5.prototype._runSpanCustomizationHook = function(hookHandler, triggerName, span, info) {
        if (!hookHandler) {
          return;
        }
        try {
          hookHandler(span, info);
        } catch (e) {
          this._diag.error("Error running span customization hook due to exception in handler", { triggerName }, e);
        }
      };
      return InstrumentationAbstract5;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/node_modules/@opentelemetry/instrumentation/build/esm/platform/browser/instrumentation.js
  var __extends9 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var InstrumentationBase4 = (
    /** @class */
    function(_super) {
      __extends9(InstrumentationBase5, _super);
      function InstrumentationBase5(instrumentationName, instrumentationVersion, config) {
        var _this = _super.call(this, instrumentationName, instrumentationVersion, config) || this;
        if (_this._config.enabled) {
          _this.enable();
        }
        return _this;
      }
      return InstrumentationBase5;
    }(InstrumentationAbstract4)
  );

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/node_modules/@opentelemetry/instrumentation/build/esm/utils.js
  function safeExecuteInTheMiddle3(execute, onFinish, preventThrowingError) {
    var error;
    var result;
    try {
      result = execute();
    } catch (e) {
      error = e;
    } finally {
      onFinish(error, result);
      if (error && !preventThrowingError) {
        throw error;
      }
      return result;
    }
  }
  function isWrapped2(func) {
    return typeof func === "function" && typeof func.__original === "function" && typeof func.__unwrap === "function" && func.__wrapped === true;
  }

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esm/xhr.js
  var import_core17 = __toESM(require_src());
  init_esm2();

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esm/enums/EventNames.js
  var EventNames2;
  (function(EventNames4) {
    EventNames4["METHOD_OPEN"] = "open";
    EventNames4["METHOD_SEND"] = "send";
    EventNames4["EVENT_ABORT"] = "abort";
    EventNames4["EVENT_ERROR"] = "error";
    EventNames4["EVENT_LOAD"] = "loaded";
    EventNames4["EVENT_TIMEOUT"] = "timeout";
  })(EventNames2 || (EventNames2 = {}));

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esm/version.js
  var VERSION3 = "0.53.0";

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esm/enums/AttributeNames.js
  var AttributeNames3;
  (function(AttributeNames4) {
    AttributeNames4["HTTP_STATUS_TEXT"] = "http.status_text";
  })(AttributeNames3 || (AttributeNames3 = {}));

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esm/xhr.js
  var __extends10 = /* @__PURE__ */ function() {
    var extendStatics = function(d, b) {
      extendStatics = Object.setPrototypeOf || { __proto__: [] } instanceof Array && function(d2, b2) {
        d2.__proto__ = b2;
      } || function(d2, b2) {
        for (var p in b2) if (Object.prototype.hasOwnProperty.call(b2, p)) d2[p] = b2[p];
      };
      return extendStatics(d, b);
    };
    return function(d, b) {
      if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
      extendStatics(d, b);
      function __() {
        this.constructor = d;
      }
      d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
  }();
  var OBSERVER_WAIT_TIME_MS2 = 300;
  var XMLHttpRequestInstrumentation = (
    /** @class */
    function(_super) {
      __extends10(XMLHttpRequestInstrumentation2, _super);
      function XMLHttpRequestInstrumentation2(config) {
        if (config === void 0) {
          config = {};
        }
        var _this = _super.call(this, "@opentelemetry/instrumentation-xml-http-request", VERSION3, config) || this;
        _this.component = "xml-http-request";
        _this.version = VERSION3;
        _this.moduleName = _this.component;
        _this._tasksCount = 0;
        _this._xhrMem = /* @__PURE__ */ new WeakMap();
        _this._usedResources = /* @__PURE__ */ new WeakSet();
        return _this;
      }
      XMLHttpRequestInstrumentation2.prototype.init = function() {
      };
      XMLHttpRequestInstrumentation2.prototype._addHeaders = function(xhr, spanUrl) {
        var url = parseUrl(spanUrl).href;
        if (!shouldPropagateTraceHeaders(url, this.getConfig().propagateTraceHeaderCorsUrls)) {
          var headers_1 = {};
          propagation.inject(context.active(), headers_1);
          if (Object.keys(headers_1).length > 0) {
            this._diag.debug("headers inject skipped due to CORS policy");
          }
          return;
        }
        var headers = {};
        propagation.inject(context.active(), headers);
        Object.keys(headers).forEach(function(key) {
          xhr.setRequestHeader(key, String(headers[key]));
        });
      };
      XMLHttpRequestInstrumentation2.prototype._addChildSpan = function(span, corsPreFlightRequest) {
        var _this = this;
        context.with(trace.setSpan(context.active(), span), function() {
          var childSpan = _this.tracer.startSpan("CORS Preflight", {
            startTime: corsPreFlightRequest[PerformanceTimingNames.FETCH_START]
          });
          if (!_this.getConfig().ignoreNetworkEvents) {
            addSpanNetworkEvents(childSpan, corsPreFlightRequest);
          }
          childSpan.end(corsPreFlightRequest[PerformanceTimingNames.RESPONSE_END]);
        });
      };
      XMLHttpRequestInstrumentation2.prototype._addFinalSpanAttributes = function(span, xhrMem, spanUrl) {
        if (typeof spanUrl === "string") {
          var parsedUrl = parseUrl(spanUrl);
          if (xhrMem.status !== void 0) {
            span.setAttribute(SEMATTRS_HTTP_STATUS_CODE, xhrMem.status);
          }
          if (xhrMem.statusText !== void 0) {
            span.setAttribute(AttributeNames3.HTTP_STATUS_TEXT, xhrMem.statusText);
          }
          span.setAttribute(SEMATTRS_HTTP_HOST, parsedUrl.host);
          span.setAttribute(SEMATTRS_HTTP_SCHEME, parsedUrl.protocol.replace(":", ""));
          span.setAttribute(SEMATTRS_HTTP_USER_AGENT, navigator.userAgent);
        }
      };
      XMLHttpRequestInstrumentation2.prototype._applyAttributesAfterXHR = function(span, xhr) {
        var _this = this;
        var applyCustomAttributesOnSpan = this.getConfig().applyCustomAttributesOnSpan;
        if (typeof applyCustomAttributesOnSpan === "function") {
          safeExecuteInTheMiddle3(function() {
            return applyCustomAttributesOnSpan(span, xhr);
          }, function(error) {
            if (!error) {
              return;
            }
            _this._diag.error("applyCustomAttributesOnSpan", error);
          }, true);
        }
      };
      XMLHttpRequestInstrumentation2.prototype._addResourceObserver = function(xhr, spanUrl) {
        var xhrMem = this._xhrMem.get(xhr);
        if (!xhrMem || typeof PerformanceObserver !== "function" || typeof PerformanceResourceTiming !== "function") {
          return;
        }
        xhrMem.createdResources = {
          observer: new PerformanceObserver(function(list) {
            var entries = list.getEntries();
            var parsedUrl = parseUrl(spanUrl);
            entries.forEach(function(entry) {
              if (entry.initiatorType === "xmlhttprequest" && entry.name === parsedUrl.href) {
                if (xhrMem.createdResources) {
                  xhrMem.createdResources.entries.push(entry);
                }
              }
            });
          }),
          entries: []
        };
        xhrMem.createdResources.observer.observe({
          entryTypes: ["resource"]
        });
      };
      XMLHttpRequestInstrumentation2.prototype._clearResources = function() {
        if (this._tasksCount === 0 && this.getConfig().clearTimingResources) {
          import_core17.otperformance.clearResourceTimings();
          this._xhrMem = /* @__PURE__ */ new WeakMap();
          this._usedResources = /* @__PURE__ */ new WeakSet();
        }
      };
      XMLHttpRequestInstrumentation2.prototype._findResourceAndAddNetworkEvents = function(xhrMem, span, spanUrl, startTime, endTime) {
        if (!spanUrl || !startTime || !endTime || !xhrMem.createdResources) {
          return;
        }
        var resources = xhrMem.createdResources.entries;
        if (!resources || !resources.length) {
          resources = import_core17.otperformance.getEntriesByType("resource");
        }
        var resource = getResource(parseUrl(spanUrl).href, startTime, endTime, resources, this._usedResources);
        if (resource.mainRequest) {
          var mainRequest = resource.mainRequest;
          this._markResourceAsUsed(mainRequest);
          var corsPreFlightRequest = resource.corsPreFlightRequest;
          if (corsPreFlightRequest) {
            this._addChildSpan(span, corsPreFlightRequest);
            this._markResourceAsUsed(corsPreFlightRequest);
          }
          if (!this.getConfig().ignoreNetworkEvents) {
            addSpanNetworkEvents(span, mainRequest);
          }
        }
      };
      XMLHttpRequestInstrumentation2.prototype._cleanPreviousSpanInformation = function(xhr) {
        var xhrMem = this._xhrMem.get(xhr);
        if (xhrMem) {
          var callbackToRemoveEvents = xhrMem.callbackToRemoveEvents;
          if (callbackToRemoveEvents) {
            callbackToRemoveEvents();
          }
          this._xhrMem.delete(xhr);
        }
      };
      XMLHttpRequestInstrumentation2.prototype._createSpan = function(xhr, url, method) {
        var _a2;
        if ((0, import_core17.isUrlIgnored)(url, this.getConfig().ignoreUrls)) {
          this._diag.debug("ignoring span as url matches ignored url");
          return;
        }
        var spanName = method.toUpperCase();
        var currentSpan = this.tracer.startSpan(spanName, {
          kind: SpanKind.CLIENT,
          attributes: (_a2 = {}, _a2[SEMATTRS_HTTP_METHOD] = method, _a2[SEMATTRS_HTTP_URL] = parseUrl(url).toString(), _a2)
        });
        currentSpan.addEvent(EventNames2.METHOD_OPEN);
        this._cleanPreviousSpanInformation(xhr);
        this._xhrMem.set(xhr, {
          span: currentSpan,
          spanUrl: url
        });
        return currentSpan;
      };
      XMLHttpRequestInstrumentation2.prototype._markResourceAsUsed = function(resource) {
        this._usedResources.add(resource);
      };
      XMLHttpRequestInstrumentation2.prototype._patchOpen = function() {
        var _this = this;
        return function(original) {
          var plugin = _this;
          return function patchOpen() {
            var args = [];
            for (var _i = 0; _i < arguments.length; _i++) {
              args[_i] = arguments[_i];
            }
            var method = args[0];
            var url = args[1];
            plugin._createSpan(this, url, method);
            return original.apply(this, args);
          };
        };
      };
      XMLHttpRequestInstrumentation2.prototype._patchSend = function() {
        var plugin = this;
        function endSpanTimeout(eventName, xhrMem, performanceEndTime, endTime) {
          var callbackToRemoveEvents = xhrMem.callbackToRemoveEvents;
          if (typeof callbackToRemoveEvents === "function") {
            callbackToRemoveEvents();
          }
          var span = xhrMem.span, spanUrl = xhrMem.spanUrl, sendStartTime = xhrMem.sendStartTime;
          if (span) {
            plugin._findResourceAndAddNetworkEvents(xhrMem, span, spanUrl, sendStartTime, performanceEndTime);
            span.addEvent(eventName, endTime);
            plugin._addFinalSpanAttributes(span, xhrMem, spanUrl);
            span.end(endTime);
            plugin._tasksCount--;
          }
          plugin._clearResources();
        }
        function endSpan(eventName, xhr) {
          var xhrMem = plugin._xhrMem.get(xhr);
          if (!xhrMem) {
            return;
          }
          xhrMem.status = xhr.status;
          xhrMem.statusText = xhr.statusText;
          plugin._xhrMem.delete(xhr);
          if (xhrMem.span) {
            plugin._applyAttributesAfterXHR(xhrMem.span, xhr);
          }
          var performanceEndTime = (0, import_core17.hrTime)();
          var endTime = Date.now();
          setTimeout(function() {
            endSpanTimeout(eventName, xhrMem, performanceEndTime, endTime);
          }, OBSERVER_WAIT_TIME_MS2);
        }
        function onError() {
          endSpan(EventNames2.EVENT_ERROR, this);
        }
        function onAbort() {
          endSpan(EventNames2.EVENT_ABORT, this);
        }
        function onTimeout() {
          endSpan(EventNames2.EVENT_TIMEOUT, this);
        }
        function onLoad() {
          if (this.status < 299) {
            endSpan(EventNames2.EVENT_LOAD, this);
          } else {
            endSpan(EventNames2.EVENT_ERROR, this);
          }
        }
        function unregister(xhr) {
          xhr.removeEventListener("abort", onAbort);
          xhr.removeEventListener("error", onError);
          xhr.removeEventListener("load", onLoad);
          xhr.removeEventListener("timeout", onTimeout);
          var xhrMem = plugin._xhrMem.get(xhr);
          if (xhrMem) {
            xhrMem.callbackToRemoveEvents = void 0;
          }
        }
        return function(original) {
          return function patchSend() {
            var _this = this;
            var args = [];
            for (var _i = 0; _i < arguments.length; _i++) {
              args[_i] = arguments[_i];
            }
            var xhrMem = plugin._xhrMem.get(this);
            if (!xhrMem) {
              return original.apply(this, args);
            }
            var currentSpan = xhrMem.span;
            var spanUrl = xhrMem.spanUrl;
            if (currentSpan && spanUrl) {
              context.with(trace.setSpan(context.active(), currentSpan), function() {
                plugin._tasksCount++;
                xhrMem.sendStartTime = (0, import_core17.hrTime)();
                currentSpan.addEvent(EventNames2.METHOD_SEND);
                _this.addEventListener("abort", onAbort);
                _this.addEventListener("error", onError);
                _this.addEventListener("load", onLoad);
                _this.addEventListener("timeout", onTimeout);
                xhrMem.callbackToRemoveEvents = function() {
                  unregister(_this);
                  if (xhrMem.createdResources) {
                    xhrMem.createdResources.observer.disconnect();
                  }
                };
                plugin._addHeaders(_this, spanUrl);
                plugin._addResourceObserver(_this, spanUrl);
              });
            }
            return original.apply(this, args);
          };
        };
      };
      XMLHttpRequestInstrumentation2.prototype.enable = function() {
        this._diag.debug("applying patch to", this.moduleName, this.version);
        if (isWrapped2(XMLHttpRequest.prototype.open)) {
          this._unwrap(XMLHttpRequest.prototype, "open");
          this._diag.debug("removing previous patch from method open");
        }
        if (isWrapped2(XMLHttpRequest.prototype.send)) {
          this._unwrap(XMLHttpRequest.prototype, "send");
          this._diag.debug("removing previous patch from method send");
        }
        this._wrap(XMLHttpRequest.prototype, "open", this._patchOpen());
        this._wrap(XMLHttpRequest.prototype, "send", this._patchSend());
      };
      XMLHttpRequestInstrumentation2.prototype.disable = function() {
        this._diag.debug("removing patch from", this.moduleName, this.version);
        this._unwrap(XMLHttpRequest.prototype, "open");
        this._unwrap(XMLHttpRequest.prototype, "send");
        this._tasksCount = 0;
        this._xhrMem = /* @__PURE__ */ new WeakMap();
        this._usedResources = /* @__PURE__ */ new WeakSet();
      };
      return XMLHttpRequestInstrumentation2;
    }(InstrumentationBase4)
  );

  // images/libraries/apex/telemetry/processors/AutoFlushBatchSpanProcessor.mjs
  var import_BatchSpanProcessorBase2 = __toESM(require_BatchSpanProcessorBase(), 1);
  var AutoFlushBatchSpanProcessor = class extends import_BatchSpanProcessorBase2.BatchSpanProcessorBase {
    constructor(exporter, config) {
      super(exporter, config);
      this.onInit();
    }
    /**
     * Initialize the span processor by setting up the event listeners.
     *
     * This may call `forceFlush()` multiple times if multiple listeners are triggered
     * for a given event. This appears to be fine -- the first call "wins" and subsequent
     * calls do nothing. It may be possible to use another feature like `bindOnceFuture`
     * to debounce calls, but some internal state may be needed to reset the bound
     * functions on refocus, which could be unreliable and introduce inconsistencies.
     */
    onInit() {
      if (typeof document !== "undefined") {
        this._visibilityChangeListener = () => {
          if (document.visibilityState === "hidden") {
            void this.forceFlush();
          }
        };
        this._pageHideListener = () => {
          void this.forceFlush();
        };
        document.addEventListener("visibilitychange", this._visibilityChangeListener);
        document.addEventListener("pagehide", this._pageHideListener);
      }
      if (typeof window !== "undefined") {
        this._beforeUnloadListener = () => {
          void this.forceFlush();
        };
        window.addEventListener("beforeunload", this._beforeUnloadListener);
      }
    }
    /**
     * Callback executed on tracer `shutdown`.
     *
     * Used to cleanup event listeners.
     */
    onShutdown() {
      if (typeof document !== "undefined") {
        if (this._visibilityChangeListener) {
          document.removeEventListener("visibilitychange", this._visibilityChangeListener);
        }
        if (this._pageHideListener) {
          document.removeEventListener("pagehide", this._pageHideListener);
        }
      }
      if (typeof window !== "undefined") {
        if (this._beforeUnloadListener) {
          window.removeEventListener("beforeunload", this._beforeUnloadListener);
        }
      }
    }
  };

  // node_modules/@apexthirdparty/opentelemetry-core/build/esm/common/anchored-clock.js
  var AnchoredClock = (
    /** @class */
    function() {
      function AnchoredClock2(systemClock, monotonicClock) {
        this._monotonicClock = monotonicClock;
        this._epochMillis = systemClock.now();
        this._performanceMillis = monotonicClock.now();
      }
      AnchoredClock2.prototype.now = function() {
        var delta = this._monotonicClock.now() - this._performanceMillis;
        return this._epochMillis + delta;
      };
      return AnchoredClock2;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-core/build/esm/common/time.js
  var NANOSECOND_DIGITS = 9;
  var NANOSECOND_DIGITS_IN_MILLIS = 6;
  var MILLISECONDS_TO_NANOSECONDS = Math.pow(10, NANOSECOND_DIGITS_IN_MILLIS);
  var SECOND_TO_NANOSECONDS = Math.pow(10, NANOSECOND_DIGITS);
  function hrTimeDuration2(startTime, endTime) {
    var seconds = endTime[0] - startTime[0];
    var nanos = endTime[1] - startTime[1];
    if (nanos < 0) {
      seconds -= 1;
      nanos += SECOND_TO_NANOSECONDS;
    }
    return [seconds, nanos];
  }
  function hrTimeToMilliseconds(time) {
    return time[0] * 1e3 + time[1] / 1e6;
  }

  // node_modules/@apexthirdparty/opentelemetry-core/build/esm/ExportResult.js
  var ExportResultCode4;
  (function(ExportResultCode5) {
    ExportResultCode5[ExportResultCode5["SUCCESS"] = 0] = "SUCCESS";
    ExportResultCode5[ExportResultCode5["FAILED"] = 1] = "FAILED";
  })(ExportResultCode4 || (ExportResultCode4 = {}));

  // node_modules/@apexthirdparty/pako/dist/pako.esm.mjs
  var Z_FIXED$1 = 4;
  var Z_BINARY = 0;
  var Z_TEXT = 1;
  var Z_UNKNOWN$1 = 2;
  function zero$1(buf) {
    let len = buf.length;
    while (--len >= 0) {
      buf[len] = 0;
    }
  }
  var STORED_BLOCK = 0;
  var STATIC_TREES = 1;
  var DYN_TREES = 2;
  var MIN_MATCH$1 = 3;
  var MAX_MATCH$1 = 258;
  var LENGTH_CODES$1 = 29;
  var LITERALS$1 = 256;
  var L_CODES$1 = LITERALS$1 + 1 + LENGTH_CODES$1;
  var D_CODES$1 = 30;
  var BL_CODES$1 = 19;
  var HEAP_SIZE$1 = 2 * L_CODES$1 + 1;
  var MAX_BITS$1 = 15;
  var Buf_size = 16;
  var MAX_BL_BITS = 7;
  var END_BLOCK = 256;
  var REP_3_6 = 16;
  var REPZ_3_10 = 17;
  var REPZ_11_138 = 18;
  var extra_lbits = (
    /* extra bits for each length code */
    new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 0])
  );
  var extra_dbits = (
    /* extra bits for each distance code */
    new Uint8Array([0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13])
  );
  var extra_blbits = (
    /* extra bits for each bit length code */
    new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 3, 7])
  );
  var bl_order = new Uint8Array([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]);
  var DIST_CODE_LEN = 512;
  var static_ltree = new Array((L_CODES$1 + 2) * 2);
  zero$1(static_ltree);
  var static_dtree = new Array(D_CODES$1 * 2);
  zero$1(static_dtree);
  var _dist_code = new Array(DIST_CODE_LEN);
  zero$1(_dist_code);
  var _length_code = new Array(MAX_MATCH$1 - MIN_MATCH$1 + 1);
  zero$1(_length_code);
  var base_length = new Array(LENGTH_CODES$1);
  zero$1(base_length);
  var base_dist = new Array(D_CODES$1);
  zero$1(base_dist);
  function StaticTreeDesc(static_tree, extra_bits, extra_base, elems, max_length) {
    this.static_tree = static_tree;
    this.extra_bits = extra_bits;
    this.extra_base = extra_base;
    this.elems = elems;
    this.max_length = max_length;
    this.has_stree = static_tree && static_tree.length;
  }
  var static_l_desc;
  var static_d_desc;
  var static_bl_desc;
  function TreeDesc(dyn_tree, stat_desc) {
    this.dyn_tree = dyn_tree;
    this.max_code = 0;
    this.stat_desc = stat_desc;
  }
  var d_code = (dist) => {
    return dist < 256 ? _dist_code[dist] : _dist_code[256 + (dist >>> 7)];
  };
  var put_short = (s, w) => {
    s.pending_buf[s.pending++] = w & 255;
    s.pending_buf[s.pending++] = w >>> 8 & 255;
  };
  var send_bits = (s, value, length) => {
    if (s.bi_valid > Buf_size - length) {
      s.bi_buf |= value << s.bi_valid & 65535;
      put_short(s, s.bi_buf);
      s.bi_buf = value >> Buf_size - s.bi_valid;
      s.bi_valid += length - Buf_size;
    } else {
      s.bi_buf |= value << s.bi_valid & 65535;
      s.bi_valid += length;
    }
  };
  var send_code = (s, c, tree) => {
    send_bits(
      s,
      tree[c * 2],
      tree[c * 2 + 1]
      /*.Len*/
    );
  };
  var bi_reverse = (code, len) => {
    let res = 0;
    do {
      res |= code & 1;
      code >>>= 1;
      res <<= 1;
    } while (--len > 0);
    return res >>> 1;
  };
  var bi_flush = (s) => {
    if (s.bi_valid === 16) {
      put_short(s, s.bi_buf);
      s.bi_buf = 0;
      s.bi_valid = 0;
    } else if (s.bi_valid >= 8) {
      s.pending_buf[s.pending++] = s.bi_buf & 255;
      s.bi_buf >>= 8;
      s.bi_valid -= 8;
    }
  };
  var gen_bitlen = (s, desc) => {
    const tree = desc.dyn_tree;
    const max_code = desc.max_code;
    const stree = desc.stat_desc.static_tree;
    const has_stree = desc.stat_desc.has_stree;
    const extra = desc.stat_desc.extra_bits;
    const base = desc.stat_desc.extra_base;
    const max_length = desc.stat_desc.max_length;
    let h;
    let n, m;
    let bits;
    let xbits;
    let f;
    let overflow = 0;
    for (bits = 0; bits <= MAX_BITS$1; bits++) {
      s.bl_count[bits] = 0;
    }
    tree[s.heap[s.heap_max] * 2 + 1] = 0;
    for (h = s.heap_max + 1; h < HEAP_SIZE$1; h++) {
      n = s.heap[h];
      bits = tree[tree[n * 2 + 1] * 2 + 1] + 1;
      if (bits > max_length) {
        bits = max_length;
        overflow++;
      }
      tree[n * 2 + 1] = bits;
      if (n > max_code) {
        continue;
      }
      s.bl_count[bits]++;
      xbits = 0;
      if (n >= base) {
        xbits = extra[n - base];
      }
      f = tree[n * 2];
      s.opt_len += f * (bits + xbits);
      if (has_stree) {
        s.static_len += f * (stree[n * 2 + 1] + xbits);
      }
    }
    if (overflow === 0) {
      return;
    }
    do {
      bits = max_length - 1;
      while (s.bl_count[bits] === 0) {
        bits--;
      }
      s.bl_count[bits]--;
      s.bl_count[bits + 1] += 2;
      s.bl_count[max_length]--;
      overflow -= 2;
    } while (overflow > 0);
    for (bits = max_length; bits !== 0; bits--) {
      n = s.bl_count[bits];
      while (n !== 0) {
        m = s.heap[--h];
        if (m > max_code) {
          continue;
        }
        if (tree[m * 2 + 1] !== bits) {
          s.opt_len += (bits - tree[m * 2 + 1]) * tree[m * 2];
          tree[m * 2 + 1] = bits;
        }
        n--;
      }
    }
  };
  var gen_codes = (tree, max_code, bl_count) => {
    const next_code = new Array(MAX_BITS$1 + 1);
    let code = 0;
    let bits;
    let n;
    for (bits = 1; bits <= MAX_BITS$1; bits++) {
      code = code + bl_count[bits - 1] << 1;
      next_code[bits] = code;
    }
    for (n = 0; n <= max_code; n++) {
      let len = tree[n * 2 + 1];
      if (len === 0) {
        continue;
      }
      tree[n * 2] = bi_reverse(next_code[len]++, len);
    }
  };
  var tr_static_init = () => {
    let n;
    let bits;
    let length;
    let code;
    let dist;
    const bl_count = new Array(MAX_BITS$1 + 1);
    length = 0;
    for (code = 0; code < LENGTH_CODES$1 - 1; code++) {
      base_length[code] = length;
      for (n = 0; n < 1 << extra_lbits[code]; n++) {
        _length_code[length++] = code;
      }
    }
    _length_code[length - 1] = code;
    dist = 0;
    for (code = 0; code < 16; code++) {
      base_dist[code] = dist;
      for (n = 0; n < 1 << extra_dbits[code]; n++) {
        _dist_code[dist++] = code;
      }
    }
    dist >>= 7;
    for (; code < D_CODES$1; code++) {
      base_dist[code] = dist << 7;
      for (n = 0; n < 1 << extra_dbits[code] - 7; n++) {
        _dist_code[256 + dist++] = code;
      }
    }
    for (bits = 0; bits <= MAX_BITS$1; bits++) {
      bl_count[bits] = 0;
    }
    n = 0;
    while (n <= 143) {
      static_ltree[n * 2 + 1] = 8;
      n++;
      bl_count[8]++;
    }
    while (n <= 255) {
      static_ltree[n * 2 + 1] = 9;
      n++;
      bl_count[9]++;
    }
    while (n <= 279) {
      static_ltree[n * 2 + 1] = 7;
      n++;
      bl_count[7]++;
    }
    while (n <= 287) {
      static_ltree[n * 2 + 1] = 8;
      n++;
      bl_count[8]++;
    }
    gen_codes(static_ltree, L_CODES$1 + 1, bl_count);
    for (n = 0; n < D_CODES$1; n++) {
      static_dtree[n * 2 + 1] = 5;
      static_dtree[n * 2] = bi_reverse(n, 5);
    }
    static_l_desc = new StaticTreeDesc(static_ltree, extra_lbits, LITERALS$1 + 1, L_CODES$1, MAX_BITS$1);
    static_d_desc = new StaticTreeDesc(static_dtree, extra_dbits, 0, D_CODES$1, MAX_BITS$1);
    static_bl_desc = new StaticTreeDesc(new Array(0), extra_blbits, 0, BL_CODES$1, MAX_BL_BITS);
  };
  var init_block = (s) => {
    let n;
    for (n = 0; n < L_CODES$1; n++) {
      s.dyn_ltree[n * 2] = 0;
    }
    for (n = 0; n < D_CODES$1; n++) {
      s.dyn_dtree[n * 2] = 0;
    }
    for (n = 0; n < BL_CODES$1; n++) {
      s.bl_tree[n * 2] = 0;
    }
    s.dyn_ltree[END_BLOCK * 2] = 1;
    s.opt_len = s.static_len = 0;
    s.sym_next = s.matches = 0;
  };
  var bi_windup = (s) => {
    if (s.bi_valid > 8) {
      put_short(s, s.bi_buf);
    } else if (s.bi_valid > 0) {
      s.pending_buf[s.pending++] = s.bi_buf;
    }
    s.bi_buf = 0;
    s.bi_valid = 0;
  };
  var smaller = (tree, n, m, depth) => {
    const _n2 = n * 2;
    const _m2 = m * 2;
    return tree[_n2] < tree[_m2] || tree[_n2] === tree[_m2] && depth[n] <= depth[m];
  };
  var pqdownheap = (s, tree, k) => {
    const v = s.heap[k];
    let j = k << 1;
    while (j <= s.heap_len) {
      if (j < s.heap_len && smaller(tree, s.heap[j + 1], s.heap[j], s.depth)) {
        j++;
      }
      if (smaller(tree, v, s.heap[j], s.depth)) {
        break;
      }
      s.heap[k] = s.heap[j];
      k = j;
      j <<= 1;
    }
    s.heap[k] = v;
  };
  var compress_block = (s, ltree, dtree) => {
    let dist;
    let lc;
    let sx = 0;
    let code;
    let extra;
    if (s.sym_next !== 0) {
      do {
        dist = s.pending_buf[s.sym_buf + sx++] & 255;
        dist += (s.pending_buf[s.sym_buf + sx++] & 255) << 8;
        lc = s.pending_buf[s.sym_buf + sx++];
        if (dist === 0) {
          send_code(s, lc, ltree);
        } else {
          code = _length_code[lc];
          send_code(s, code + LITERALS$1 + 1, ltree);
          extra = extra_lbits[code];
          if (extra !== 0) {
            lc -= base_length[code];
            send_bits(s, lc, extra);
          }
          dist--;
          code = d_code(dist);
          send_code(s, code, dtree);
          extra = extra_dbits[code];
          if (extra !== 0) {
            dist -= base_dist[code];
            send_bits(s, dist, extra);
          }
        }
      } while (sx < s.sym_next);
    }
    send_code(s, END_BLOCK, ltree);
  };
  var build_tree = (s, desc) => {
    const tree = desc.dyn_tree;
    const stree = desc.stat_desc.static_tree;
    const has_stree = desc.stat_desc.has_stree;
    const elems = desc.stat_desc.elems;
    let n, m;
    let max_code = -1;
    let node;
    s.heap_len = 0;
    s.heap_max = HEAP_SIZE$1;
    for (n = 0; n < elems; n++) {
      if (tree[n * 2] !== 0) {
        s.heap[++s.heap_len] = max_code = n;
        s.depth[n] = 0;
      } else {
        tree[n * 2 + 1] = 0;
      }
    }
    while (s.heap_len < 2) {
      node = s.heap[++s.heap_len] = max_code < 2 ? ++max_code : 0;
      tree[node * 2] = 1;
      s.depth[node] = 0;
      s.opt_len--;
      if (has_stree) {
        s.static_len -= stree[node * 2 + 1];
      }
    }
    desc.max_code = max_code;
    for (n = s.heap_len >> 1; n >= 1; n--) {
      pqdownheap(s, tree, n);
    }
    node = elems;
    do {
      n = s.heap[
        1
        /*SMALLEST*/
      ];
      s.heap[
        1
        /*SMALLEST*/
      ] = s.heap[s.heap_len--];
      pqdownheap(
        s,
        tree,
        1
        /*SMALLEST*/
      );
      m = s.heap[
        1
        /*SMALLEST*/
      ];
      s.heap[--s.heap_max] = n;
      s.heap[--s.heap_max] = m;
      tree[node * 2] = tree[n * 2] + tree[m * 2];
      s.depth[node] = (s.depth[n] >= s.depth[m] ? s.depth[n] : s.depth[m]) + 1;
      tree[n * 2 + 1] = tree[m * 2 + 1] = node;
      s.heap[
        1
        /*SMALLEST*/
      ] = node++;
      pqdownheap(
        s,
        tree,
        1
        /*SMALLEST*/
      );
    } while (s.heap_len >= 2);
    s.heap[--s.heap_max] = s.heap[
      1
      /*SMALLEST*/
    ];
    gen_bitlen(s, desc);
    gen_codes(tree, max_code, s.bl_count);
  };
  var scan_tree = (s, tree, max_code) => {
    let n;
    let prevlen = -1;
    let curlen;
    let nextlen = tree[0 * 2 + 1];
    let count = 0;
    let max_count = 7;
    let min_count = 4;
    if (nextlen === 0) {
      max_count = 138;
      min_count = 3;
    }
    tree[(max_code + 1) * 2 + 1] = 65535;
    for (n = 0; n <= max_code; n++) {
      curlen = nextlen;
      nextlen = tree[(n + 1) * 2 + 1];
      if (++count < max_count && curlen === nextlen) {
        continue;
      } else if (count < min_count) {
        s.bl_tree[curlen * 2] += count;
      } else if (curlen !== 0) {
        if (curlen !== prevlen) {
          s.bl_tree[curlen * 2]++;
        }
        s.bl_tree[REP_3_6 * 2]++;
      } else if (count <= 10) {
        s.bl_tree[REPZ_3_10 * 2]++;
      } else {
        s.bl_tree[REPZ_11_138 * 2]++;
      }
      count = 0;
      prevlen = curlen;
      if (nextlen === 0) {
        max_count = 138;
        min_count = 3;
      } else if (curlen === nextlen) {
        max_count = 6;
        min_count = 3;
      } else {
        max_count = 7;
        min_count = 4;
      }
    }
  };
  var send_tree = (s, tree, max_code) => {
    let n;
    let prevlen = -1;
    let curlen;
    let nextlen = tree[0 * 2 + 1];
    let count = 0;
    let max_count = 7;
    let min_count = 4;
    if (nextlen === 0) {
      max_count = 138;
      min_count = 3;
    }
    for (n = 0; n <= max_code; n++) {
      curlen = nextlen;
      nextlen = tree[(n + 1) * 2 + 1];
      if (++count < max_count && curlen === nextlen) {
        continue;
      } else if (count < min_count) {
        do {
          send_code(s, curlen, s.bl_tree);
        } while (--count !== 0);
      } else if (curlen !== 0) {
        if (curlen !== prevlen) {
          send_code(s, curlen, s.bl_tree);
          count--;
        }
        send_code(s, REP_3_6, s.bl_tree);
        send_bits(s, count - 3, 2);
      } else if (count <= 10) {
        send_code(s, REPZ_3_10, s.bl_tree);
        send_bits(s, count - 3, 3);
      } else {
        send_code(s, REPZ_11_138, s.bl_tree);
        send_bits(s, count - 11, 7);
      }
      count = 0;
      prevlen = curlen;
      if (nextlen === 0) {
        max_count = 138;
        min_count = 3;
      } else if (curlen === nextlen) {
        max_count = 6;
        min_count = 3;
      } else {
        max_count = 7;
        min_count = 4;
      }
    }
  };
  var build_bl_tree = (s) => {
    let max_blindex;
    scan_tree(s, s.dyn_ltree, s.l_desc.max_code);
    scan_tree(s, s.dyn_dtree, s.d_desc.max_code);
    build_tree(s, s.bl_desc);
    for (max_blindex = BL_CODES$1 - 1; max_blindex >= 3; max_blindex--) {
      if (s.bl_tree[bl_order[max_blindex] * 2 + 1] !== 0) {
        break;
      }
    }
    s.opt_len += 3 * (max_blindex + 1) + 5 + 5 + 4;
    return max_blindex;
  };
  var send_all_trees = (s, lcodes, dcodes, blcodes) => {
    let rank2;
    send_bits(s, lcodes - 257, 5);
    send_bits(s, dcodes - 1, 5);
    send_bits(s, blcodes - 4, 4);
    for (rank2 = 0; rank2 < blcodes; rank2++) {
      send_bits(s, s.bl_tree[bl_order[rank2] * 2 + 1], 3);
    }
    send_tree(s, s.dyn_ltree, lcodes - 1);
    send_tree(s, s.dyn_dtree, dcodes - 1);
  };
  var detect_data_type = (s) => {
    let block_mask = 4093624447;
    let n;
    for (n = 0; n <= 31; n++, block_mask >>>= 1) {
      if (block_mask & 1 && s.dyn_ltree[n * 2] !== 0) {
        return Z_BINARY;
      }
    }
    if (s.dyn_ltree[9 * 2] !== 0 || s.dyn_ltree[10 * 2] !== 0 || s.dyn_ltree[13 * 2] !== 0) {
      return Z_TEXT;
    }
    for (n = 32; n < LITERALS$1; n++) {
      if (s.dyn_ltree[n * 2] !== 0) {
        return Z_TEXT;
      }
    }
    return Z_BINARY;
  };
  var static_init_done = false;
  var _tr_init$1 = (s) => {
    if (!static_init_done) {
      tr_static_init();
      static_init_done = true;
    }
    s.l_desc = new TreeDesc(s.dyn_ltree, static_l_desc);
    s.d_desc = new TreeDesc(s.dyn_dtree, static_d_desc);
    s.bl_desc = new TreeDesc(s.bl_tree, static_bl_desc);
    s.bi_buf = 0;
    s.bi_valid = 0;
    init_block(s);
  };
  var _tr_stored_block$1 = (s, buf, stored_len, last) => {
    send_bits(s, (STORED_BLOCK << 1) + (last ? 1 : 0), 3);
    bi_windup(s);
    put_short(s, stored_len);
    put_short(s, ~stored_len);
    if (stored_len) {
      s.pending_buf.set(s.window.subarray(buf, buf + stored_len), s.pending);
    }
    s.pending += stored_len;
  };
  var _tr_align$1 = (s) => {
    send_bits(s, STATIC_TREES << 1, 3);
    send_code(s, END_BLOCK, static_ltree);
    bi_flush(s);
  };
  var _tr_flush_block$1 = (s, buf, stored_len, last) => {
    let opt_lenb, static_lenb;
    let max_blindex = 0;
    if (s.level > 0) {
      if (s.strm.data_type === Z_UNKNOWN$1) {
        s.strm.data_type = detect_data_type(s);
      }
      build_tree(s, s.l_desc);
      build_tree(s, s.d_desc);
      max_blindex = build_bl_tree(s);
      opt_lenb = s.opt_len + 3 + 7 >>> 3;
      static_lenb = s.static_len + 3 + 7 >>> 3;
      if (static_lenb <= opt_lenb) {
        opt_lenb = static_lenb;
      }
    } else {
      opt_lenb = static_lenb = stored_len + 5;
    }
    if (stored_len + 4 <= opt_lenb && buf !== -1) {
      _tr_stored_block$1(s, buf, stored_len, last);
    } else if (s.strategy === Z_FIXED$1 || static_lenb === opt_lenb) {
      send_bits(s, (STATIC_TREES << 1) + (last ? 1 : 0), 3);
      compress_block(s, static_ltree, static_dtree);
    } else {
      send_bits(s, (DYN_TREES << 1) + (last ? 1 : 0), 3);
      send_all_trees(s, s.l_desc.max_code + 1, s.d_desc.max_code + 1, max_blindex + 1);
      compress_block(s, s.dyn_ltree, s.dyn_dtree);
    }
    init_block(s);
    if (last) {
      bi_windup(s);
    }
  };
  var _tr_tally$1 = (s, dist, lc) => {
    s.pending_buf[s.sym_buf + s.sym_next++] = dist;
    s.pending_buf[s.sym_buf + s.sym_next++] = dist >> 8;
    s.pending_buf[s.sym_buf + s.sym_next++] = lc;
    if (dist === 0) {
      s.dyn_ltree[lc * 2]++;
    } else {
      s.matches++;
      dist--;
      s.dyn_ltree[(_length_code[lc] + LITERALS$1 + 1) * 2]++;
      s.dyn_dtree[d_code(dist) * 2]++;
    }
    return s.sym_next === s.sym_end;
  };
  var _tr_init_1 = _tr_init$1;
  var _tr_stored_block_1 = _tr_stored_block$1;
  var _tr_flush_block_1 = _tr_flush_block$1;
  var _tr_tally_1 = _tr_tally$1;
  var _tr_align_1 = _tr_align$1;
  var trees = {
    _tr_init: _tr_init_1,
    _tr_stored_block: _tr_stored_block_1,
    _tr_flush_block: _tr_flush_block_1,
    _tr_tally: _tr_tally_1,
    _tr_align: _tr_align_1
  };
  var adler32 = (adler, buf, len, pos) => {
    let s1 = adler & 65535 | 0, s2 = adler >>> 16 & 65535 | 0, n = 0;
    while (len !== 0) {
      n = len > 2e3 ? 2e3 : len;
      len -= n;
      do {
        s1 = s1 + buf[pos++] | 0;
        s2 = s2 + s1 | 0;
      } while (--n);
      s1 %= 65521;
      s2 %= 65521;
    }
    return s1 | s2 << 16 | 0;
  };
  var adler32_1 = adler32;
  var makeTable = () => {
    let c, table = [];
    for (var n = 0; n < 256; n++) {
      c = n;
      for (var k = 0; k < 8; k++) {
        c = c & 1 ? 3988292384 ^ c >>> 1 : c >>> 1;
      }
      table[n] = c;
    }
    return table;
  };
  var crcTable = new Uint32Array(makeTable());
  var crc32 = (crc, buf, len, pos) => {
    const t = crcTable;
    const end = pos + len;
    crc ^= -1;
    for (let i = pos; i < end; i++) {
      crc = crc >>> 8 ^ t[(crc ^ buf[i]) & 255];
    }
    return crc ^ -1;
  };
  var crc32_1 = crc32;
  var messages = {
    2: "need dictionary",
    /* Z_NEED_DICT       2  */
    1: "stream end",
    /* Z_STREAM_END      1  */
    0: "",
    /* Z_OK              0  */
    "-1": "file error",
    /* Z_ERRNO         (-1) */
    "-2": "stream error",
    /* Z_STREAM_ERROR  (-2) */
    "-3": "data error",
    /* Z_DATA_ERROR    (-3) */
    "-4": "insufficient memory",
    /* Z_MEM_ERROR     (-4) */
    "-5": "buffer error",
    /* Z_BUF_ERROR     (-5) */
    "-6": "incompatible version"
    /* Z_VERSION_ERROR (-6) */
  };
  var constants$2 = {
    /* Allowed flush values; see deflate() and inflate() below for details */
    Z_NO_FLUSH: 0,
    Z_PARTIAL_FLUSH: 1,
    Z_SYNC_FLUSH: 2,
    Z_FULL_FLUSH: 3,
    Z_FINISH: 4,
    Z_BLOCK: 5,
    Z_TREES: 6,
    /* Return codes for the compression/decompression functions. Negative values
    * are errors, positive values are used for special but normal events.
    */
    Z_OK: 0,
    Z_STREAM_END: 1,
    Z_NEED_DICT: 2,
    Z_ERRNO: -1,
    Z_STREAM_ERROR: -2,
    Z_DATA_ERROR: -3,
    Z_MEM_ERROR: -4,
    Z_BUF_ERROR: -5,
    //Z_VERSION_ERROR: -6,
    /* compression levels */
    Z_NO_COMPRESSION: 0,
    Z_BEST_SPEED: 1,
    Z_BEST_COMPRESSION: 9,
    Z_DEFAULT_COMPRESSION: -1,
    Z_FILTERED: 1,
    Z_HUFFMAN_ONLY: 2,
    Z_RLE: 3,
    Z_FIXED: 4,
    Z_DEFAULT_STRATEGY: 0,
    /* Possible values of the data_type field (though see inflate()) */
    Z_BINARY: 0,
    Z_TEXT: 1,
    //Z_ASCII:                1, // = Z_TEXT (deprecated)
    Z_UNKNOWN: 2,
    /* The deflate compression method */
    Z_DEFLATED: 8
    //Z_NULL:                 null // Use -1 or null inline, depending on var type
  };
  var { _tr_init, _tr_stored_block, _tr_flush_block, _tr_tally, _tr_align } = trees;
  var {
    Z_NO_FLUSH: Z_NO_FLUSH$2,
    Z_PARTIAL_FLUSH,
    Z_FULL_FLUSH: Z_FULL_FLUSH$1,
    Z_FINISH: Z_FINISH$3,
    Z_BLOCK: Z_BLOCK$1,
    Z_OK: Z_OK$3,
    Z_STREAM_END: Z_STREAM_END$3,
    Z_STREAM_ERROR: Z_STREAM_ERROR$2,
    Z_DATA_ERROR: Z_DATA_ERROR$2,
    Z_BUF_ERROR: Z_BUF_ERROR$1,
    Z_DEFAULT_COMPRESSION: Z_DEFAULT_COMPRESSION$1,
    Z_FILTERED,
    Z_HUFFMAN_ONLY,
    Z_RLE,
    Z_FIXED,
    Z_DEFAULT_STRATEGY: Z_DEFAULT_STRATEGY$1,
    Z_UNKNOWN,
    Z_DEFLATED: Z_DEFLATED$2
  } = constants$2;
  var MAX_MEM_LEVEL = 9;
  var MAX_WBITS$1 = 15;
  var DEF_MEM_LEVEL = 8;
  var LENGTH_CODES = 29;
  var LITERALS = 256;
  var L_CODES = LITERALS + 1 + LENGTH_CODES;
  var D_CODES = 30;
  var BL_CODES = 19;
  var HEAP_SIZE = 2 * L_CODES + 1;
  var MAX_BITS = 15;
  var MIN_MATCH = 3;
  var MAX_MATCH = 258;
  var MIN_LOOKAHEAD = MAX_MATCH + MIN_MATCH + 1;
  var PRESET_DICT = 32;
  var INIT_STATE = 42;
  var GZIP_STATE = 57;
  var EXTRA_STATE = 69;
  var NAME_STATE = 73;
  var COMMENT_STATE = 91;
  var HCRC_STATE = 103;
  var BUSY_STATE = 113;
  var FINISH_STATE = 666;
  var BS_NEED_MORE = 1;
  var BS_BLOCK_DONE = 2;
  var BS_FINISH_STARTED = 3;
  var BS_FINISH_DONE = 4;
  var OS_CODE = 3;
  var err = (strm, errorCode) => {
    strm.msg = messages[errorCode];
    return errorCode;
  };
  var rank = (f) => {
    return f * 2 - (f > 4 ? 9 : 0);
  };
  var zero = (buf) => {
    let len = buf.length;
    while (--len >= 0) {
      buf[len] = 0;
    }
  };
  var slide_hash = (s) => {
    let n, m;
    let p;
    let wsize = s.w_size;
    n = s.hash_size;
    p = n;
    do {
      m = s.head[--p];
      s.head[p] = m >= wsize ? m - wsize : 0;
    } while (--n);
    n = wsize;
    p = n;
    do {
      m = s.prev[--p];
      s.prev[p] = m >= wsize ? m - wsize : 0;
    } while (--n);
  };
  var HASH_ZLIB = (s, prev, data) => (prev << s.hash_shift ^ data) & s.hash_mask;
  var HASH = HASH_ZLIB;
  var flush_pending = (strm) => {
    const s = strm.state;
    let len = s.pending;
    if (len > strm.avail_out) {
      len = strm.avail_out;
    }
    if (len === 0) {
      return;
    }
    strm.output.set(s.pending_buf.subarray(s.pending_out, s.pending_out + len), strm.next_out);
    strm.next_out += len;
    s.pending_out += len;
    strm.total_out += len;
    strm.avail_out -= len;
    s.pending -= len;
    if (s.pending === 0) {
      s.pending_out = 0;
    }
  };
  var flush_block_only = (s, last) => {
    _tr_flush_block(s, s.block_start >= 0 ? s.block_start : -1, s.strstart - s.block_start, last);
    s.block_start = s.strstart;
    flush_pending(s.strm);
  };
  var put_byte = (s, b) => {
    s.pending_buf[s.pending++] = b;
  };
  var putShortMSB = (s, b) => {
    s.pending_buf[s.pending++] = b >>> 8 & 255;
    s.pending_buf[s.pending++] = b & 255;
  };
  var read_buf = (strm, buf, start, size) => {
    let len = strm.avail_in;
    if (len > size) {
      len = size;
    }
    if (len === 0) {
      return 0;
    }
    strm.avail_in -= len;
    buf.set(strm.input.subarray(strm.next_in, strm.next_in + len), start);
    if (strm.state.wrap === 1) {
      strm.adler = adler32_1(strm.adler, buf, len, start);
    } else if (strm.state.wrap === 2) {
      strm.adler = crc32_1(strm.adler, buf, len, start);
    }
    strm.next_in += len;
    strm.total_in += len;
    return len;
  };
  var longest_match = (s, cur_match) => {
    let chain_length = s.max_chain_length;
    let scan = s.strstart;
    let match;
    let len;
    let best_len = s.prev_length;
    let nice_match = s.nice_match;
    const limit = s.strstart > s.w_size - MIN_LOOKAHEAD ? s.strstart - (s.w_size - MIN_LOOKAHEAD) : 0;
    const _win = s.window;
    const wmask = s.w_mask;
    const prev = s.prev;
    const strend = s.strstart + MAX_MATCH;
    let scan_end1 = _win[scan + best_len - 1];
    let scan_end = _win[scan + best_len];
    if (s.prev_length >= s.good_match) {
      chain_length >>= 2;
    }
    if (nice_match > s.lookahead) {
      nice_match = s.lookahead;
    }
    do {
      match = cur_match;
      if (_win[match + best_len] !== scan_end || _win[match + best_len - 1] !== scan_end1 || _win[match] !== _win[scan] || _win[++match] !== _win[scan + 1]) {
        continue;
      }
      scan += 2;
      match++;
      do {
      } while (_win[++scan] === _win[++match] && _win[++scan] === _win[++match] && _win[++scan] === _win[++match] && _win[++scan] === _win[++match] && _win[++scan] === _win[++match] && _win[++scan] === _win[++match] && _win[++scan] === _win[++match] && _win[++scan] === _win[++match] && scan < strend);
      len = MAX_MATCH - (strend - scan);
      scan = strend - MAX_MATCH;
      if (len > best_len) {
        s.match_start = cur_match;
        best_len = len;
        if (len >= nice_match) {
          break;
        }
        scan_end1 = _win[scan + best_len - 1];
        scan_end = _win[scan + best_len];
      }
    } while ((cur_match = prev[cur_match & wmask]) > limit && --chain_length !== 0);
    if (best_len <= s.lookahead) {
      return best_len;
    }
    return s.lookahead;
  };
  var fill_window = (s) => {
    const _w_size = s.w_size;
    let n, more, str;
    do {
      more = s.window_size - s.lookahead - s.strstart;
      if (s.strstart >= _w_size + (_w_size - MIN_LOOKAHEAD)) {
        s.window.set(s.window.subarray(_w_size, _w_size + _w_size - more), 0);
        s.match_start -= _w_size;
        s.strstart -= _w_size;
        s.block_start -= _w_size;
        if (s.insert > s.strstart) {
          s.insert = s.strstart;
        }
        slide_hash(s);
        more += _w_size;
      }
      if (s.strm.avail_in === 0) {
        break;
      }
      n = read_buf(s.strm, s.window, s.strstart + s.lookahead, more);
      s.lookahead += n;
      if (s.lookahead + s.insert >= MIN_MATCH) {
        str = s.strstart - s.insert;
        s.ins_h = s.window[str];
        s.ins_h = HASH(s, s.ins_h, s.window[str + 1]);
        while (s.insert) {
          s.ins_h = HASH(s, s.ins_h, s.window[str + MIN_MATCH - 1]);
          s.prev[str & s.w_mask] = s.head[s.ins_h];
          s.head[s.ins_h] = str;
          str++;
          s.insert--;
          if (s.lookahead + s.insert < MIN_MATCH) {
            break;
          }
        }
      }
    } while (s.lookahead < MIN_LOOKAHEAD && s.strm.avail_in !== 0);
  };
  var deflate_stored = (s, flush) => {
    let min_block = s.pending_buf_size - 5 > s.w_size ? s.w_size : s.pending_buf_size - 5;
    let len, left, have, last = 0;
    let used = s.strm.avail_in;
    do {
      len = 65535;
      have = s.bi_valid + 42 >> 3;
      if (s.strm.avail_out < have) {
        break;
      }
      have = s.strm.avail_out - have;
      left = s.strstart - s.block_start;
      if (len > left + s.strm.avail_in) {
        len = left + s.strm.avail_in;
      }
      if (len > have) {
        len = have;
      }
      if (len < min_block && (len === 0 && flush !== Z_FINISH$3 || flush === Z_NO_FLUSH$2 || len !== left + s.strm.avail_in)) {
        break;
      }
      last = flush === Z_FINISH$3 && len === left + s.strm.avail_in ? 1 : 0;
      _tr_stored_block(s, 0, 0, last);
      s.pending_buf[s.pending - 4] = len;
      s.pending_buf[s.pending - 3] = len >> 8;
      s.pending_buf[s.pending - 2] = ~len;
      s.pending_buf[s.pending - 1] = ~len >> 8;
      flush_pending(s.strm);
      if (left) {
        if (left > len) {
          left = len;
        }
        s.strm.output.set(s.window.subarray(s.block_start, s.block_start + left), s.strm.next_out);
        s.strm.next_out += left;
        s.strm.avail_out -= left;
        s.strm.total_out += left;
        s.block_start += left;
        len -= left;
      }
      if (len) {
        read_buf(s.strm, s.strm.output, s.strm.next_out, len);
        s.strm.next_out += len;
        s.strm.avail_out -= len;
        s.strm.total_out += len;
      }
    } while (last === 0);
    used -= s.strm.avail_in;
    if (used) {
      if (used >= s.w_size) {
        s.matches = 2;
        s.window.set(s.strm.input.subarray(s.strm.next_in - s.w_size, s.strm.next_in), 0);
        s.strstart = s.w_size;
        s.insert = s.strstart;
      } else {
        if (s.window_size - s.strstart <= used) {
          s.strstart -= s.w_size;
          s.window.set(s.window.subarray(s.w_size, s.w_size + s.strstart), 0);
          if (s.matches < 2) {
            s.matches++;
          }
          if (s.insert > s.strstart) {
            s.insert = s.strstart;
          }
        }
        s.window.set(s.strm.input.subarray(s.strm.next_in - used, s.strm.next_in), s.strstart);
        s.strstart += used;
        s.insert += used > s.w_size - s.insert ? s.w_size - s.insert : used;
      }
      s.block_start = s.strstart;
    }
    if (s.high_water < s.strstart) {
      s.high_water = s.strstart;
    }
    if (last) {
      return BS_FINISH_DONE;
    }
    if (flush !== Z_NO_FLUSH$2 && flush !== Z_FINISH$3 && s.strm.avail_in === 0 && s.strstart === s.block_start) {
      return BS_BLOCK_DONE;
    }
    have = s.window_size - s.strstart;
    if (s.strm.avail_in > have && s.block_start >= s.w_size) {
      s.block_start -= s.w_size;
      s.strstart -= s.w_size;
      s.window.set(s.window.subarray(s.w_size, s.w_size + s.strstart), 0);
      if (s.matches < 2) {
        s.matches++;
      }
      have += s.w_size;
      if (s.insert > s.strstart) {
        s.insert = s.strstart;
      }
    }
    if (have > s.strm.avail_in) {
      have = s.strm.avail_in;
    }
    if (have) {
      read_buf(s.strm, s.window, s.strstart, have);
      s.strstart += have;
      s.insert += have > s.w_size - s.insert ? s.w_size - s.insert : have;
    }
    if (s.high_water < s.strstart) {
      s.high_water = s.strstart;
    }
    have = s.bi_valid + 42 >> 3;
    have = s.pending_buf_size - have > 65535 ? 65535 : s.pending_buf_size - have;
    min_block = have > s.w_size ? s.w_size : have;
    left = s.strstart - s.block_start;
    if (left >= min_block || (left || flush === Z_FINISH$3) && flush !== Z_NO_FLUSH$2 && s.strm.avail_in === 0 && left <= have) {
      len = left > have ? have : left;
      last = flush === Z_FINISH$3 && s.strm.avail_in === 0 && len === left ? 1 : 0;
      _tr_stored_block(s, s.block_start, len, last);
      s.block_start += len;
      flush_pending(s.strm);
    }
    return last ? BS_FINISH_STARTED : BS_NEED_MORE;
  };
  var deflate_fast = (s, flush) => {
    let hash_head;
    let bflush;
    for (; ; ) {
      if (s.lookahead < MIN_LOOKAHEAD) {
        fill_window(s);
        if (s.lookahead < MIN_LOOKAHEAD && flush === Z_NO_FLUSH$2) {
          return BS_NEED_MORE;
        }
        if (s.lookahead === 0) {
          break;
        }
      }
      hash_head = 0;
      if (s.lookahead >= MIN_MATCH) {
        s.ins_h = HASH(s, s.ins_h, s.window[s.strstart + MIN_MATCH - 1]);
        hash_head = s.prev[s.strstart & s.w_mask] = s.head[s.ins_h];
        s.head[s.ins_h] = s.strstart;
      }
      if (hash_head !== 0 && s.strstart - hash_head <= s.w_size - MIN_LOOKAHEAD) {
        s.match_length = longest_match(s, hash_head);
      }
      if (s.match_length >= MIN_MATCH) {
        bflush = _tr_tally(s, s.strstart - s.match_start, s.match_length - MIN_MATCH);
        s.lookahead -= s.match_length;
        if (s.match_length <= s.max_lazy_match && s.lookahead >= MIN_MATCH) {
          s.match_length--;
          do {
            s.strstart++;
            s.ins_h = HASH(s, s.ins_h, s.window[s.strstart + MIN_MATCH - 1]);
            hash_head = s.prev[s.strstart & s.w_mask] = s.head[s.ins_h];
            s.head[s.ins_h] = s.strstart;
          } while (--s.match_length !== 0);
          s.strstart++;
        } else {
          s.strstart += s.match_length;
          s.match_length = 0;
          s.ins_h = s.window[s.strstart];
          s.ins_h = HASH(s, s.ins_h, s.window[s.strstart + 1]);
        }
      } else {
        bflush = _tr_tally(s, 0, s.window[s.strstart]);
        s.lookahead--;
        s.strstart++;
      }
      if (bflush) {
        flush_block_only(s, false);
        if (s.strm.avail_out === 0) {
          return BS_NEED_MORE;
        }
      }
    }
    s.insert = s.strstart < MIN_MATCH - 1 ? s.strstart : MIN_MATCH - 1;
    if (flush === Z_FINISH$3) {
      flush_block_only(s, true);
      if (s.strm.avail_out === 0) {
        return BS_FINISH_STARTED;
      }
      return BS_FINISH_DONE;
    }
    if (s.sym_next) {
      flush_block_only(s, false);
      if (s.strm.avail_out === 0) {
        return BS_NEED_MORE;
      }
    }
    return BS_BLOCK_DONE;
  };
  var deflate_slow = (s, flush) => {
    let hash_head;
    let bflush;
    let max_insert;
    for (; ; ) {
      if (s.lookahead < MIN_LOOKAHEAD) {
        fill_window(s);
        if (s.lookahead < MIN_LOOKAHEAD && flush === Z_NO_FLUSH$2) {
          return BS_NEED_MORE;
        }
        if (s.lookahead === 0) {
          break;
        }
      }
      hash_head = 0;
      if (s.lookahead >= MIN_MATCH) {
        s.ins_h = HASH(s, s.ins_h, s.window[s.strstart + MIN_MATCH - 1]);
        hash_head = s.prev[s.strstart & s.w_mask] = s.head[s.ins_h];
        s.head[s.ins_h] = s.strstart;
      }
      s.prev_length = s.match_length;
      s.prev_match = s.match_start;
      s.match_length = MIN_MATCH - 1;
      if (hash_head !== 0 && s.prev_length < s.max_lazy_match && s.strstart - hash_head <= s.w_size - MIN_LOOKAHEAD) {
        s.match_length = longest_match(s, hash_head);
        if (s.match_length <= 5 && (s.strategy === Z_FILTERED || s.match_length === MIN_MATCH && s.strstart - s.match_start > 4096)) {
          s.match_length = MIN_MATCH - 1;
        }
      }
      if (s.prev_length >= MIN_MATCH && s.match_length <= s.prev_length) {
        max_insert = s.strstart + s.lookahead - MIN_MATCH;
        bflush = _tr_tally(s, s.strstart - 1 - s.prev_match, s.prev_length - MIN_MATCH);
        s.lookahead -= s.prev_length - 1;
        s.prev_length -= 2;
        do {
          if (++s.strstart <= max_insert) {
            s.ins_h = HASH(s, s.ins_h, s.window[s.strstart + MIN_MATCH - 1]);
            hash_head = s.prev[s.strstart & s.w_mask] = s.head[s.ins_h];
            s.head[s.ins_h] = s.strstart;
          }
        } while (--s.prev_length !== 0);
        s.match_available = 0;
        s.match_length = MIN_MATCH - 1;
        s.strstart++;
        if (bflush) {
          flush_block_only(s, false);
          if (s.strm.avail_out === 0) {
            return BS_NEED_MORE;
          }
        }
      } else if (s.match_available) {
        bflush = _tr_tally(s, 0, s.window[s.strstart - 1]);
        if (bflush) {
          flush_block_only(s, false);
        }
        s.strstart++;
        s.lookahead--;
        if (s.strm.avail_out === 0) {
          return BS_NEED_MORE;
        }
      } else {
        s.match_available = 1;
        s.strstart++;
        s.lookahead--;
      }
    }
    if (s.match_available) {
      bflush = _tr_tally(s, 0, s.window[s.strstart - 1]);
      s.match_available = 0;
    }
    s.insert = s.strstart < MIN_MATCH - 1 ? s.strstart : MIN_MATCH - 1;
    if (flush === Z_FINISH$3) {
      flush_block_only(s, true);
      if (s.strm.avail_out === 0) {
        return BS_FINISH_STARTED;
      }
      return BS_FINISH_DONE;
    }
    if (s.sym_next) {
      flush_block_only(s, false);
      if (s.strm.avail_out === 0) {
        return BS_NEED_MORE;
      }
    }
    return BS_BLOCK_DONE;
  };
  var deflate_rle = (s, flush) => {
    let bflush;
    let prev;
    let scan, strend;
    const _win = s.window;
    for (; ; ) {
      if (s.lookahead <= MAX_MATCH) {
        fill_window(s);
        if (s.lookahead <= MAX_MATCH && flush === Z_NO_FLUSH$2) {
          return BS_NEED_MORE;
        }
        if (s.lookahead === 0) {
          break;
        }
      }
      s.match_length = 0;
      if (s.lookahead >= MIN_MATCH && s.strstart > 0) {
        scan = s.strstart - 1;
        prev = _win[scan];
        if (prev === _win[++scan] && prev === _win[++scan] && prev === _win[++scan]) {
          strend = s.strstart + MAX_MATCH;
          do {
          } while (prev === _win[++scan] && prev === _win[++scan] && prev === _win[++scan] && prev === _win[++scan] && prev === _win[++scan] && prev === _win[++scan] && prev === _win[++scan] && prev === _win[++scan] && scan < strend);
          s.match_length = MAX_MATCH - (strend - scan);
          if (s.match_length > s.lookahead) {
            s.match_length = s.lookahead;
          }
        }
      }
      if (s.match_length >= MIN_MATCH) {
        bflush = _tr_tally(s, 1, s.match_length - MIN_MATCH);
        s.lookahead -= s.match_length;
        s.strstart += s.match_length;
        s.match_length = 0;
      } else {
        bflush = _tr_tally(s, 0, s.window[s.strstart]);
        s.lookahead--;
        s.strstart++;
      }
      if (bflush) {
        flush_block_only(s, false);
        if (s.strm.avail_out === 0) {
          return BS_NEED_MORE;
        }
      }
    }
    s.insert = 0;
    if (flush === Z_FINISH$3) {
      flush_block_only(s, true);
      if (s.strm.avail_out === 0) {
        return BS_FINISH_STARTED;
      }
      return BS_FINISH_DONE;
    }
    if (s.sym_next) {
      flush_block_only(s, false);
      if (s.strm.avail_out === 0) {
        return BS_NEED_MORE;
      }
    }
    return BS_BLOCK_DONE;
  };
  var deflate_huff = (s, flush) => {
    let bflush;
    for (; ; ) {
      if (s.lookahead === 0) {
        fill_window(s);
        if (s.lookahead === 0) {
          if (flush === Z_NO_FLUSH$2) {
            return BS_NEED_MORE;
          }
          break;
        }
      }
      s.match_length = 0;
      bflush = _tr_tally(s, 0, s.window[s.strstart]);
      s.lookahead--;
      s.strstart++;
      if (bflush) {
        flush_block_only(s, false);
        if (s.strm.avail_out === 0) {
          return BS_NEED_MORE;
        }
      }
    }
    s.insert = 0;
    if (flush === Z_FINISH$3) {
      flush_block_only(s, true);
      if (s.strm.avail_out === 0) {
        return BS_FINISH_STARTED;
      }
      return BS_FINISH_DONE;
    }
    if (s.sym_next) {
      flush_block_only(s, false);
      if (s.strm.avail_out === 0) {
        return BS_NEED_MORE;
      }
    }
    return BS_BLOCK_DONE;
  };
  function Config(good_length, max_lazy, nice_length, max_chain, func) {
    this.good_length = good_length;
    this.max_lazy = max_lazy;
    this.nice_length = nice_length;
    this.max_chain = max_chain;
    this.func = func;
  }
  var configuration_table = [
    /*      good lazy nice chain */
    new Config(0, 0, 0, 0, deflate_stored),
    /* 0 store only */
    new Config(4, 4, 8, 4, deflate_fast),
    /* 1 max speed, no lazy matches */
    new Config(4, 5, 16, 8, deflate_fast),
    /* 2 */
    new Config(4, 6, 32, 32, deflate_fast),
    /* 3 */
    new Config(4, 4, 16, 16, deflate_slow),
    /* 4 lazy matches */
    new Config(8, 16, 32, 32, deflate_slow),
    /* 5 */
    new Config(8, 16, 128, 128, deflate_slow),
    /* 6 */
    new Config(8, 32, 128, 256, deflate_slow),
    /* 7 */
    new Config(32, 128, 258, 1024, deflate_slow),
    /* 8 */
    new Config(32, 258, 258, 4096, deflate_slow)
    /* 9 max compression */
  ];
  var lm_init = (s) => {
    s.window_size = 2 * s.w_size;
    zero(s.head);
    s.max_lazy_match = configuration_table[s.level].max_lazy;
    s.good_match = configuration_table[s.level].good_length;
    s.nice_match = configuration_table[s.level].nice_length;
    s.max_chain_length = configuration_table[s.level].max_chain;
    s.strstart = 0;
    s.block_start = 0;
    s.lookahead = 0;
    s.insert = 0;
    s.match_length = s.prev_length = MIN_MATCH - 1;
    s.match_available = 0;
    s.ins_h = 0;
  };
  function DeflateState() {
    this.strm = null;
    this.status = 0;
    this.pending_buf = null;
    this.pending_buf_size = 0;
    this.pending_out = 0;
    this.pending = 0;
    this.wrap = 0;
    this.gzhead = null;
    this.gzindex = 0;
    this.method = Z_DEFLATED$2;
    this.last_flush = -1;
    this.w_size = 0;
    this.w_bits = 0;
    this.w_mask = 0;
    this.window = null;
    this.window_size = 0;
    this.prev = null;
    this.head = null;
    this.ins_h = 0;
    this.hash_size = 0;
    this.hash_bits = 0;
    this.hash_mask = 0;
    this.hash_shift = 0;
    this.block_start = 0;
    this.match_length = 0;
    this.prev_match = 0;
    this.match_available = 0;
    this.strstart = 0;
    this.match_start = 0;
    this.lookahead = 0;
    this.prev_length = 0;
    this.max_chain_length = 0;
    this.max_lazy_match = 0;
    this.level = 0;
    this.strategy = 0;
    this.good_match = 0;
    this.nice_match = 0;
    this.dyn_ltree = new Uint16Array(HEAP_SIZE * 2);
    this.dyn_dtree = new Uint16Array((2 * D_CODES + 1) * 2);
    this.bl_tree = new Uint16Array((2 * BL_CODES + 1) * 2);
    zero(this.dyn_ltree);
    zero(this.dyn_dtree);
    zero(this.bl_tree);
    this.l_desc = null;
    this.d_desc = null;
    this.bl_desc = null;
    this.bl_count = new Uint16Array(MAX_BITS + 1);
    this.heap = new Uint16Array(2 * L_CODES + 1);
    zero(this.heap);
    this.heap_len = 0;
    this.heap_max = 0;
    this.depth = new Uint16Array(2 * L_CODES + 1);
    zero(this.depth);
    this.sym_buf = 0;
    this.lit_bufsize = 0;
    this.sym_next = 0;
    this.sym_end = 0;
    this.opt_len = 0;
    this.static_len = 0;
    this.matches = 0;
    this.insert = 0;
    this.bi_buf = 0;
    this.bi_valid = 0;
  }
  var deflateStateCheck = (strm) => {
    if (!strm) {
      return 1;
    }
    const s = strm.state;
    if (!s || s.strm !== strm || s.status !== INIT_STATE && //#ifdef GZIP
    s.status !== GZIP_STATE && //#endif
    s.status !== EXTRA_STATE && s.status !== NAME_STATE && s.status !== COMMENT_STATE && s.status !== HCRC_STATE && s.status !== BUSY_STATE && s.status !== FINISH_STATE) {
      return 1;
    }
    return 0;
  };
  var deflateResetKeep = (strm) => {
    if (deflateStateCheck(strm)) {
      return err(strm, Z_STREAM_ERROR$2);
    }
    strm.total_in = strm.total_out = 0;
    strm.data_type = Z_UNKNOWN;
    const s = strm.state;
    s.pending = 0;
    s.pending_out = 0;
    if (s.wrap < 0) {
      s.wrap = -s.wrap;
    }
    s.status = //#ifdef GZIP
    s.wrap === 2 ? GZIP_STATE : (
      //#endif
      s.wrap ? INIT_STATE : BUSY_STATE
    );
    strm.adler = s.wrap === 2 ? 0 : 1;
    s.last_flush = -2;
    _tr_init(s);
    return Z_OK$3;
  };
  var deflateReset = (strm) => {
    const ret = deflateResetKeep(strm);
    if (ret === Z_OK$3) {
      lm_init(strm.state);
    }
    return ret;
  };
  var deflateSetHeader = (strm, head) => {
    if (deflateStateCheck(strm) || strm.state.wrap !== 2) {
      return Z_STREAM_ERROR$2;
    }
    strm.state.gzhead = head;
    return Z_OK$3;
  };
  var deflateInit2 = (strm, level, method, windowBits, memLevel, strategy) => {
    if (!strm) {
      return Z_STREAM_ERROR$2;
    }
    let wrap5 = 1;
    if (level === Z_DEFAULT_COMPRESSION$1) {
      level = 6;
    }
    if (windowBits < 0) {
      wrap5 = 0;
      windowBits = -windowBits;
    } else if (windowBits > 15) {
      wrap5 = 2;
      windowBits -= 16;
    }
    if (memLevel < 1 || memLevel > MAX_MEM_LEVEL || method !== Z_DEFLATED$2 || windowBits < 8 || windowBits > 15 || level < 0 || level > 9 || strategy < 0 || strategy > Z_FIXED || windowBits === 8 && wrap5 !== 1) {
      return err(strm, Z_STREAM_ERROR$2);
    }
    if (windowBits === 8) {
      windowBits = 9;
    }
    const s = new DeflateState();
    strm.state = s;
    s.strm = strm;
    s.status = INIT_STATE;
    s.wrap = wrap5;
    s.gzhead = null;
    s.w_bits = windowBits;
    s.w_size = 1 << s.w_bits;
    s.w_mask = s.w_size - 1;
    s.hash_bits = memLevel + 7;
    s.hash_size = 1 << s.hash_bits;
    s.hash_mask = s.hash_size - 1;
    s.hash_shift = ~~((s.hash_bits + MIN_MATCH - 1) / MIN_MATCH);
    s.window = new Uint8Array(s.w_size * 2);
    s.head = new Uint16Array(s.hash_size);
    s.prev = new Uint16Array(s.w_size);
    s.lit_bufsize = 1 << memLevel + 6;
    s.pending_buf_size = s.lit_bufsize * 4;
    s.pending_buf = new Uint8Array(s.pending_buf_size);
    s.sym_buf = s.lit_bufsize;
    s.sym_end = (s.lit_bufsize - 1) * 3;
    s.level = level;
    s.strategy = strategy;
    s.method = method;
    return deflateReset(strm);
  };
  var deflateInit = (strm, level) => {
    return deflateInit2(strm, level, Z_DEFLATED$2, MAX_WBITS$1, DEF_MEM_LEVEL, Z_DEFAULT_STRATEGY$1);
  };
  var deflate$2 = (strm, flush) => {
    if (deflateStateCheck(strm) || flush > Z_BLOCK$1 || flush < 0) {
      return strm ? err(strm, Z_STREAM_ERROR$2) : Z_STREAM_ERROR$2;
    }
    const s = strm.state;
    if (!strm.output || strm.avail_in !== 0 && !strm.input || s.status === FINISH_STATE && flush !== Z_FINISH$3) {
      return err(strm, strm.avail_out === 0 ? Z_BUF_ERROR$1 : Z_STREAM_ERROR$2);
    }
    const old_flush = s.last_flush;
    s.last_flush = flush;
    if (s.pending !== 0) {
      flush_pending(strm);
      if (strm.avail_out === 0) {
        s.last_flush = -1;
        return Z_OK$3;
      }
    } else if (strm.avail_in === 0 && rank(flush) <= rank(old_flush) && flush !== Z_FINISH$3) {
      return err(strm, Z_BUF_ERROR$1);
    }
    if (s.status === FINISH_STATE && strm.avail_in !== 0) {
      return err(strm, Z_BUF_ERROR$1);
    }
    if (s.status === INIT_STATE && s.wrap === 0) {
      s.status = BUSY_STATE;
    }
    if (s.status === INIT_STATE) {
      let header = Z_DEFLATED$2 + (s.w_bits - 8 << 4) << 8;
      let level_flags = -1;
      if (s.strategy >= Z_HUFFMAN_ONLY || s.level < 2) {
        level_flags = 0;
      } else if (s.level < 6) {
        level_flags = 1;
      } else if (s.level === 6) {
        level_flags = 2;
      } else {
        level_flags = 3;
      }
      header |= level_flags << 6;
      if (s.strstart !== 0) {
        header |= PRESET_DICT;
      }
      header += 31 - header % 31;
      putShortMSB(s, header);
      if (s.strstart !== 0) {
        putShortMSB(s, strm.adler >>> 16);
        putShortMSB(s, strm.adler & 65535);
      }
      strm.adler = 1;
      s.status = BUSY_STATE;
      flush_pending(strm);
      if (s.pending !== 0) {
        s.last_flush = -1;
        return Z_OK$3;
      }
    }
    if (s.status === GZIP_STATE) {
      strm.adler = 0;
      put_byte(s, 31);
      put_byte(s, 139);
      put_byte(s, 8);
      if (!s.gzhead) {
        put_byte(s, 0);
        put_byte(s, 0);
        put_byte(s, 0);
        put_byte(s, 0);
        put_byte(s, 0);
        put_byte(s, s.level === 9 ? 2 : s.strategy >= Z_HUFFMAN_ONLY || s.level < 2 ? 4 : 0);
        put_byte(s, OS_CODE);
        s.status = BUSY_STATE;
        flush_pending(strm);
        if (s.pending !== 0) {
          s.last_flush = -1;
          return Z_OK$3;
        }
      } else {
        put_byte(
          s,
          (s.gzhead.text ? 1 : 0) + (s.gzhead.hcrc ? 2 : 0) + (!s.gzhead.extra ? 0 : 4) + (!s.gzhead.name ? 0 : 8) + (!s.gzhead.comment ? 0 : 16)
        );
        put_byte(s, s.gzhead.time & 255);
        put_byte(s, s.gzhead.time >> 8 & 255);
        put_byte(s, s.gzhead.time >> 16 & 255);
        put_byte(s, s.gzhead.time >> 24 & 255);
        put_byte(s, s.level === 9 ? 2 : s.strategy >= Z_HUFFMAN_ONLY || s.level < 2 ? 4 : 0);
        put_byte(s, s.gzhead.os & 255);
        if (s.gzhead.extra && s.gzhead.extra.length) {
          put_byte(s, s.gzhead.extra.length & 255);
          put_byte(s, s.gzhead.extra.length >> 8 & 255);
        }
        if (s.gzhead.hcrc) {
          strm.adler = crc32_1(strm.adler, s.pending_buf, s.pending, 0);
        }
        s.gzindex = 0;
        s.status = EXTRA_STATE;
      }
    }
    if (s.status === EXTRA_STATE) {
      if (s.gzhead.extra) {
        let beg = s.pending;
        let left = (s.gzhead.extra.length & 65535) - s.gzindex;
        while (s.pending + left > s.pending_buf_size) {
          let copy = s.pending_buf_size - s.pending;
          s.pending_buf.set(s.gzhead.extra.subarray(s.gzindex, s.gzindex + copy), s.pending);
          s.pending = s.pending_buf_size;
          if (s.gzhead.hcrc && s.pending > beg) {
            strm.adler = crc32_1(strm.adler, s.pending_buf, s.pending - beg, beg);
          }
          s.gzindex += copy;
          flush_pending(strm);
          if (s.pending !== 0) {
            s.last_flush = -1;
            return Z_OK$3;
          }
          beg = 0;
          left -= copy;
        }
        let gzhead_extra = new Uint8Array(s.gzhead.extra);
        s.pending_buf.set(gzhead_extra.subarray(s.gzindex, s.gzindex + left), s.pending);
        s.pending += left;
        if (s.gzhead.hcrc && s.pending > beg) {
          strm.adler = crc32_1(strm.adler, s.pending_buf, s.pending - beg, beg);
        }
        s.gzindex = 0;
      }
      s.status = NAME_STATE;
    }
    if (s.status === NAME_STATE) {
      if (s.gzhead.name) {
        let beg = s.pending;
        let val;
        do {
          if (s.pending === s.pending_buf_size) {
            if (s.gzhead.hcrc && s.pending > beg) {
              strm.adler = crc32_1(strm.adler, s.pending_buf, s.pending - beg, beg);
            }
            flush_pending(strm);
            if (s.pending !== 0) {
              s.last_flush = -1;
              return Z_OK$3;
            }
            beg = 0;
          }
          if (s.gzindex < s.gzhead.name.length) {
            val = s.gzhead.name.charCodeAt(s.gzindex++) & 255;
          } else {
            val = 0;
          }
          put_byte(s, val);
        } while (val !== 0);
        if (s.gzhead.hcrc && s.pending > beg) {
          strm.adler = crc32_1(strm.adler, s.pending_buf, s.pending - beg, beg);
        }
        s.gzindex = 0;
      }
      s.status = COMMENT_STATE;
    }
    if (s.status === COMMENT_STATE) {
      if (s.gzhead.comment) {
        let beg = s.pending;
        let val;
        do {
          if (s.pending === s.pending_buf_size) {
            if (s.gzhead.hcrc && s.pending > beg) {
              strm.adler = crc32_1(strm.adler, s.pending_buf, s.pending - beg, beg);
            }
            flush_pending(strm);
            if (s.pending !== 0) {
              s.last_flush = -1;
              return Z_OK$3;
            }
            beg = 0;
          }
          if (s.gzindex < s.gzhead.comment.length) {
            val = s.gzhead.comment.charCodeAt(s.gzindex++) & 255;
          } else {
            val = 0;
          }
          put_byte(s, val);
        } while (val !== 0);
        if (s.gzhead.hcrc && s.pending > beg) {
          strm.adler = crc32_1(strm.adler, s.pending_buf, s.pending - beg, beg);
        }
      }
      s.status = HCRC_STATE;
    }
    if (s.status === HCRC_STATE) {
      if (s.gzhead.hcrc) {
        if (s.pending + 2 > s.pending_buf_size) {
          flush_pending(strm);
          if (s.pending !== 0) {
            s.last_flush = -1;
            return Z_OK$3;
          }
        }
        put_byte(s, strm.adler & 255);
        put_byte(s, strm.adler >> 8 & 255);
        strm.adler = 0;
      }
      s.status = BUSY_STATE;
      flush_pending(strm);
      if (s.pending !== 0) {
        s.last_flush = -1;
        return Z_OK$3;
      }
    }
    if (strm.avail_in !== 0 || s.lookahead !== 0 || flush !== Z_NO_FLUSH$2 && s.status !== FINISH_STATE) {
      let bstate = s.level === 0 ? deflate_stored(s, flush) : s.strategy === Z_HUFFMAN_ONLY ? deflate_huff(s, flush) : s.strategy === Z_RLE ? deflate_rle(s, flush) : configuration_table[s.level].func(s, flush);
      if (bstate === BS_FINISH_STARTED || bstate === BS_FINISH_DONE) {
        s.status = FINISH_STATE;
      }
      if (bstate === BS_NEED_MORE || bstate === BS_FINISH_STARTED) {
        if (strm.avail_out === 0) {
          s.last_flush = -1;
        }
        return Z_OK$3;
      }
      if (bstate === BS_BLOCK_DONE) {
        if (flush === Z_PARTIAL_FLUSH) {
          _tr_align(s);
        } else if (flush !== Z_BLOCK$1) {
          _tr_stored_block(s, 0, 0, false);
          if (flush === Z_FULL_FLUSH$1) {
            zero(s.head);
            if (s.lookahead === 0) {
              s.strstart = 0;
              s.block_start = 0;
              s.insert = 0;
            }
          }
        }
        flush_pending(strm);
        if (strm.avail_out === 0) {
          s.last_flush = -1;
          return Z_OK$3;
        }
      }
    }
    if (flush !== Z_FINISH$3) {
      return Z_OK$3;
    }
    if (s.wrap <= 0) {
      return Z_STREAM_END$3;
    }
    if (s.wrap === 2) {
      put_byte(s, strm.adler & 255);
      put_byte(s, strm.adler >> 8 & 255);
      put_byte(s, strm.adler >> 16 & 255);
      put_byte(s, strm.adler >> 24 & 255);
      put_byte(s, strm.total_in & 255);
      put_byte(s, strm.total_in >> 8 & 255);
      put_byte(s, strm.total_in >> 16 & 255);
      put_byte(s, strm.total_in >> 24 & 255);
    } else {
      putShortMSB(s, strm.adler >>> 16);
      putShortMSB(s, strm.adler & 65535);
    }
    flush_pending(strm);
    if (s.wrap > 0) {
      s.wrap = -s.wrap;
    }
    return s.pending !== 0 ? Z_OK$3 : Z_STREAM_END$3;
  };
  var deflateEnd = (strm) => {
    if (deflateStateCheck(strm)) {
      return Z_STREAM_ERROR$2;
    }
    const status = strm.state.status;
    strm.state = null;
    return status === BUSY_STATE ? err(strm, Z_DATA_ERROR$2) : Z_OK$3;
  };
  var deflateSetDictionary = (strm, dictionary) => {
    let dictLength = dictionary.length;
    if (deflateStateCheck(strm)) {
      return Z_STREAM_ERROR$2;
    }
    const s = strm.state;
    const wrap5 = s.wrap;
    if (wrap5 === 2 || wrap5 === 1 && s.status !== INIT_STATE || s.lookahead) {
      return Z_STREAM_ERROR$2;
    }
    if (wrap5 === 1) {
      strm.adler = adler32_1(strm.adler, dictionary, dictLength, 0);
    }
    s.wrap = 0;
    if (dictLength >= s.w_size) {
      if (wrap5 === 0) {
        zero(s.head);
        s.strstart = 0;
        s.block_start = 0;
        s.insert = 0;
      }
      let tmpDict = new Uint8Array(s.w_size);
      tmpDict.set(dictionary.subarray(dictLength - s.w_size, dictLength), 0);
      dictionary = tmpDict;
      dictLength = s.w_size;
    }
    const avail = strm.avail_in;
    const next = strm.next_in;
    const input = strm.input;
    strm.avail_in = dictLength;
    strm.next_in = 0;
    strm.input = dictionary;
    fill_window(s);
    while (s.lookahead >= MIN_MATCH) {
      let str = s.strstart;
      let n = s.lookahead - (MIN_MATCH - 1);
      do {
        s.ins_h = HASH(s, s.ins_h, s.window[str + MIN_MATCH - 1]);
        s.prev[str & s.w_mask] = s.head[s.ins_h];
        s.head[s.ins_h] = str;
        str++;
      } while (--n);
      s.strstart = str;
      s.lookahead = MIN_MATCH - 1;
      fill_window(s);
    }
    s.strstart += s.lookahead;
    s.block_start = s.strstart;
    s.insert = s.lookahead;
    s.lookahead = 0;
    s.match_length = s.prev_length = MIN_MATCH - 1;
    s.match_available = 0;
    strm.next_in = next;
    strm.input = input;
    strm.avail_in = avail;
    s.wrap = wrap5;
    return Z_OK$3;
  };
  var deflateInit_1 = deflateInit;
  var deflateInit2_1 = deflateInit2;
  var deflateReset_1 = deflateReset;
  var deflateResetKeep_1 = deflateResetKeep;
  var deflateSetHeader_1 = deflateSetHeader;
  var deflate_2$1 = deflate$2;
  var deflateEnd_1 = deflateEnd;
  var deflateSetDictionary_1 = deflateSetDictionary;
  var deflateInfo = "pako deflate (from Nodeca project)";
  var deflate_1$2 = {
    deflateInit: deflateInit_1,
    deflateInit2: deflateInit2_1,
    deflateReset: deflateReset_1,
    deflateResetKeep: deflateResetKeep_1,
    deflateSetHeader: deflateSetHeader_1,
    deflate: deflate_2$1,
    deflateEnd: deflateEnd_1,
    deflateSetDictionary: deflateSetDictionary_1,
    deflateInfo
  };
  var _has = (obj, key) => {
    return Object.prototype.hasOwnProperty.call(obj, key);
  };
  var assign = function(obj) {
    const sources = Array.prototype.slice.call(arguments, 1);
    while (sources.length) {
      const source = sources.shift();
      if (!source) {
        continue;
      }
      if (typeof source !== "object") {
        throw new TypeError(source + "must be non-object");
      }
      for (const p in source) {
        if (_has(source, p)) {
          obj[p] = source[p];
        }
      }
    }
    return obj;
  };
  var flattenChunks = (chunks) => {
    let len = 0;
    for (let i = 0, l = chunks.length; i < l; i++) {
      len += chunks[i].length;
    }
    const result = new Uint8Array(len);
    for (let i = 0, pos = 0, l = chunks.length; i < l; i++) {
      let chunk = chunks[i];
      result.set(chunk, pos);
      pos += chunk.length;
    }
    return result;
  };
  var common = {
    assign,
    flattenChunks
  };
  var STR_APPLY_UIA_OK = true;
  try {
    String.fromCharCode.apply(null, new Uint8Array(1));
  } catch (__) {
    STR_APPLY_UIA_OK = false;
  }
  var _utf8len = new Uint8Array(256);
  for (let q = 0; q < 256; q++) {
    _utf8len[q] = q >= 252 ? 6 : q >= 248 ? 5 : q >= 240 ? 4 : q >= 224 ? 3 : q >= 192 ? 2 : 1;
  }
  _utf8len[254] = _utf8len[254] = 1;
  var string2buf = (str) => {
    if (typeof TextEncoder === "function" && TextEncoder.prototype.encode) {
      return new TextEncoder().encode(str);
    }
    let buf, c, c2, m_pos, i, str_len = str.length, buf_len = 0;
    for (m_pos = 0; m_pos < str_len; m_pos++) {
      c = str.charCodeAt(m_pos);
      if ((c & 64512) === 55296 && m_pos + 1 < str_len) {
        c2 = str.charCodeAt(m_pos + 1);
        if ((c2 & 64512) === 56320) {
          c = 65536 + (c - 55296 << 10) + (c2 - 56320);
          m_pos++;
        }
      }
      buf_len += c < 128 ? 1 : c < 2048 ? 2 : c < 65536 ? 3 : 4;
    }
    buf = new Uint8Array(buf_len);
    for (i = 0, m_pos = 0; i < buf_len; m_pos++) {
      c = str.charCodeAt(m_pos);
      if ((c & 64512) === 55296 && m_pos + 1 < str_len) {
        c2 = str.charCodeAt(m_pos + 1);
        if ((c2 & 64512) === 56320) {
          c = 65536 + (c - 55296 << 10) + (c2 - 56320);
          m_pos++;
        }
      }
      if (c < 128) {
        buf[i++] = c;
      } else if (c < 2048) {
        buf[i++] = 192 | c >>> 6;
        buf[i++] = 128 | c & 63;
      } else if (c < 65536) {
        buf[i++] = 224 | c >>> 12;
        buf[i++] = 128 | c >>> 6 & 63;
        buf[i++] = 128 | c & 63;
      } else {
        buf[i++] = 240 | c >>> 18;
        buf[i++] = 128 | c >>> 12 & 63;
        buf[i++] = 128 | c >>> 6 & 63;
        buf[i++] = 128 | c & 63;
      }
    }
    return buf;
  };
  var buf2binstring = (buf, len) => {
    if (len < 65534) {
      if (buf.subarray && STR_APPLY_UIA_OK) {
        return String.fromCharCode.apply(null, buf.length === len ? buf : buf.subarray(0, len));
      }
    }
    let result = "";
    for (let i = 0; i < len; i++) {
      result += String.fromCharCode(buf[i]);
    }
    return result;
  };
  var buf2string = (buf, max) => {
    const len = max || buf.length;
    if (typeof TextDecoder === "function" && TextDecoder.prototype.decode) {
      return new TextDecoder().decode(buf.subarray(0, max));
    }
    let i, out;
    const utf16buf = new Array(len * 2);
    for (out = 0, i = 0; i < len; ) {
      let c = buf[i++];
      if (c < 128) {
        utf16buf[out++] = c;
        continue;
      }
      let c_len = _utf8len[c];
      if (c_len > 4) {
        utf16buf[out++] = 65533;
        i += c_len - 1;
        continue;
      }
      c &= c_len === 2 ? 31 : c_len === 3 ? 15 : 7;
      while (c_len > 1 && i < len) {
        c = c << 6 | buf[i++] & 63;
        c_len--;
      }
      if (c_len > 1) {
        utf16buf[out++] = 65533;
        continue;
      }
      if (c < 65536) {
        utf16buf[out++] = c;
      } else {
        c -= 65536;
        utf16buf[out++] = 55296 | c >> 10 & 1023;
        utf16buf[out++] = 56320 | c & 1023;
      }
    }
    return buf2binstring(utf16buf, out);
  };
  var utf8border = (buf, max) => {
    max = max || buf.length;
    if (max > buf.length) {
      max = buf.length;
    }
    let pos = max - 1;
    while (pos >= 0 && (buf[pos] & 192) === 128) {
      pos--;
    }
    if (pos < 0) {
      return max;
    }
    if (pos === 0) {
      return max;
    }
    return pos + _utf8len[buf[pos]] > max ? pos : max;
  };
  var strings = {
    string2buf,
    buf2string,
    utf8border
  };
  function ZStream() {
    this.input = null;
    this.next_in = 0;
    this.avail_in = 0;
    this.total_in = 0;
    this.output = null;
    this.next_out = 0;
    this.avail_out = 0;
    this.total_out = 0;
    this.msg = "";
    this.state = null;
    this.data_type = 2;
    this.adler = 0;
  }
  var zstream = ZStream;
  var toString$1 = Object.prototype.toString;
  var {
    Z_NO_FLUSH: Z_NO_FLUSH$1,
    Z_SYNC_FLUSH,
    Z_FULL_FLUSH,
    Z_FINISH: Z_FINISH$2,
    Z_OK: Z_OK$2,
    Z_STREAM_END: Z_STREAM_END$2,
    Z_DEFAULT_COMPRESSION,
    Z_DEFAULT_STRATEGY,
    Z_DEFLATED: Z_DEFLATED$1
  } = constants$2;
  function Deflate$1(options) {
    this.options = common.assign({
      level: Z_DEFAULT_COMPRESSION,
      method: Z_DEFLATED$1,
      chunkSize: 16384,
      windowBits: 15,
      memLevel: 8,
      strategy: Z_DEFAULT_STRATEGY
    }, options || {});
    let opt = this.options;
    if (opt.raw && opt.windowBits > 0) {
      opt.windowBits = -opt.windowBits;
    } else if (opt.gzip && opt.windowBits > 0 && opt.windowBits < 16) {
      opt.windowBits += 16;
    }
    this.err = 0;
    this.msg = "";
    this.ended = false;
    this.chunks = [];
    this.strm = new zstream();
    this.strm.avail_out = 0;
    let status = deflate_1$2.deflateInit2(
      this.strm,
      opt.level,
      opt.method,
      opt.windowBits,
      opt.memLevel,
      opt.strategy
    );
    if (status !== Z_OK$2) {
      throw new Error(messages[status]);
    }
    if (opt.header) {
      deflate_1$2.deflateSetHeader(this.strm, opt.header);
    }
    if (opt.dictionary) {
      let dict;
      if (typeof opt.dictionary === "string") {
        dict = strings.string2buf(opt.dictionary);
      } else if (toString$1.call(opt.dictionary) === "[object ArrayBuffer]") {
        dict = new Uint8Array(opt.dictionary);
      } else {
        dict = opt.dictionary;
      }
      status = deflate_1$2.deflateSetDictionary(this.strm, dict);
      if (status !== Z_OK$2) {
        throw new Error(messages[status]);
      }
      this._dict_set = true;
    }
  }
  Deflate$1.prototype.push = function(data, flush_mode) {
    const strm = this.strm;
    const chunkSize = this.options.chunkSize;
    let status, _flush_mode;
    if (this.ended) {
      return false;
    }
    if (flush_mode === ~~flush_mode) _flush_mode = flush_mode;
    else _flush_mode = flush_mode === true ? Z_FINISH$2 : Z_NO_FLUSH$1;
    if (typeof data === "string") {
      strm.input = strings.string2buf(data);
    } else if (toString$1.call(data) === "[object ArrayBuffer]") {
      strm.input = new Uint8Array(data);
    } else {
      strm.input = data;
    }
    strm.next_in = 0;
    strm.avail_in = strm.input.length;
    for (; ; ) {
      if (strm.avail_out === 0) {
        strm.output = new Uint8Array(chunkSize);
        strm.next_out = 0;
        strm.avail_out = chunkSize;
      }
      if ((_flush_mode === Z_SYNC_FLUSH || _flush_mode === Z_FULL_FLUSH) && strm.avail_out <= 6) {
        this.onData(strm.output.subarray(0, strm.next_out));
        strm.avail_out = 0;
        continue;
      }
      status = deflate_1$2.deflate(strm, _flush_mode);
      if (status === Z_STREAM_END$2) {
        if (strm.next_out > 0) {
          this.onData(strm.output.subarray(0, strm.next_out));
        }
        status = deflate_1$2.deflateEnd(this.strm);
        this.onEnd(status);
        this.ended = true;
        return status === Z_OK$2;
      }
      if (strm.avail_out === 0) {
        this.onData(strm.output);
        continue;
      }
      if (_flush_mode > 0 && strm.next_out > 0) {
        this.onData(strm.output.subarray(0, strm.next_out));
        strm.avail_out = 0;
        continue;
      }
      if (strm.avail_in === 0) break;
    }
    return true;
  };
  Deflate$1.prototype.onData = function(chunk) {
    this.chunks.push(chunk);
  };
  Deflate$1.prototype.onEnd = function(status) {
    if (status === Z_OK$2) {
      this.result = common.flattenChunks(this.chunks);
    }
    this.chunks = [];
    this.err = status;
    this.msg = this.strm.msg;
  };
  function deflate$1(input, options) {
    const deflator = new Deflate$1(options);
    deflator.push(input, true);
    if (deflator.err) {
      throw deflator.msg || messages[deflator.err];
    }
    return deflator.result;
  }
  function deflateRaw$1(input, options) {
    options = options || {};
    options.raw = true;
    return deflate$1(input, options);
  }
  function gzip$1(input, options) {
    options = options || {};
    options.gzip = true;
    return deflate$1(input, options);
  }
  var Deflate_1$1 = Deflate$1;
  var deflate_2 = deflate$1;
  var deflateRaw_1$1 = deflateRaw$1;
  var gzip_1$1 = gzip$1;
  var constants$1 = constants$2;
  var deflate_1$1 = {
    Deflate: Deflate_1$1,
    deflate: deflate_2,
    deflateRaw: deflateRaw_1$1,
    gzip: gzip_1$1,
    constants: constants$1
  };
  var BAD$1 = 16209;
  var TYPE$1 = 16191;
  var inffast = function inflate_fast(strm, start) {
    let _in;
    let last;
    let _out;
    let beg;
    let end;
    let dmax;
    let wsize;
    let whave;
    let wnext;
    let s_window;
    let hold;
    let bits;
    let lcode;
    let dcode;
    let lmask;
    let dmask;
    let here;
    let op;
    let len;
    let dist;
    let from;
    let from_source;
    let input, output;
    const state = strm.state;
    _in = strm.next_in;
    input = strm.input;
    last = _in + (strm.avail_in - 5);
    _out = strm.next_out;
    output = strm.output;
    beg = _out - (start - strm.avail_out);
    end = _out + (strm.avail_out - 257);
    dmax = state.dmax;
    wsize = state.wsize;
    whave = state.whave;
    wnext = state.wnext;
    s_window = state.window;
    hold = state.hold;
    bits = state.bits;
    lcode = state.lencode;
    dcode = state.distcode;
    lmask = (1 << state.lenbits) - 1;
    dmask = (1 << state.distbits) - 1;
    top:
      do {
        if (bits < 15) {
          hold += input[_in++] << bits;
          bits += 8;
          hold += input[_in++] << bits;
          bits += 8;
        }
        here = lcode[hold & lmask];
        dolen:
          for (; ; ) {
            op = here >>> 24;
            hold >>>= op;
            bits -= op;
            op = here >>> 16 & 255;
            if (op === 0) {
              output[_out++] = here & 65535;
            } else if (op & 16) {
              len = here & 65535;
              op &= 15;
              if (op) {
                if (bits < op) {
                  hold += input[_in++] << bits;
                  bits += 8;
                }
                len += hold & (1 << op) - 1;
                hold >>>= op;
                bits -= op;
              }
              if (bits < 15) {
                hold += input[_in++] << bits;
                bits += 8;
                hold += input[_in++] << bits;
                bits += 8;
              }
              here = dcode[hold & dmask];
              dodist:
                for (; ; ) {
                  op = here >>> 24;
                  hold >>>= op;
                  bits -= op;
                  op = here >>> 16 & 255;
                  if (op & 16) {
                    dist = here & 65535;
                    op &= 15;
                    if (bits < op) {
                      hold += input[_in++] << bits;
                      bits += 8;
                      if (bits < op) {
                        hold += input[_in++] << bits;
                        bits += 8;
                      }
                    }
                    dist += hold & (1 << op) - 1;
                    if (dist > dmax) {
                      strm.msg = "invalid distance too far back";
                      state.mode = BAD$1;
                      break top;
                    }
                    hold >>>= op;
                    bits -= op;
                    op = _out - beg;
                    if (dist > op) {
                      op = dist - op;
                      if (op > whave) {
                        if (state.sane) {
                          strm.msg = "invalid distance too far back";
                          state.mode = BAD$1;
                          break top;
                        }
                      }
                      from = 0;
                      from_source = s_window;
                      if (wnext === 0) {
                        from += wsize - op;
                        if (op < len) {
                          len -= op;
                          do {
                            output[_out++] = s_window[from++];
                          } while (--op);
                          from = _out - dist;
                          from_source = output;
                        }
                      } else if (wnext < op) {
                        from += wsize + wnext - op;
                        op -= wnext;
                        if (op < len) {
                          len -= op;
                          do {
                            output[_out++] = s_window[from++];
                          } while (--op);
                          from = 0;
                          if (wnext < len) {
                            op = wnext;
                            len -= op;
                            do {
                              output[_out++] = s_window[from++];
                            } while (--op);
                            from = _out - dist;
                            from_source = output;
                          }
                        }
                      } else {
                        from += wnext - op;
                        if (op < len) {
                          len -= op;
                          do {
                            output[_out++] = s_window[from++];
                          } while (--op);
                          from = _out - dist;
                          from_source = output;
                        }
                      }
                      while (len > 2) {
                        output[_out++] = from_source[from++];
                        output[_out++] = from_source[from++];
                        output[_out++] = from_source[from++];
                        len -= 3;
                      }
                      if (len) {
                        output[_out++] = from_source[from++];
                        if (len > 1) {
                          output[_out++] = from_source[from++];
                        }
                      }
                    } else {
                      from = _out - dist;
                      do {
                        output[_out++] = output[from++];
                        output[_out++] = output[from++];
                        output[_out++] = output[from++];
                        len -= 3;
                      } while (len > 2);
                      if (len) {
                        output[_out++] = output[from++];
                        if (len > 1) {
                          output[_out++] = output[from++];
                        }
                      }
                    }
                  } else if ((op & 64) === 0) {
                    here = dcode[(here & 65535) + (hold & (1 << op) - 1)];
                    continue dodist;
                  } else {
                    strm.msg = "invalid distance code";
                    state.mode = BAD$1;
                    break top;
                  }
                  break;
                }
            } else if ((op & 64) === 0) {
              here = lcode[(here & 65535) + (hold & (1 << op) - 1)];
              continue dolen;
            } else if (op & 32) {
              state.mode = TYPE$1;
              break top;
            } else {
              strm.msg = "invalid literal/length code";
              state.mode = BAD$1;
              break top;
            }
            break;
          }
      } while (_in < last && _out < end);
    len = bits >> 3;
    _in -= len;
    bits -= len << 3;
    hold &= (1 << bits) - 1;
    strm.next_in = _in;
    strm.next_out = _out;
    strm.avail_in = _in < last ? 5 + (last - _in) : 5 - (_in - last);
    strm.avail_out = _out < end ? 257 + (end - _out) : 257 - (_out - end);
    state.hold = hold;
    state.bits = bits;
    return;
  };
  var MAXBITS = 15;
  var ENOUGH_LENS$1 = 852;
  var ENOUGH_DISTS$1 = 592;
  var CODES$1 = 0;
  var LENS$1 = 1;
  var DISTS$1 = 2;
  var lbase = new Uint16Array([
    /* Length codes 257..285 base */
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    13,
    15,
    17,
    19,
    23,
    27,
    31,
    35,
    43,
    51,
    59,
    67,
    83,
    99,
    115,
    131,
    163,
    195,
    227,
    258,
    0,
    0
  ]);
  var lext = new Uint8Array([
    /* Length codes 257..285 extra */
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    16,
    17,
    17,
    17,
    17,
    18,
    18,
    18,
    18,
    19,
    19,
    19,
    19,
    20,
    20,
    20,
    20,
    21,
    21,
    21,
    21,
    16,
    72,
    78
  ]);
  var dbase = new Uint16Array([
    /* Distance codes 0..29 base */
    1,
    2,
    3,
    4,
    5,
    7,
    9,
    13,
    17,
    25,
    33,
    49,
    65,
    97,
    129,
    193,
    257,
    385,
    513,
    769,
    1025,
    1537,
    2049,
    3073,
    4097,
    6145,
    8193,
    12289,
    16385,
    24577,
    0,
    0
  ]);
  var dext = new Uint8Array([
    /* Distance codes 0..29 extra */
    16,
    16,
    16,
    16,
    17,
    17,
    18,
    18,
    19,
    19,
    20,
    20,
    21,
    21,
    22,
    22,
    23,
    23,
    24,
    24,
    25,
    25,
    26,
    26,
    27,
    27,
    28,
    28,
    29,
    29,
    64,
    64
  ]);
  var inflate_table = (type, lens, lens_index, codes, table, table_index, work, opts) => {
    const bits = opts.bits;
    let len = 0;
    let sym = 0;
    let min = 0, max = 0;
    let root = 0;
    let curr = 0;
    let drop = 0;
    let left = 0;
    let used = 0;
    let huff = 0;
    let incr;
    let fill;
    let low;
    let mask;
    let next;
    let base = null;
    let match;
    const count = new Uint16Array(MAXBITS + 1);
    const offs = new Uint16Array(MAXBITS + 1);
    let extra = null;
    let here_bits, here_op, here_val;
    for (len = 0; len <= MAXBITS; len++) {
      count[len] = 0;
    }
    for (sym = 0; sym < codes; sym++) {
      count[lens[lens_index + sym]]++;
    }
    root = bits;
    for (max = MAXBITS; max >= 1; max--) {
      if (count[max] !== 0) {
        break;
      }
    }
    if (root > max) {
      root = max;
    }
    if (max === 0) {
      table[table_index++] = 1 << 24 | 64 << 16 | 0;
      table[table_index++] = 1 << 24 | 64 << 16 | 0;
      opts.bits = 1;
      return 0;
    }
    for (min = 1; min < max; min++) {
      if (count[min] !== 0) {
        break;
      }
    }
    if (root < min) {
      root = min;
    }
    left = 1;
    for (len = 1; len <= MAXBITS; len++) {
      left <<= 1;
      left -= count[len];
      if (left < 0) {
        return -1;
      }
    }
    if (left > 0 && (type === CODES$1 || max !== 1)) {
      return -1;
    }
    offs[1] = 0;
    for (len = 1; len < MAXBITS; len++) {
      offs[len + 1] = offs[len] + count[len];
    }
    for (sym = 0; sym < codes; sym++) {
      if (lens[lens_index + sym] !== 0) {
        work[offs[lens[lens_index + sym]]++] = sym;
      }
    }
    if (type === CODES$1) {
      base = extra = work;
      match = 20;
    } else if (type === LENS$1) {
      base = lbase;
      extra = lext;
      match = 257;
    } else {
      base = dbase;
      extra = dext;
      match = 0;
    }
    huff = 0;
    sym = 0;
    len = min;
    next = table_index;
    curr = root;
    drop = 0;
    low = -1;
    used = 1 << root;
    mask = used - 1;
    if (type === LENS$1 && used > ENOUGH_LENS$1 || type === DISTS$1 && used > ENOUGH_DISTS$1) {
      return 1;
    }
    for (; ; ) {
      here_bits = len - drop;
      if (work[sym] + 1 < match) {
        here_op = 0;
        here_val = work[sym];
      } else if (work[sym] >= match) {
        here_op = extra[work[sym] - match];
        here_val = base[work[sym] - match];
      } else {
        here_op = 32 + 64;
        here_val = 0;
      }
      incr = 1 << len - drop;
      fill = 1 << curr;
      min = fill;
      do {
        fill -= incr;
        table[next + (huff >> drop) + fill] = here_bits << 24 | here_op << 16 | here_val | 0;
      } while (fill !== 0);
      incr = 1 << len - 1;
      while (huff & incr) {
        incr >>= 1;
      }
      if (incr !== 0) {
        huff &= incr - 1;
        huff += incr;
      } else {
        huff = 0;
      }
      sym++;
      if (--count[len] === 0) {
        if (len === max) {
          break;
        }
        len = lens[lens_index + work[sym]];
      }
      if (len > root && (huff & mask) !== low) {
        if (drop === 0) {
          drop = root;
        }
        next += min;
        curr = len - drop;
        left = 1 << curr;
        while (curr + drop < max) {
          left -= count[curr + drop];
          if (left <= 0) {
            break;
          }
          curr++;
          left <<= 1;
        }
        used += 1 << curr;
        if (type === LENS$1 && used > ENOUGH_LENS$1 || type === DISTS$1 && used > ENOUGH_DISTS$1) {
          return 1;
        }
        low = huff & mask;
        table[low] = root << 24 | curr << 16 | next - table_index | 0;
      }
    }
    if (huff !== 0) {
      table[next + huff] = len - drop << 24 | 64 << 16 | 0;
    }
    opts.bits = root;
    return 0;
  };
  var inftrees = inflate_table;
  var CODES = 0;
  var LENS = 1;
  var DISTS = 2;
  var {
    Z_FINISH: Z_FINISH$1,
    Z_BLOCK,
    Z_TREES,
    Z_OK: Z_OK$1,
    Z_STREAM_END: Z_STREAM_END$1,
    Z_NEED_DICT: Z_NEED_DICT$1,
    Z_STREAM_ERROR: Z_STREAM_ERROR$1,
    Z_DATA_ERROR: Z_DATA_ERROR$1,
    Z_MEM_ERROR: Z_MEM_ERROR$1,
    Z_BUF_ERROR,
    Z_DEFLATED
  } = constants$2;
  var HEAD = 16180;
  var FLAGS = 16181;
  var TIME = 16182;
  var OS = 16183;
  var EXLEN = 16184;
  var EXTRA = 16185;
  var NAME = 16186;
  var COMMENT = 16187;
  var HCRC = 16188;
  var DICTID = 16189;
  var DICT = 16190;
  var TYPE = 16191;
  var TYPEDO = 16192;
  var STORED = 16193;
  var COPY_ = 16194;
  var COPY = 16195;
  var TABLE = 16196;
  var LENLENS = 16197;
  var CODELENS = 16198;
  var LEN_ = 16199;
  var LEN = 16200;
  var LENEXT = 16201;
  var DIST = 16202;
  var DISTEXT = 16203;
  var MATCH = 16204;
  var LIT = 16205;
  var CHECK = 16206;
  var LENGTH = 16207;
  var DONE = 16208;
  var BAD = 16209;
  var MEM = 16210;
  var SYNC = 16211;
  var ENOUGH_LENS = 852;
  var ENOUGH_DISTS = 592;
  var MAX_WBITS = 15;
  var DEF_WBITS = MAX_WBITS;
  var zswap32 = (q) => {
    return (q >>> 24 & 255) + (q >>> 8 & 65280) + ((q & 65280) << 8) + ((q & 255) << 24);
  };
  function InflateState() {
    this.strm = null;
    this.mode = 0;
    this.last = false;
    this.wrap = 0;
    this.havedict = false;
    this.flags = 0;
    this.dmax = 0;
    this.check = 0;
    this.total = 0;
    this.head = null;
    this.wbits = 0;
    this.wsize = 0;
    this.whave = 0;
    this.wnext = 0;
    this.window = null;
    this.hold = 0;
    this.bits = 0;
    this.length = 0;
    this.offset = 0;
    this.extra = 0;
    this.lencode = null;
    this.distcode = null;
    this.lenbits = 0;
    this.distbits = 0;
    this.ncode = 0;
    this.nlen = 0;
    this.ndist = 0;
    this.have = 0;
    this.next = null;
    this.lens = new Uint16Array(320);
    this.work = new Uint16Array(288);
    this.lendyn = null;
    this.distdyn = null;
    this.sane = 0;
    this.back = 0;
    this.was = 0;
  }
  var inflateStateCheck = (strm) => {
    if (!strm) {
      return 1;
    }
    const state = strm.state;
    if (!state || state.strm !== strm || state.mode < HEAD || state.mode > SYNC) {
      return 1;
    }
    return 0;
  };
  var inflateResetKeep = (strm) => {
    if (inflateStateCheck(strm)) {
      return Z_STREAM_ERROR$1;
    }
    const state = strm.state;
    strm.total_in = strm.total_out = state.total = 0;
    strm.msg = "";
    if (state.wrap) {
      strm.adler = state.wrap & 1;
    }
    state.mode = HEAD;
    state.last = 0;
    state.havedict = 0;
    state.flags = -1;
    state.dmax = 32768;
    state.head = null;
    state.hold = 0;
    state.bits = 0;
    state.lencode = state.lendyn = new Int32Array(ENOUGH_LENS);
    state.distcode = state.distdyn = new Int32Array(ENOUGH_DISTS);
    state.sane = 1;
    state.back = -1;
    return Z_OK$1;
  };
  var inflateReset = (strm) => {
    if (inflateStateCheck(strm)) {
      return Z_STREAM_ERROR$1;
    }
    const state = strm.state;
    state.wsize = 0;
    state.whave = 0;
    state.wnext = 0;
    return inflateResetKeep(strm);
  };
  var inflateReset2 = (strm, windowBits) => {
    let wrap5;
    if (inflateStateCheck(strm)) {
      return Z_STREAM_ERROR$1;
    }
    const state = strm.state;
    if (windowBits < 0) {
      wrap5 = 0;
      windowBits = -windowBits;
    } else {
      wrap5 = (windowBits >> 4) + 5;
      if (windowBits < 48) {
        windowBits &= 15;
      }
    }
    if (windowBits && (windowBits < 8 || windowBits > 15)) {
      return Z_STREAM_ERROR$1;
    }
    if (state.window !== null && state.wbits !== windowBits) {
      state.window = null;
    }
    state.wrap = wrap5;
    state.wbits = windowBits;
    return inflateReset(strm);
  };
  var inflateInit2 = (strm, windowBits) => {
    if (!strm) {
      return Z_STREAM_ERROR$1;
    }
    const state = new InflateState();
    strm.state = state;
    state.strm = strm;
    state.window = null;
    state.mode = HEAD;
    const ret = inflateReset2(strm, windowBits);
    if (ret !== Z_OK$1) {
      strm.state = null;
    }
    return ret;
  };
  var inflateInit = (strm) => {
    return inflateInit2(strm, DEF_WBITS);
  };
  var virgin = true;
  var lenfix;
  var distfix;
  var fixedtables = (state) => {
    if (virgin) {
      lenfix = new Int32Array(512);
      distfix = new Int32Array(32);
      let sym = 0;
      while (sym < 144) {
        state.lens[sym++] = 8;
      }
      while (sym < 256) {
        state.lens[sym++] = 9;
      }
      while (sym < 280) {
        state.lens[sym++] = 7;
      }
      while (sym < 288) {
        state.lens[sym++] = 8;
      }
      inftrees(LENS, state.lens, 0, 288, lenfix, 0, state.work, { bits: 9 });
      sym = 0;
      while (sym < 32) {
        state.lens[sym++] = 5;
      }
      inftrees(DISTS, state.lens, 0, 32, distfix, 0, state.work, { bits: 5 });
      virgin = false;
    }
    state.lencode = lenfix;
    state.lenbits = 9;
    state.distcode = distfix;
    state.distbits = 5;
  };
  var updatewindow = (strm, src, end, copy) => {
    let dist;
    const state = strm.state;
    if (state.window === null) {
      state.wsize = 1 << state.wbits;
      state.wnext = 0;
      state.whave = 0;
      state.window = new Uint8Array(state.wsize);
    }
    if (copy >= state.wsize) {
      state.window.set(src.subarray(end - state.wsize, end), 0);
      state.wnext = 0;
      state.whave = state.wsize;
    } else {
      dist = state.wsize - state.wnext;
      if (dist > copy) {
        dist = copy;
      }
      state.window.set(src.subarray(end - copy, end - copy + dist), state.wnext);
      copy -= dist;
      if (copy) {
        state.window.set(src.subarray(end - copy, end), 0);
        state.wnext = copy;
        state.whave = state.wsize;
      } else {
        state.wnext += dist;
        if (state.wnext === state.wsize) {
          state.wnext = 0;
        }
        if (state.whave < state.wsize) {
          state.whave += dist;
        }
      }
    }
    return 0;
  };
  var inflate$2 = (strm, flush) => {
    let state;
    let input, output;
    let next;
    let put;
    let have, left;
    let hold;
    let bits;
    let _in, _out;
    let copy;
    let from;
    let from_source;
    let here = 0;
    let here_bits, here_op, here_val;
    let last_bits, last_op, last_val;
    let len;
    let ret;
    const hbuf = new Uint8Array(4);
    let opts;
    let n;
    const order = (
      /* permutation of code lengths */
      new Uint8Array([16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15])
    );
    if (inflateStateCheck(strm) || !strm.output || !strm.input && strm.avail_in !== 0) {
      return Z_STREAM_ERROR$1;
    }
    state = strm.state;
    if (state.mode === TYPE) {
      state.mode = TYPEDO;
    }
    put = strm.next_out;
    output = strm.output;
    left = strm.avail_out;
    next = strm.next_in;
    input = strm.input;
    have = strm.avail_in;
    hold = state.hold;
    bits = state.bits;
    _in = have;
    _out = left;
    ret = Z_OK$1;
    inf_leave:
      for (; ; ) {
        switch (state.mode) {
          case HEAD:
            if (state.wrap === 0) {
              state.mode = TYPEDO;
              break;
            }
            while (bits < 16) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            if (state.wrap & 2 && hold === 35615) {
              if (state.wbits === 0) {
                state.wbits = 15;
              }
              state.check = 0;
              hbuf[0] = hold & 255;
              hbuf[1] = hold >>> 8 & 255;
              state.check = crc32_1(state.check, hbuf, 2, 0);
              hold = 0;
              bits = 0;
              state.mode = FLAGS;
              break;
            }
            if (state.head) {
              state.head.done = false;
            }
            if (!(state.wrap & 1) || /* check if zlib header allowed */
            (((hold & 255) << 8) + (hold >> 8)) % 31) {
              strm.msg = "incorrect header check";
              state.mode = BAD;
              break;
            }
            if ((hold & 15) !== Z_DEFLATED) {
              strm.msg = "unknown compression method";
              state.mode = BAD;
              break;
            }
            hold >>>= 4;
            bits -= 4;
            len = (hold & 15) + 8;
            if (state.wbits === 0) {
              state.wbits = len;
            }
            if (len > 15 || len > state.wbits) {
              strm.msg = "invalid window size";
              state.mode = BAD;
              break;
            }
            state.dmax = 1 << state.wbits;
            state.flags = 0;
            strm.adler = state.check = 1;
            state.mode = hold & 512 ? DICTID : TYPE;
            hold = 0;
            bits = 0;
            break;
          case FLAGS:
            while (bits < 16) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            state.flags = hold;
            if ((state.flags & 255) !== Z_DEFLATED) {
              strm.msg = "unknown compression method";
              state.mode = BAD;
              break;
            }
            if (state.flags & 57344) {
              strm.msg = "unknown header flags set";
              state.mode = BAD;
              break;
            }
            if (state.head) {
              state.head.text = hold >> 8 & 1;
            }
            if (state.flags & 512 && state.wrap & 4) {
              hbuf[0] = hold & 255;
              hbuf[1] = hold >>> 8 & 255;
              state.check = crc32_1(state.check, hbuf, 2, 0);
            }
            hold = 0;
            bits = 0;
            state.mode = TIME;
          case TIME:
            while (bits < 32) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            if (state.head) {
              state.head.time = hold;
            }
            if (state.flags & 512 && state.wrap & 4) {
              hbuf[0] = hold & 255;
              hbuf[1] = hold >>> 8 & 255;
              hbuf[2] = hold >>> 16 & 255;
              hbuf[3] = hold >>> 24 & 255;
              state.check = crc32_1(state.check, hbuf, 4, 0);
            }
            hold = 0;
            bits = 0;
            state.mode = OS;
          case OS:
            while (bits < 16) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            if (state.head) {
              state.head.xflags = hold & 255;
              state.head.os = hold >> 8;
            }
            if (state.flags & 512 && state.wrap & 4) {
              hbuf[0] = hold & 255;
              hbuf[1] = hold >>> 8 & 255;
              state.check = crc32_1(state.check, hbuf, 2, 0);
            }
            hold = 0;
            bits = 0;
            state.mode = EXLEN;
          case EXLEN:
            if (state.flags & 1024) {
              while (bits < 16) {
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              state.length = hold;
              if (state.head) {
                state.head.extra_len = hold;
              }
              if (state.flags & 512 && state.wrap & 4) {
                hbuf[0] = hold & 255;
                hbuf[1] = hold >>> 8 & 255;
                state.check = crc32_1(state.check, hbuf, 2, 0);
              }
              hold = 0;
              bits = 0;
            } else if (state.head) {
              state.head.extra = null;
            }
            state.mode = EXTRA;
          case EXTRA:
            if (state.flags & 1024) {
              copy = state.length;
              if (copy > have) {
                copy = have;
              }
              if (copy) {
                if (state.head) {
                  len = state.head.extra_len - state.length;
                  if (!state.head.extra) {
                    state.head.extra = new Uint8Array(state.head.extra_len);
                  }
                  state.head.extra.set(
                    input.subarray(
                      next,
                      // extra field is limited to 65536 bytes
                      // - no need for additional size check
                      next + copy
                    ),
                    /*len + copy > state.head.extra_max - len ? state.head.extra_max : copy,*/
                    len
                  );
                }
                if (state.flags & 512 && state.wrap & 4) {
                  state.check = crc32_1(state.check, input, copy, next);
                }
                have -= copy;
                next += copy;
                state.length -= copy;
              }
              if (state.length) {
                break inf_leave;
              }
            }
            state.length = 0;
            state.mode = NAME;
          case NAME:
            if (state.flags & 2048) {
              if (have === 0) {
                break inf_leave;
              }
              copy = 0;
              do {
                len = input[next + copy++];
                if (state.head && len && state.length < 65536) {
                  state.head.name += String.fromCharCode(len);
                }
              } while (len && copy < have);
              if (state.flags & 512 && state.wrap & 4) {
                state.check = crc32_1(state.check, input, copy, next);
              }
              have -= copy;
              next += copy;
              if (len) {
                break inf_leave;
              }
            } else if (state.head) {
              state.head.name = null;
            }
            state.length = 0;
            state.mode = COMMENT;
          case COMMENT:
            if (state.flags & 4096) {
              if (have === 0) {
                break inf_leave;
              }
              copy = 0;
              do {
                len = input[next + copy++];
                if (state.head && len && state.length < 65536) {
                  state.head.comment += String.fromCharCode(len);
                }
              } while (len && copy < have);
              if (state.flags & 512 && state.wrap & 4) {
                state.check = crc32_1(state.check, input, copy, next);
              }
              have -= copy;
              next += copy;
              if (len) {
                break inf_leave;
              }
            } else if (state.head) {
              state.head.comment = null;
            }
            state.mode = HCRC;
          case HCRC:
            if (state.flags & 512) {
              while (bits < 16) {
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              if (state.wrap & 4 && hold !== (state.check & 65535)) {
                strm.msg = "header crc mismatch";
                state.mode = BAD;
                break;
              }
              hold = 0;
              bits = 0;
            }
            if (state.head) {
              state.head.hcrc = state.flags >> 9 & 1;
              state.head.done = true;
            }
            strm.adler = state.check = 0;
            state.mode = TYPE;
            break;
          case DICTID:
            while (bits < 32) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            strm.adler = state.check = zswap32(hold);
            hold = 0;
            bits = 0;
            state.mode = DICT;
          case DICT:
            if (state.havedict === 0) {
              strm.next_out = put;
              strm.avail_out = left;
              strm.next_in = next;
              strm.avail_in = have;
              state.hold = hold;
              state.bits = bits;
              return Z_NEED_DICT$1;
            }
            strm.adler = state.check = 1;
            state.mode = TYPE;
          case TYPE:
            if (flush === Z_BLOCK || flush === Z_TREES) {
              break inf_leave;
            }
          case TYPEDO:
            if (state.last) {
              hold >>>= bits & 7;
              bits -= bits & 7;
              state.mode = CHECK;
              break;
            }
            while (bits < 3) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            state.last = hold & 1;
            hold >>>= 1;
            bits -= 1;
            switch (hold & 3) {
              case 0:
                state.mode = STORED;
                break;
              case 1:
                fixedtables(state);
                state.mode = LEN_;
                if (flush === Z_TREES) {
                  hold >>>= 2;
                  bits -= 2;
                  break inf_leave;
                }
                break;
              case 2:
                state.mode = TABLE;
                break;
              case 3:
                strm.msg = "invalid block type";
                state.mode = BAD;
            }
            hold >>>= 2;
            bits -= 2;
            break;
          case STORED:
            hold >>>= bits & 7;
            bits -= bits & 7;
            while (bits < 32) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            if ((hold & 65535) !== (hold >>> 16 ^ 65535)) {
              strm.msg = "invalid stored block lengths";
              state.mode = BAD;
              break;
            }
            state.length = hold & 65535;
            hold = 0;
            bits = 0;
            state.mode = COPY_;
            if (flush === Z_TREES) {
              break inf_leave;
            }
          case COPY_:
            state.mode = COPY;
          case COPY:
            copy = state.length;
            if (copy) {
              if (copy > have) {
                copy = have;
              }
              if (copy > left) {
                copy = left;
              }
              if (copy === 0) {
                break inf_leave;
              }
              output.set(input.subarray(next, next + copy), put);
              have -= copy;
              next += copy;
              left -= copy;
              put += copy;
              state.length -= copy;
              break;
            }
            state.mode = TYPE;
            break;
          case TABLE:
            while (bits < 14) {
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            state.nlen = (hold & 31) + 257;
            hold >>>= 5;
            bits -= 5;
            state.ndist = (hold & 31) + 1;
            hold >>>= 5;
            bits -= 5;
            state.ncode = (hold & 15) + 4;
            hold >>>= 4;
            bits -= 4;
            if (state.nlen > 286 || state.ndist > 30) {
              strm.msg = "too many length or distance symbols";
              state.mode = BAD;
              break;
            }
            state.have = 0;
            state.mode = LENLENS;
          case LENLENS:
            while (state.have < state.ncode) {
              while (bits < 3) {
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              state.lens[order[state.have++]] = hold & 7;
              hold >>>= 3;
              bits -= 3;
            }
            while (state.have < 19) {
              state.lens[order[state.have++]] = 0;
            }
            state.lencode = state.lendyn;
            state.lenbits = 7;
            opts = { bits: state.lenbits };
            ret = inftrees(CODES, state.lens, 0, 19, state.lencode, 0, state.work, opts);
            state.lenbits = opts.bits;
            if (ret) {
              strm.msg = "invalid code lengths set";
              state.mode = BAD;
              break;
            }
            state.have = 0;
            state.mode = CODELENS;
          case CODELENS:
            while (state.have < state.nlen + state.ndist) {
              for (; ; ) {
                here = state.lencode[hold & (1 << state.lenbits) - 1];
                here_bits = here >>> 24;
                here_op = here >>> 16 & 255;
                here_val = here & 65535;
                if (here_bits <= bits) {
                  break;
                }
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              if (here_val < 16) {
                hold >>>= here_bits;
                bits -= here_bits;
                state.lens[state.have++] = here_val;
              } else {
                if (here_val === 16) {
                  n = here_bits + 2;
                  while (bits < n) {
                    if (have === 0) {
                      break inf_leave;
                    }
                    have--;
                    hold += input[next++] << bits;
                    bits += 8;
                  }
                  hold >>>= here_bits;
                  bits -= here_bits;
                  if (state.have === 0) {
                    strm.msg = "invalid bit length repeat";
                    state.mode = BAD;
                    break;
                  }
                  len = state.lens[state.have - 1];
                  copy = 3 + (hold & 3);
                  hold >>>= 2;
                  bits -= 2;
                } else if (here_val === 17) {
                  n = here_bits + 3;
                  while (bits < n) {
                    if (have === 0) {
                      break inf_leave;
                    }
                    have--;
                    hold += input[next++] << bits;
                    bits += 8;
                  }
                  hold >>>= here_bits;
                  bits -= here_bits;
                  len = 0;
                  copy = 3 + (hold & 7);
                  hold >>>= 3;
                  bits -= 3;
                } else {
                  n = here_bits + 7;
                  while (bits < n) {
                    if (have === 0) {
                      break inf_leave;
                    }
                    have--;
                    hold += input[next++] << bits;
                    bits += 8;
                  }
                  hold >>>= here_bits;
                  bits -= here_bits;
                  len = 0;
                  copy = 11 + (hold & 127);
                  hold >>>= 7;
                  bits -= 7;
                }
                if (state.have + copy > state.nlen + state.ndist) {
                  strm.msg = "invalid bit length repeat";
                  state.mode = BAD;
                  break;
                }
                while (copy--) {
                  state.lens[state.have++] = len;
                }
              }
            }
            if (state.mode === BAD) {
              break;
            }
            if (state.lens[256] === 0) {
              strm.msg = "invalid code -- missing end-of-block";
              state.mode = BAD;
              break;
            }
            state.lenbits = 9;
            opts = { bits: state.lenbits };
            ret = inftrees(LENS, state.lens, 0, state.nlen, state.lencode, 0, state.work, opts);
            state.lenbits = opts.bits;
            if (ret) {
              strm.msg = "invalid literal/lengths set";
              state.mode = BAD;
              break;
            }
            state.distbits = 6;
            state.distcode = state.distdyn;
            opts = { bits: state.distbits };
            ret = inftrees(DISTS, state.lens, state.nlen, state.ndist, state.distcode, 0, state.work, opts);
            state.distbits = opts.bits;
            if (ret) {
              strm.msg = "invalid distances set";
              state.mode = BAD;
              break;
            }
            state.mode = LEN_;
            if (flush === Z_TREES) {
              break inf_leave;
            }
          case LEN_:
            state.mode = LEN;
          case LEN:
            if (have >= 6 && left >= 258) {
              strm.next_out = put;
              strm.avail_out = left;
              strm.next_in = next;
              strm.avail_in = have;
              state.hold = hold;
              state.bits = bits;
              inffast(strm, _out);
              put = strm.next_out;
              output = strm.output;
              left = strm.avail_out;
              next = strm.next_in;
              input = strm.input;
              have = strm.avail_in;
              hold = state.hold;
              bits = state.bits;
              if (state.mode === TYPE) {
                state.back = -1;
              }
              break;
            }
            state.back = 0;
            for (; ; ) {
              here = state.lencode[hold & (1 << state.lenbits) - 1];
              here_bits = here >>> 24;
              here_op = here >>> 16 & 255;
              here_val = here & 65535;
              if (here_bits <= bits) {
                break;
              }
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            if (here_op && (here_op & 240) === 0) {
              last_bits = here_bits;
              last_op = here_op;
              last_val = here_val;
              for (; ; ) {
                here = state.lencode[last_val + ((hold & (1 << last_bits + last_op) - 1) >> last_bits)];
                here_bits = here >>> 24;
                here_op = here >>> 16 & 255;
                here_val = here & 65535;
                if (last_bits + here_bits <= bits) {
                  break;
                }
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              hold >>>= last_bits;
              bits -= last_bits;
              state.back += last_bits;
            }
            hold >>>= here_bits;
            bits -= here_bits;
            state.back += here_bits;
            state.length = here_val;
            if (here_op === 0) {
              state.mode = LIT;
              break;
            }
            if (here_op & 32) {
              state.back = -1;
              state.mode = TYPE;
              break;
            }
            if (here_op & 64) {
              strm.msg = "invalid literal/length code";
              state.mode = BAD;
              break;
            }
            state.extra = here_op & 15;
            state.mode = LENEXT;
          case LENEXT:
            if (state.extra) {
              n = state.extra;
              while (bits < n) {
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              state.length += hold & (1 << state.extra) - 1;
              hold >>>= state.extra;
              bits -= state.extra;
              state.back += state.extra;
            }
            state.was = state.length;
            state.mode = DIST;
          case DIST:
            for (; ; ) {
              here = state.distcode[hold & (1 << state.distbits) - 1];
              here_bits = here >>> 24;
              here_op = here >>> 16 & 255;
              here_val = here & 65535;
              if (here_bits <= bits) {
                break;
              }
              if (have === 0) {
                break inf_leave;
              }
              have--;
              hold += input[next++] << bits;
              bits += 8;
            }
            if ((here_op & 240) === 0) {
              last_bits = here_bits;
              last_op = here_op;
              last_val = here_val;
              for (; ; ) {
                here = state.distcode[last_val + ((hold & (1 << last_bits + last_op) - 1) >> last_bits)];
                here_bits = here >>> 24;
                here_op = here >>> 16 & 255;
                here_val = here & 65535;
                if (last_bits + here_bits <= bits) {
                  break;
                }
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              hold >>>= last_bits;
              bits -= last_bits;
              state.back += last_bits;
            }
            hold >>>= here_bits;
            bits -= here_bits;
            state.back += here_bits;
            if (here_op & 64) {
              strm.msg = "invalid distance code";
              state.mode = BAD;
              break;
            }
            state.offset = here_val;
            state.extra = here_op & 15;
            state.mode = DISTEXT;
          case DISTEXT:
            if (state.extra) {
              n = state.extra;
              while (bits < n) {
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              state.offset += hold & (1 << state.extra) - 1;
              hold >>>= state.extra;
              bits -= state.extra;
              state.back += state.extra;
            }
            if (state.offset > state.dmax) {
              strm.msg = "invalid distance too far back";
              state.mode = BAD;
              break;
            }
            state.mode = MATCH;
          case MATCH:
            if (left === 0) {
              break inf_leave;
            }
            copy = _out - left;
            if (state.offset > copy) {
              copy = state.offset - copy;
              if (copy > state.whave) {
                if (state.sane) {
                  strm.msg = "invalid distance too far back";
                  state.mode = BAD;
                  break;
                }
              }
              if (copy > state.wnext) {
                copy -= state.wnext;
                from = state.wsize - copy;
              } else {
                from = state.wnext - copy;
              }
              if (copy > state.length) {
                copy = state.length;
              }
              from_source = state.window;
            } else {
              from_source = output;
              from = put - state.offset;
              copy = state.length;
            }
            if (copy > left) {
              copy = left;
            }
            left -= copy;
            state.length -= copy;
            do {
              output[put++] = from_source[from++];
            } while (--copy);
            if (state.length === 0) {
              state.mode = LEN;
            }
            break;
          case LIT:
            if (left === 0) {
              break inf_leave;
            }
            output[put++] = state.length;
            left--;
            state.mode = LEN;
            break;
          case CHECK:
            if (state.wrap) {
              while (bits < 32) {
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold |= input[next++] << bits;
                bits += 8;
              }
              _out -= left;
              strm.total_out += _out;
              state.total += _out;
              if (state.wrap & 4 && _out) {
                strm.adler = state.check = /*UPDATE_CHECK(state.check, put - _out, _out);*/
                state.flags ? crc32_1(state.check, output, _out, put - _out) : adler32_1(state.check, output, _out, put - _out);
              }
              _out = left;
              if (state.wrap & 4 && (state.flags ? hold : zswap32(hold)) !== state.check) {
                strm.msg = "incorrect data check";
                state.mode = BAD;
                break;
              }
              hold = 0;
              bits = 0;
            }
            state.mode = LENGTH;
          case LENGTH:
            if (state.wrap && state.flags) {
              while (bits < 32) {
                if (have === 0) {
                  break inf_leave;
                }
                have--;
                hold += input[next++] << bits;
                bits += 8;
              }
              if (state.wrap & 4 && hold !== (state.total & 4294967295)) {
                strm.msg = "incorrect length check";
                state.mode = BAD;
                break;
              }
              hold = 0;
              bits = 0;
            }
            state.mode = DONE;
          case DONE:
            ret = Z_STREAM_END$1;
            break inf_leave;
          case BAD:
            ret = Z_DATA_ERROR$1;
            break inf_leave;
          case MEM:
            return Z_MEM_ERROR$1;
          case SYNC:
          default:
            return Z_STREAM_ERROR$1;
        }
      }
    strm.next_out = put;
    strm.avail_out = left;
    strm.next_in = next;
    strm.avail_in = have;
    state.hold = hold;
    state.bits = bits;
    if (state.wsize || _out !== strm.avail_out && state.mode < BAD && (state.mode < CHECK || flush !== Z_FINISH$1)) {
      if (updatewindow(strm, strm.output, strm.next_out, _out - strm.avail_out)) ;
    }
    _in -= strm.avail_in;
    _out -= strm.avail_out;
    strm.total_in += _in;
    strm.total_out += _out;
    state.total += _out;
    if (state.wrap & 4 && _out) {
      strm.adler = state.check = /*UPDATE_CHECK(state.check, strm.next_out - _out, _out);*/
      state.flags ? crc32_1(state.check, output, _out, strm.next_out - _out) : adler32_1(state.check, output, _out, strm.next_out - _out);
    }
    strm.data_type = state.bits + (state.last ? 64 : 0) + (state.mode === TYPE ? 128 : 0) + (state.mode === LEN_ || state.mode === COPY_ ? 256 : 0);
    if ((_in === 0 && _out === 0 || flush === Z_FINISH$1) && ret === Z_OK$1) {
      ret = Z_BUF_ERROR;
    }
    return ret;
  };
  var inflateEnd = (strm) => {
    if (inflateStateCheck(strm)) {
      return Z_STREAM_ERROR$1;
    }
    let state = strm.state;
    if (state.window) {
      state.window = null;
    }
    strm.state = null;
    return Z_OK$1;
  };
  var inflateGetHeader = (strm, head) => {
    if (inflateStateCheck(strm)) {
      return Z_STREAM_ERROR$1;
    }
    const state = strm.state;
    if ((state.wrap & 2) === 0) {
      return Z_STREAM_ERROR$1;
    }
    state.head = head;
    head.done = false;
    return Z_OK$1;
  };
  var inflateSetDictionary = (strm, dictionary) => {
    const dictLength = dictionary.length;
    let state;
    let dictid;
    let ret;
    if (inflateStateCheck(strm)) {
      return Z_STREAM_ERROR$1;
    }
    state = strm.state;
    if (state.wrap !== 0 && state.mode !== DICT) {
      return Z_STREAM_ERROR$1;
    }
    if (state.mode === DICT) {
      dictid = 1;
      dictid = adler32_1(dictid, dictionary, dictLength, 0);
      if (dictid !== state.check) {
        return Z_DATA_ERROR$1;
      }
    }
    ret = updatewindow(strm, dictionary, dictLength, dictLength);
    if (ret) {
      state.mode = MEM;
      return Z_MEM_ERROR$1;
    }
    state.havedict = 1;
    return Z_OK$1;
  };
  var inflateReset_1 = inflateReset;
  var inflateReset2_1 = inflateReset2;
  var inflateResetKeep_1 = inflateResetKeep;
  var inflateInit_1 = inflateInit;
  var inflateInit2_1 = inflateInit2;
  var inflate_2$1 = inflate$2;
  var inflateEnd_1 = inflateEnd;
  var inflateGetHeader_1 = inflateGetHeader;
  var inflateSetDictionary_1 = inflateSetDictionary;
  var inflateInfo = "pako inflate (from Nodeca project)";
  var inflate_1$2 = {
    inflateReset: inflateReset_1,
    inflateReset2: inflateReset2_1,
    inflateResetKeep: inflateResetKeep_1,
    inflateInit: inflateInit_1,
    inflateInit2: inflateInit2_1,
    inflate: inflate_2$1,
    inflateEnd: inflateEnd_1,
    inflateGetHeader: inflateGetHeader_1,
    inflateSetDictionary: inflateSetDictionary_1,
    inflateInfo
  };
  function GZheader() {
    this.text = 0;
    this.time = 0;
    this.xflags = 0;
    this.os = 0;
    this.extra = null;
    this.extra_len = 0;
    this.name = "";
    this.comment = "";
    this.hcrc = 0;
    this.done = false;
  }
  var gzheader = GZheader;
  var toString = Object.prototype.toString;
  var {
    Z_NO_FLUSH,
    Z_FINISH,
    Z_OK,
    Z_STREAM_END,
    Z_NEED_DICT,
    Z_STREAM_ERROR,
    Z_DATA_ERROR,
    Z_MEM_ERROR
  } = constants$2;
  function Inflate$1(options) {
    this.options = common.assign({
      chunkSize: 1024 * 64,
      windowBits: 15,
      to: ""
    }, options || {});
    const opt = this.options;
    if (opt.raw && opt.windowBits >= 0 && opt.windowBits < 16) {
      opt.windowBits = -opt.windowBits;
      if (opt.windowBits === 0) {
        opt.windowBits = -15;
      }
    }
    if (opt.windowBits >= 0 && opt.windowBits < 16 && !(options && options.windowBits)) {
      opt.windowBits += 32;
    }
    if (opt.windowBits > 15 && opt.windowBits < 48) {
      if ((opt.windowBits & 15) === 0) {
        opt.windowBits |= 15;
      }
    }
    this.err = 0;
    this.msg = "";
    this.ended = false;
    this.chunks = [];
    this.strm = new zstream();
    this.strm.avail_out = 0;
    let status = inflate_1$2.inflateInit2(
      this.strm,
      opt.windowBits
    );
    if (status !== Z_OK) {
      throw new Error(messages[status]);
    }
    this.header = new gzheader();
    inflate_1$2.inflateGetHeader(this.strm, this.header);
    if (opt.dictionary) {
      if (typeof opt.dictionary === "string") {
        opt.dictionary = strings.string2buf(opt.dictionary);
      } else if (toString.call(opt.dictionary) === "[object ArrayBuffer]") {
        opt.dictionary = new Uint8Array(opt.dictionary);
      }
      if (opt.raw) {
        status = inflate_1$2.inflateSetDictionary(this.strm, opt.dictionary);
        if (status !== Z_OK) {
          throw new Error(messages[status]);
        }
      }
    }
  }
  Inflate$1.prototype.push = function(data, flush_mode) {
    const strm = this.strm;
    const chunkSize = this.options.chunkSize;
    const dictionary = this.options.dictionary;
    let status, _flush_mode, last_avail_out;
    if (this.ended) return false;
    if (flush_mode === ~~flush_mode) _flush_mode = flush_mode;
    else _flush_mode = flush_mode === true ? Z_FINISH : Z_NO_FLUSH;
    if (toString.call(data) === "[object ArrayBuffer]") {
      strm.input = new Uint8Array(data);
    } else {
      strm.input = data;
    }
    strm.next_in = 0;
    strm.avail_in = strm.input.length;
    for (; ; ) {
      if (strm.avail_out === 0) {
        strm.output = new Uint8Array(chunkSize);
        strm.next_out = 0;
        strm.avail_out = chunkSize;
      }
      status = inflate_1$2.inflate(strm, _flush_mode);
      if (status === Z_NEED_DICT && dictionary) {
        status = inflate_1$2.inflateSetDictionary(strm, dictionary);
        if (status === Z_OK) {
          status = inflate_1$2.inflate(strm, _flush_mode);
        } else if (status === Z_DATA_ERROR) {
          status = Z_NEED_DICT;
        }
      }
      while (strm.avail_in > 0 && status === Z_STREAM_END && strm.state.wrap > 0 && data[strm.next_in] !== 0) {
        inflate_1$2.inflateReset(strm);
        status = inflate_1$2.inflate(strm, _flush_mode);
      }
      switch (status) {
        case Z_STREAM_ERROR:
        case Z_DATA_ERROR:
        case Z_NEED_DICT:
        case Z_MEM_ERROR:
          this.onEnd(status);
          this.ended = true;
          return false;
      }
      last_avail_out = strm.avail_out;
      if (strm.next_out) {
        if (strm.avail_out === 0 || status === Z_STREAM_END) {
          if (this.options.to === "string") {
            let next_out_utf8 = strings.utf8border(strm.output, strm.next_out);
            let tail = strm.next_out - next_out_utf8;
            let utf8str = strings.buf2string(strm.output, next_out_utf8);
            strm.next_out = tail;
            strm.avail_out = chunkSize - tail;
            if (tail) strm.output.set(strm.output.subarray(next_out_utf8, next_out_utf8 + tail), 0);
            this.onData(utf8str);
          } else {
            this.onData(strm.output.length === strm.next_out ? strm.output : strm.output.subarray(0, strm.next_out));
          }
        }
      }
      if (status === Z_OK && last_avail_out === 0) continue;
      if (status === Z_STREAM_END) {
        status = inflate_1$2.inflateEnd(this.strm);
        this.onEnd(status);
        this.ended = true;
        return true;
      }
      if (strm.avail_in === 0) break;
    }
    return true;
  };
  Inflate$1.prototype.onData = function(chunk) {
    this.chunks.push(chunk);
  };
  Inflate$1.prototype.onEnd = function(status) {
    if (status === Z_OK) {
      if (this.options.to === "string") {
        this.result = this.chunks.join("");
      } else {
        this.result = common.flattenChunks(this.chunks);
      }
    }
    this.chunks = [];
    this.err = status;
    this.msg = this.strm.msg;
  };
  function inflate$1(input, options) {
    const inflator = new Inflate$1(options);
    inflator.push(input);
    if (inflator.err) throw inflator.msg || messages[inflator.err];
    return inflator.result;
  }
  function inflateRaw$1(input, options) {
    options = options || {};
    options.raw = true;
    return inflate$1(input, options);
  }
  var Inflate_1$1 = Inflate$1;
  var inflate_2 = inflate$1;
  var inflateRaw_1$1 = inflateRaw$1;
  var ungzip$1 = inflate$1;
  var constants = constants$2;
  var inflate_1$1 = {
    Inflate: Inflate_1$1,
    inflate: inflate_2,
    inflateRaw: inflateRaw_1$1,
    ungzip: ungzip$1,
    constants
  };
  var { Deflate, deflate, deflateRaw, gzip } = deflate_1$1;
  var { Inflate, inflate, inflateRaw, ungzip } = inflate_1$1;
  var Deflate_1 = Deflate;

  // images/libraries/apex/telemetry/exporters/transform.mjs
  var idGenerator = new RandomIdGenerator2();
  function toClsLogs(span) {
    let retval = [];
    const endMessageType = extractEndMessageType(span);
    const startTime = hrTimeToMilliseconds(span.startTime);
    const endTime = hrTimeToMilliseconds(span.endTime);
    const coreMsg = {
      span_id: span.spanContext().spanId,
      trace_id: span.spanContext().traceId,
      parent_span_id: span.parentSpanId || null,
      reference_type: span.parentSpanId ? "childOf" : null,
      level: "trace",
      event: span.name
    };
    const attributes = parseAttributes(span);
    const endMsg = {
      ...coreMsg,
      ts: endTime,
      start_time: startTime,
      end_time: endTime,
      duration: hrTimeToMilliseconds(span.duration),
      message_type: endMessageType,
      msg: attributes.msg ? attributes.msg : `ending span ${span.name}`,
      // PATCHED -- end msg was missing
      ...attributes
    };
    if (!span.attributes["priority.boosted"]) {
    }
    span.events.forEach((evt) => {
      if (shouldPromote(evt)) {
        retval.push(eventToClsLog(span, attributes, evt));
      }
    });
    retval.push(endMsg);
    return retval;
  }
  var eventMap = {
    "heroRendered": 1,
    "heroReady": 1,
    "allHeroesReady": 1,
    "allHeroesRendered": 1
  };
  function shouldPromote(evt) {
    return eventMap[evt.name] !== void 0;
  }
  function parseAttributes(span) {
    const attrs = {
      ...span.attributes
      // ...(span.resource.attributes)
    };
    return attrs;
  }
  var inheritedSpanAttributes = {
    "container.path": 1,
    "container.type": 1,
    "container.id": 1,
    "container.parent_id": 1,
    "session_id": 1,
    "component": 1,
    "user.guid": 1,
    "product.name": 1,
    "product.family": 1
  };
  function extractEndMessageType(span) {
    return span.parentSpanId ? "span/end" : "span/end/root/browser";
  }
  function eventToClsLog(span, spanAttributes, evt) {
    const ts = hrTimeToMilliseconds(evt.time);
    const inheritedAttributes = {};
    Object.keys(spanAttributes).filter((key) => inheritedSpanAttributes[key] !== void 0).forEach((key) => inheritedAttributes[key] = spanAttributes[key]);
    return {
      trace_id: span.spanContext().traceId,
      span_id: idGenerator.generateSpanId(),
      event: `metric/${evt.name}`,
      parent_span_id: span.spanContext().spanId,
      reference_type: "childOf",
      message_type: "span/end",
      start_time: hrTimeToMilliseconds(span.startTime),
      duration: hrTimeToMilliseconds(hrTimeDuration2(span.startTime, evt.time)),
      end_time: ts,
      ts,
      level: "trace",
      ...inheritedAttributes,
      ...evt.attributes
    };
  }

  // images/libraries/apex/telemetry/exporters/idle.mjs
  var idleSupported = () => window.requestIdleCallback !== void 0;
  var clock = new AnchoredClock(Date, window.performance || Date);
  function onIdle(handler, options) {
    if (idleSupported()) {
      return window.requestIdleCallback(handler, options);
    } else {
      let startTime = clock.now();
      return window.setTimeout(() => {
        handler({
          didTimeout: false,
          timeRemaining: function() {
            return Math.max(0, 50 - (clock.now() - startTime));
          }
        });
      }, 1);
    }
  }

  // images/libraries/apex/telemetry/exporters/ClsExporter.mjs
  var ClsExporter = class {
    /**
       * Constructor
       * @param options
       */
    constructor(options) {
      this.endpoint = options.endpoint;
      this.compress = options.compress ?? true;
      this.exportTimeout = options.exportTimeout ?? 3e4;
      this.getExportHeaders = options.getExportHeaders ?? (() => {
      });
      this.retries = options.retries ?? 3;
      this.retryInterval = options.retryInterval ?? 15e3;
      this.sendPromises = [];
      this.clock = new AnchoredClock(Date, window.performance);
      this.retryableMap = {
        429: 1,
        501: 1,
        503: 1
      };
    }
    /**
       * Import the spans to CLS Log format
       * @param spans
       * @param resultCallback
       */
    export(spans, resultCallback) {
      const logs3 = [];
      spans.forEach((span) => logs3.push(...toClsLogs(span)));
      logs3.sort((a, b) => a.ts - b.ts);
      if (this.compress) {
        const deflate2 = new Deflate_1({ gzip: true });
        deflate2.push('{"spans":[');
        const processPayload = (deadline) => {
          while (logs3.length > 0 && deadline.timeRemaining() > 0) {
            deflate2.push(JSON.stringify(logs3.shift()));
            if (logs3.length > 0) {
              deflate2.push(",");
            } else {
              deflate2.push("]}", true);
              if (deflate2.err) {
                resultCallback({
                  code: ExportResultCode4.FAILED,
                  error: new Error(`Error compressing payload: ${deflate2.err}`)
                });
              } else {
                const data = deflate2.result;
                onIdle(() => {
                  this.sendData(data, true, resultCallback);
                });
              }
              return;
            }
          }
          if (logs3.length > 0) {
            onIdle(processPayload);
          }
        };
        onIdle(processPayload, { timeout: this.exportTimeout });
      } else {
        const payload = {
          spans: logs3
        };
        const data = JSON.stringify(payload);
        onIdle(() => {
          this.sendData(data, false, resultCallback);
        });
      }
    }
    /**
       * Send data to the remote endpoint
       * @param data Data to send
       * @param resultCallback Callback for results
       */
    sendData(data, compressed, resultCallback) {
      const sendPromise = new Promise((resolve, reject) => {
        const headers = {
          ...this.getExportHeaders(),
          "content-type": "application/json",
          ...compressed ? { "content-encoding": "gzip" } : {}
        };
        fetch(this.endpoint, {
          headers,
          method: "POST",
          body: data,
          mode: "cors",
          credentials: "same-origin",
          keepalive: true
          // PATCHED
        }).then((response) => {
          if (response.ok) {
            resolve();
          } else {
            reject(response);
          }
        }).catch((reason) => {
          reject(reason);
        });
      });
      this.sendPromises.push(sendPromise);
      var retryCount = this.retries;
      const popPromise = () => {
        const index = this.sendPromises.indexOf(sendPromise);
        this.sendPromises.splice(index, 1);
      };
      const success = () => {
        popPromise();
        resultCallback({ code: ExportResultCode4.SUCCESS });
      };
      const retry = (reason) => {
        if (this.isRetryable(reason) && retryCount > 0) {
          retryCount = retryCount - 1;
          let retryInterval = this.parseRetryHeader(reason) || this.retryInterval;
          setTimeout(() => {
            sendPromise.then(success).catch(retry);
          }, retryInterval);
        } else {
          popPromise();
          resultCallback({
            code: ExportResultCode4.FAILED,
            error: reason
          });
        }
      };
      sendPromise.then(success).catch(retry);
    }
    /**
        * Calculate the retry interval based on response headers, if any
        * @param response
        */
    parseRetryHeader(response) {
      const retryAfter = response.headers.get("Retry-After");
      let interval = null;
      if (retryAfter) {
        try {
          interval = Number.parseInt(retryAfter, 10) * 1e3;
        } catch (err2) {
          try {
            let date = Date.parse(retryAfter);
            interval = date - this.clock.now();
          } catch (err22) {
            interval = null;
          }
        }
      }
      return interval;
    }
    /**
       * Indicates whether an error/status from a send can be retried
       * @param reason
       * @returns
       */
    isRetryable(reason) {
      if (reason.status) {
        return this.retryableMap[reason.status] !== void 0;
      }
      return false;
    }
    shutdown() {
      return Promise.resolve();
    }
    /**
       * Flush any pending requests
       * @returns
       */
    forceFlush() {
      return Promise.all(this.sendPromises).then(() => {
      });
    }
  };

  // images/libraries/apex/telemetry/processors/ContextProviderSpanProcessor.mjs
  var MAX_DELAY = 1e3;
  var ContextProviderSpanProcessor = class {
    constructor(config) {
      const { spanProcessor } = config;
      this._spanProcessor = spanProcessor;
      this._instrumentationMap = /* @__PURE__ */ new Map([
        ["@opentelemetry/instrumentation-document-load", { onStart: this._onStartDocumentLoad }],
        ["@opentelemetry/instrumentation-fetch", { onStart: this._onStartOrEndFetchXHR, onEnd: this._onStartOrEndFetchXHR }],
        ["@opentelemetry/instrumentation-xml-http-request", { onStart: this._onStartOrEndFetchXHR, onEnd: this._onStartOrEndFetchXHR }],
        ["@opentelemetry/instrumentation-user-interaction", { onEnd: this._onStartUserInteraction }],
        ["@apex/instrumentation-user-interaction", { onStart: this._onStartUserInteraction }]
      ]);
      this._lastNavigationSpan = null;
      this._lastUserInteractionSpan = null;
    }
    /**
     * Checks if the provided spans are a valid parent-child match.
     *
     * @param {Span} span
     * @param {Span} parentSpan
     */
    _isValidParentSpan(span, parentSpan) {
      let isValid = false;
      if (parentSpan) {
        const parentStart = hrTimeToMilliseconds(parentSpan.startTime);
        const spanStart = hrTimeToMilliseconds(span.startTime);
        if (parentStart <= spanStart) {
          const parentEnd = hrTimeToMilliseconds(parentSpan.endTime);
          if (parentEnd === 0 || spanStart <= parentEnd) {
            isValid = true;
          }
        }
      }
      return isValid;
    }
    /**
     * Finds a valid parent span for the provided span reference.
     *
     * @param {Span} span
     */
    _findParentSpan(span) {
      let parentSpan = this._lastUserInteractionSpan;
      if (!this._isValidParentSpan(span, parentSpan)) {
        parentSpan = this._lastNavigationSpan;
        if (!this._isValidParentSpan(span, parentSpan)) {
          parentSpan = void 0;
          const spanStart = hrTimeToMilliseconds(span.startTime);
          const userInteractionStart = this._lastUserInteractionSpan ? hrTimeToMilliseconds(this._lastUserInteractionSpan.startTime) : 0;
          const navigationStart = this._lastNavigationSpan ? hrTimeToMilliseconds(this._lastNavigationSpan.startTime) : 0;
          const userInteractionValid = userInteractionStart !== 0 && userInteractionStart <= spanStart;
          const navigationValid = navigationStart !== 0 && navigationStart <= spanStart;
          if (userInteractionValid && navigationValid) {
            const userInteractionOffset = spanStart - userInteractionStart;
            const navigationOffset = spanStart - navigationStart;
            if (userInteractionOffset <= navigationOffset && userInteractionOffset <= MAX_DELAY) {
              parentSpan = this._lastUserInteractionSpan;
            } else if (navigationOffset <= MAX_DELAY) {
              parentSpan = this._lastNavigationSpan;
            }
          } else if (userInteractionValid && spanStart - userInteractionStart <= MAX_DELAY) {
            parentSpan = this._lastUserInteractionSpan;
          } else if (navigationValid && spanStart - navigationStart <= MAX_DELAY) {
            parentSpan = this._lastNavigationSpan;
          }
        }
      }
      return parentSpan;
    }
    /**
     * Updates a span with the provided parent span reference.
     *
     * @param {Span} span
     * @param {Span} parentSpan
     */
    _setParentSpan(span, parentSpan) {
      const { spanId: parentSpanId, traceId: parentTraceId } = parentSpan.spanContext();
      span.parentSpanId = parentSpanId;
      span._spanContext.traceId = parentTraceId;
    }
    /**
     * onStart handler for events instrumented by the document load plugin.
     *
     * @param {Span} span
     * @param {Context} context
     */
    _onStartDocumentLoad(span, _context) {
      const { name } = span;
      if (name === "documentLoad") {
        this._lastNavigationSpan = span;
      }
    }
    /**
     * onStart handler for events instrumented by the user interaction plugin.
     *
     * @param {Span} span
     * @param {Context} context
     */
    _onStartUserInteraction(span, _context) {
      this._lastUserInteractionSpan = span;
    }
    /**
     * onStart handler for events instrumented by the fetch and XHR plugins.
     *
     * @param {Span} span
     * @param {Context} context
     */
    _onStartOrEndFetchXHR(span, _context) {
      if (!span.parentSpanId) {
        const parentSpan = this._findParentSpan(span);
        if (parentSpan) {
          this._setParentSpan(span, parentSpan);
        }
      }
    }
    /**
     * Override for span processor method that executes on a forced tracer flush.
     *
     * @returns {Promise<void>}
     */
    forceFlush() {
      return this._spanProcessor.forceFlush();
    }
    /**
     * Override for span processor method that executes on span start.
     * Span is recording and can be updated with `setAttribute()`.
     *
     * @param {Span} span
     * @param {Context} context
     */
    onStart(span, context2) {
      const { instrumentationLibrary } = span;
      if (instrumentationLibrary) {
        const { name: instrumentationName } = instrumentationLibrary;
        const instrumentationEntry = this._instrumentationMap.get(instrumentationName);
        if (instrumentationEntry) {
          instrumentationEntry.onStart?.call(this, span, context2);
        }
      }
      this._spanProcessor.onStart(span, context2);
    }
    /**
     * Override for span processor method that executes on span end.
     * Span is no longer recording and must be updated with direct writes,
     * as `setAttribute()` becomes no-op.
     *
     * @param {ReadableSpan} span
     */
    onEnd(span) {
      const { instrumentationLibrary } = span;
      if (instrumentationLibrary) {
        const { name: instrumentationName } = instrumentationLibrary;
        const instrumentationEntry = this._instrumentationMap.get(instrumentationName);
        if (instrumentationEntry) {
          instrumentationEntry.onEnd?.call(this, span);
        }
      }
      this._spanProcessor.onEnd(span);
    }
    /**
     * Override for span processor method that executes on tracer shutdown.
     *
     * @returns {Promise<void>}
     */
    shutdown() {
      return this._spanProcessor.shutdown();
    }
  };

  // images/libraries/apex/telemetry/utils/DebugFlags.mjs
  var FLAG_PREFIX = "apex.redwood.otel.options.";
  var CLS_COMPRESSION_ENABLED = `${FLAG_PREFIX}cls_compression_enabled`;
  var CONSOLE_EXPORTER_ENABLED = `${FLAG_PREFIX}console_exporter_enabled`;
  var DebugFlags = class {
    static isClsCompressionEnabled() {
      return localStorage.getItem(CLS_COMPRESSION_ENABLED) !== "false";
    }
    static isConsoleExporterEnabled() {
      return localStorage.getItem(CONSOLE_EXPORTER_ENABLED) === "true";
    }
  };

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/platform/browser/globalThis.js
  var _globalThis5 = typeof globalThis === "object" ? globalThis : typeof self === "object" ? self : typeof window === "object" ? window : typeof global === "object" ? global : {};

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/version.js
  var VERSION4 = "1.9.0";

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/internal/semver.js
  var re2 = /^(\d+)\.(\d+)\.(\d+)(-(.+))?$/;
  function _makeCompatibilityCheck2(ownVersion) {
    var acceptedVersions = /* @__PURE__ */ new Set([ownVersion]);
    var rejectedVersions = /* @__PURE__ */ new Set();
    var myVersionMatch = ownVersion.match(re2);
    if (!myVersionMatch) {
      return function() {
        return false;
      };
    }
    var ownVersionParsed = {
      major: +myVersionMatch[1],
      minor: +myVersionMatch[2],
      patch: +myVersionMatch[3],
      prerelease: myVersionMatch[4]
    };
    if (ownVersionParsed.prerelease != null) {
      return function isExactmatch(globalVersion) {
        return globalVersion === ownVersion;
      };
    }
    function _reject(v) {
      rejectedVersions.add(v);
      return false;
    }
    function _accept(v) {
      acceptedVersions.add(v);
      return true;
    }
    return function isCompatible3(globalVersion) {
      if (acceptedVersions.has(globalVersion)) {
        return true;
      }
      if (rejectedVersions.has(globalVersion)) {
        return false;
      }
      var globalVersionMatch = globalVersion.match(re2);
      if (!globalVersionMatch) {
        return _reject(globalVersion);
      }
      var globalVersionParsed = {
        major: +globalVersionMatch[1],
        minor: +globalVersionMatch[2],
        patch: +globalVersionMatch[3],
        prerelease: globalVersionMatch[4]
      };
      if (globalVersionParsed.prerelease != null) {
        return _reject(globalVersion);
      }
      if (ownVersionParsed.major !== globalVersionParsed.major) {
        return _reject(globalVersion);
      }
      if (ownVersionParsed.major === 0) {
        if (ownVersionParsed.minor === globalVersionParsed.minor && ownVersionParsed.patch <= globalVersionParsed.patch) {
          return _accept(globalVersion);
        }
        return _reject(globalVersion);
      }
      if (ownVersionParsed.minor <= globalVersionParsed.minor) {
        return _accept(globalVersion);
      }
      return _reject(globalVersion);
    };
  }
  var isCompatible2 = _makeCompatibilityCheck2(VERSION4);

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/internal/global-utils.js
  var major2 = VERSION4.split(".")[0];
  var GLOBAL_OPENTELEMETRY_API_KEY2 = Symbol.for("opentelemetry.js.api." + major2);
  var _global4 = _globalThis5;
  function registerGlobal2(type, instance, diag3, allowOverride) {
    var _a2;
    if (allowOverride === void 0) {
      allowOverride = false;
    }
    var api = _global4[GLOBAL_OPENTELEMETRY_API_KEY2] = (_a2 = _global4[GLOBAL_OPENTELEMETRY_API_KEY2]) !== null && _a2 !== void 0 ? _a2 : {
      version: VERSION4
    };
    if (!allowOverride && api[type]) {
      var err2 = new Error("@opentelemetry/api: Attempted duplicate registration of API: " + type);
      diag3.error(err2.stack || err2.message);
      return false;
    }
    if (api.version !== VERSION4) {
      var err2 = new Error("@opentelemetry/api: Registration of version v" + api.version + " for " + type + " does not match previously registered API v" + VERSION4);
      diag3.error(err2.stack || err2.message);
      return false;
    }
    api[type] = instance;
    diag3.debug("@opentelemetry/api: Registered a global for " + type + " v" + VERSION4 + ".");
    return true;
  }
  function getGlobal2(type) {
    var _a2, _b;
    var globalVersion = (_a2 = _global4[GLOBAL_OPENTELEMETRY_API_KEY2]) === null || _a2 === void 0 ? void 0 : _a2.version;
    if (!globalVersion || !isCompatible2(globalVersion)) {
      return;
    }
    return (_b = _global4[GLOBAL_OPENTELEMETRY_API_KEY2]) === null || _b === void 0 ? void 0 : _b[type];
  }
  function unregisterGlobal2(type, diag3) {
    diag3.debug("@opentelemetry/api: Unregistering a global for " + type + " v" + VERSION4 + ".");
    var api = _global4[GLOBAL_OPENTELEMETRY_API_KEY2];
    if (api) {
      delete api[type];
    }
  }

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/diag/ComponentLogger.js
  var __read9 = function(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
      while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    } catch (error) {
      e = { error };
    } finally {
      try {
        if (r && !r.done && (m = i["return"])) m.call(i);
      } finally {
        if (e) throw e.error;
      }
    }
    return ar;
  };
  var __spreadArray7 = function(to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
      if (ar || !(i in from)) {
        if (!ar) ar = Array.prototype.slice.call(from, 0, i);
        ar[i] = from[i];
      }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
  };
  var DiagComponentLogger2 = (
    /** @class */
    function() {
      function DiagComponentLogger3(props) {
        this._namespace = props.namespace || "DiagComponentLogger";
      }
      DiagComponentLogger3.prototype.debug = function() {
        var args = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          args[_i] = arguments[_i];
        }
        return logProxy2("debug", this._namespace, args);
      };
      DiagComponentLogger3.prototype.error = function() {
        var args = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          args[_i] = arguments[_i];
        }
        return logProxy2("error", this._namespace, args);
      };
      DiagComponentLogger3.prototype.info = function() {
        var args = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          args[_i] = arguments[_i];
        }
        return logProxy2("info", this._namespace, args);
      };
      DiagComponentLogger3.prototype.warn = function() {
        var args = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          args[_i] = arguments[_i];
        }
        return logProxy2("warn", this._namespace, args);
      };
      DiagComponentLogger3.prototype.verbose = function() {
        var args = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          args[_i] = arguments[_i];
        }
        return logProxy2("verbose", this._namespace, args);
      };
      return DiagComponentLogger3;
    }()
  );
  function logProxy2(funcName, namespace, args) {
    var logger = getGlobal2("diag");
    if (!logger) {
      return;
    }
    args.unshift(namespace);
    return logger[funcName].apply(logger, __spreadArray7([], __read9(args), false));
  }

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/diag/types.js
  var DiagLogLevel2;
  (function(DiagLogLevel3) {
    DiagLogLevel3[DiagLogLevel3["NONE"] = 0] = "NONE";
    DiagLogLevel3[DiagLogLevel3["ERROR"] = 30] = "ERROR";
    DiagLogLevel3[DiagLogLevel3["WARN"] = 50] = "WARN";
    DiagLogLevel3[DiagLogLevel3["INFO"] = 60] = "INFO";
    DiagLogLevel3[DiagLogLevel3["DEBUG"] = 70] = "DEBUG";
    DiagLogLevel3[DiagLogLevel3["VERBOSE"] = 80] = "VERBOSE";
    DiagLogLevel3[DiagLogLevel3["ALL"] = 9999] = "ALL";
  })(DiagLogLevel2 || (DiagLogLevel2 = {}));

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/diag/internal/logLevelLogger.js
  function createLogLevelDiagLogger2(maxLevel, logger) {
    if (maxLevel < DiagLogLevel2.NONE) {
      maxLevel = DiagLogLevel2.NONE;
    } else if (maxLevel > DiagLogLevel2.ALL) {
      maxLevel = DiagLogLevel2.ALL;
    }
    logger = logger || {};
    function _filterFunc(funcName, theLevel) {
      var theFunc = logger[funcName];
      if (typeof theFunc === "function" && maxLevel >= theLevel) {
        return theFunc.bind(logger);
      }
      return function() {
      };
    }
    return {
      error: _filterFunc("error", DiagLogLevel2.ERROR),
      warn: _filterFunc("warn", DiagLogLevel2.WARN),
      info: _filterFunc("info", DiagLogLevel2.INFO),
      debug: _filterFunc("debug", DiagLogLevel2.DEBUG),
      verbose: _filterFunc("verbose", DiagLogLevel2.VERBOSE)
    };
  }

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/api/diag.js
  var __read10 = function(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
      while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    } catch (error) {
      e = { error };
    } finally {
      try {
        if (r && !r.done && (m = i["return"])) m.call(i);
      } finally {
        if (e) throw e.error;
      }
    }
    return ar;
  };
  var __spreadArray8 = function(to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
      if (ar || !(i in from)) {
        if (!ar) ar = Array.prototype.slice.call(from, 0, i);
        ar[i] = from[i];
      }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
  };
  var API_NAME6 = "diag";
  var DiagAPI2 = (
    /** @class */
    function() {
      function DiagAPI3() {
        function _logProxy(funcName) {
          return function() {
            var args = [];
            for (var _i = 0; _i < arguments.length; _i++) {
              args[_i] = arguments[_i];
            }
            var logger = getGlobal2("diag");
            if (!logger)
              return;
            return logger[funcName].apply(logger, __spreadArray8([], __read10(args), false));
          };
        }
        var self2 = this;
        var setLogger = function(logger, optionsOrLogLevel) {
          var _a2, _b, _c;
          if (optionsOrLogLevel === void 0) {
            optionsOrLogLevel = { logLevel: DiagLogLevel2.INFO };
          }
          if (logger === self2) {
            var err2 = new Error("Cannot use diag as the logger for itself. Please use a DiagLogger implementation like ConsoleDiagLogger or a custom implementation");
            self2.error((_a2 = err2.stack) !== null && _a2 !== void 0 ? _a2 : err2.message);
            return false;
          }
          if (typeof optionsOrLogLevel === "number") {
            optionsOrLogLevel = {
              logLevel: optionsOrLogLevel
            };
          }
          var oldLogger = getGlobal2("diag");
          var newLogger = createLogLevelDiagLogger2((_b = optionsOrLogLevel.logLevel) !== null && _b !== void 0 ? _b : DiagLogLevel2.INFO, logger);
          if (oldLogger && !optionsOrLogLevel.suppressOverrideMessage) {
            var stack = (_c = new Error().stack) !== null && _c !== void 0 ? _c : "<failed to generate stacktrace>";
            oldLogger.warn("Current logger will be overwritten from " + stack);
            newLogger.warn("Current logger will overwrite one already registered from " + stack);
          }
          return registerGlobal2("diag", newLogger, self2, true);
        };
        self2.setLogger = setLogger;
        self2.disable = function() {
          unregisterGlobal2(API_NAME6, self2);
        };
        self2.createComponentLogger = function(options) {
          return new DiagComponentLogger2(options);
        };
        self2.verbose = _logProxy("verbose");
        self2.debug = _logProxy("debug");
        self2.info = _logProxy("info");
        self2.warn = _logProxy("warn");
        self2.error = _logProxy("error");
      }
      DiagAPI3.instance = function() {
        if (!this._instance) {
          this._instance = new DiagAPI3();
        }
        return this._instance;
      };
      return DiagAPI3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/context/context.js
  function createContextKey2(description) {
    return Symbol.for(description);
  }
  var BaseContext2 = (
    /** @class */
    /* @__PURE__ */ function() {
      function BaseContext3(parentContext) {
        var self2 = this;
        self2._currentContext = parentContext ? new Map(parentContext) : /* @__PURE__ */ new Map();
        self2.getValue = function(key) {
          return self2._currentContext.get(key);
        };
        self2.setValue = function(key, value) {
          var context2 = new BaseContext3(self2._currentContext);
          context2._currentContext.set(key, value);
          return context2;
        };
        self2.deleteValue = function(key) {
          var context2 = new BaseContext3(self2._currentContext);
          context2._currentContext.delete(key);
          return context2;
        };
      }
      return BaseContext3;
    }()
  );
  var ROOT_CONTEXT2 = new BaseContext2();

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/context/NoopContextManager.js
  var __read11 = function(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
      while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    } catch (error) {
      e = { error };
    } finally {
      try {
        if (r && !r.done && (m = i["return"])) m.call(i);
      } finally {
        if (e) throw e.error;
      }
    }
    return ar;
  };
  var __spreadArray9 = function(to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
      if (ar || !(i in from)) {
        if (!ar) ar = Array.prototype.slice.call(from, 0, i);
        ar[i] = from[i];
      }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
  };
  var NoopContextManager2 = (
    /** @class */
    function() {
      function NoopContextManager3() {
      }
      NoopContextManager3.prototype.active = function() {
        return ROOT_CONTEXT2;
      };
      NoopContextManager3.prototype.with = function(_context, fn, thisArg) {
        var args = [];
        for (var _i = 3; _i < arguments.length; _i++) {
          args[_i - 3] = arguments[_i];
        }
        return fn.call.apply(fn, __spreadArray9([thisArg], __read11(args), false));
      };
      NoopContextManager3.prototype.bind = function(_context, target) {
        return target;
      };
      NoopContextManager3.prototype.enable = function() {
        return this;
      };
      NoopContextManager3.prototype.disable = function() {
        return this;
      };
      return NoopContextManager3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/api/context.js
  var __read12 = function(o, n) {
    var m = typeof Symbol === "function" && o[Symbol.iterator];
    if (!m) return o;
    var i = m.call(o), r, ar = [], e;
    try {
      while ((n === void 0 || n-- > 0) && !(r = i.next()).done) ar.push(r.value);
    } catch (error) {
      e = { error };
    } finally {
      try {
        if (r && !r.done && (m = i["return"])) m.call(i);
      } finally {
        if (e) throw e.error;
      }
    }
    return ar;
  };
  var __spreadArray10 = function(to, from, pack) {
    if (pack || arguments.length === 2) for (var i = 0, l = from.length, ar; i < l; i++) {
      if (ar || !(i in from)) {
        if (!ar) ar = Array.prototype.slice.call(from, 0, i);
        ar[i] = from[i];
      }
    }
    return to.concat(ar || Array.prototype.slice.call(from));
  };
  var API_NAME7 = "context";
  var NOOP_CONTEXT_MANAGER2 = new NoopContextManager2();
  var ContextAPI2 = (
    /** @class */
    function() {
      function ContextAPI3() {
      }
      ContextAPI3.getInstance = function() {
        if (!this._instance) {
          this._instance = new ContextAPI3();
        }
        return this._instance;
      };
      ContextAPI3.prototype.setGlobalContextManager = function(contextManager) {
        return registerGlobal2(API_NAME7, contextManager, DiagAPI2.instance());
      };
      ContextAPI3.prototype.active = function() {
        return this._getContextManager().active();
      };
      ContextAPI3.prototype.with = function(context2, fn, thisArg) {
        var _a2;
        var args = [];
        for (var _i = 3; _i < arguments.length; _i++) {
          args[_i - 3] = arguments[_i];
        }
        return (_a2 = this._getContextManager()).with.apply(_a2, __spreadArray10([context2, fn, thisArg], __read12(args), false));
      };
      ContextAPI3.prototype.bind = function(context2, target) {
        return this._getContextManager().bind(context2, target);
      };
      ContextAPI3.prototype._getContextManager = function() {
        return getGlobal2(API_NAME7) || NOOP_CONTEXT_MANAGER2;
      };
      ContextAPI3.prototype.disable = function() {
        this._getContextManager().disable();
        unregisterGlobal2(API_NAME7, DiagAPI2.instance());
      };
      return ContextAPI3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/trace_flags.js
  var TraceFlags2;
  (function(TraceFlags3) {
    TraceFlags3[TraceFlags3["NONE"] = 0] = "NONE";
    TraceFlags3[TraceFlags3["SAMPLED"] = 1] = "SAMPLED";
  })(TraceFlags2 || (TraceFlags2 = {}));

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/invalid-span-constants.js
  var INVALID_SPANID2 = "0000000000000000";
  var INVALID_TRACEID2 = "00000000000000000000000000000000";
  var INVALID_SPAN_CONTEXT2 = {
    traceId: INVALID_TRACEID2,
    spanId: INVALID_SPANID2,
    traceFlags: TraceFlags2.NONE
  };

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/NonRecordingSpan.js
  var NonRecordingSpan2 = (
    /** @class */
    function() {
      function NonRecordingSpan3(_spanContext) {
        if (_spanContext === void 0) {
          _spanContext = INVALID_SPAN_CONTEXT2;
        }
        this._spanContext = _spanContext;
      }
      NonRecordingSpan3.prototype.spanContext = function() {
        return this._spanContext;
      };
      NonRecordingSpan3.prototype.setAttribute = function(_key, _value) {
        return this;
      };
      NonRecordingSpan3.prototype.setAttributes = function(_attributes) {
        return this;
      };
      NonRecordingSpan3.prototype.addEvent = function(_name, _attributes) {
        return this;
      };
      NonRecordingSpan3.prototype.addLink = function(_link) {
        return this;
      };
      NonRecordingSpan3.prototype.addLinks = function(_links) {
        return this;
      };
      NonRecordingSpan3.prototype.setStatus = function(_status) {
        return this;
      };
      NonRecordingSpan3.prototype.updateName = function(_name) {
        return this;
      };
      NonRecordingSpan3.prototype.end = function(_endTime) {
      };
      NonRecordingSpan3.prototype.isRecording = function() {
        return false;
      };
      NonRecordingSpan3.prototype.recordException = function(_exception, _time) {
      };
      return NonRecordingSpan3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/context-utils.js
  var SPAN_KEY2 = createContextKey2("OpenTelemetry Context Key SPAN");
  function getSpan2(context2) {
    return context2.getValue(SPAN_KEY2) || void 0;
  }
  function getActiveSpan2() {
    return getSpan2(ContextAPI2.getInstance().active());
  }
  function setSpan2(context2, span) {
    return context2.setValue(SPAN_KEY2, span);
  }
  function deleteSpan2(context2) {
    return context2.deleteValue(SPAN_KEY2);
  }
  function setSpanContext2(context2, spanContext) {
    return setSpan2(context2, new NonRecordingSpan2(spanContext));
  }
  function getSpanContext2(context2) {
    var _a2;
    return (_a2 = getSpan2(context2)) === null || _a2 === void 0 ? void 0 : _a2.spanContext();
  }

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/spancontext-utils.js
  var VALID_TRACEID_REGEX2 = /^([0-9a-f]{32})$/i;
  var VALID_SPANID_REGEX2 = /^[0-9a-f]{16}$/i;
  function isValidTraceId2(traceId) {
    return VALID_TRACEID_REGEX2.test(traceId) && traceId !== INVALID_TRACEID2;
  }
  function isValidSpanId2(spanId) {
    return VALID_SPANID_REGEX2.test(spanId) && spanId !== INVALID_SPANID2;
  }
  function isSpanContextValid2(spanContext) {
    return isValidTraceId2(spanContext.traceId) && isValidSpanId2(spanContext.spanId);
  }
  function wrapSpanContext2(spanContext) {
    return new NonRecordingSpan2(spanContext);
  }

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/NoopTracer.js
  var contextApi2 = ContextAPI2.getInstance();
  var NoopTracer2 = (
    /** @class */
    function() {
      function NoopTracer3() {
      }
      NoopTracer3.prototype.startSpan = function(name, options, context2) {
        if (context2 === void 0) {
          context2 = contextApi2.active();
        }
        var root = Boolean(options === null || options === void 0 ? void 0 : options.root);
        if (root) {
          return new NonRecordingSpan2();
        }
        var parentFromContext = context2 && getSpanContext2(context2);
        if (isSpanContext2(parentFromContext) && isSpanContextValid2(parentFromContext)) {
          return new NonRecordingSpan2(parentFromContext);
        } else {
          return new NonRecordingSpan2();
        }
      };
      NoopTracer3.prototype.startActiveSpan = function(name, arg2, arg3, arg4) {
        var opts;
        var ctx;
        var fn;
        if (arguments.length < 2) {
          return;
        } else if (arguments.length === 2) {
          fn = arg2;
        } else if (arguments.length === 3) {
          opts = arg2;
          fn = arg3;
        } else {
          opts = arg2;
          ctx = arg3;
          fn = arg4;
        }
        var parentContext = ctx !== null && ctx !== void 0 ? ctx : contextApi2.active();
        var span = this.startSpan(name, opts, parentContext);
        var contextWithSpanSet = setSpan2(parentContext, span);
        return contextApi2.with(contextWithSpanSet, fn, void 0, span);
      };
      return NoopTracer3;
    }()
  );
  function isSpanContext2(spanContext) {
    return typeof spanContext === "object" && typeof spanContext["spanId"] === "string" && typeof spanContext["traceId"] === "string" && typeof spanContext["traceFlags"] === "number";
  }

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/ProxyTracer.js
  var NOOP_TRACER2 = new NoopTracer2();
  var ProxyTracer2 = (
    /** @class */
    function() {
      function ProxyTracer3(_provider, name, version, options) {
        this._provider = _provider;
        this.name = name;
        this.version = version;
        this.options = options;
      }
      ProxyTracer3.prototype.startSpan = function(name, options, context2) {
        return this._getTracer().startSpan(name, options, context2);
      };
      ProxyTracer3.prototype.startActiveSpan = function(_name, _options, _context, _fn) {
        var tracer = this._getTracer();
        return Reflect.apply(tracer.startActiveSpan, tracer, arguments);
      };
      ProxyTracer3.prototype._getTracer = function() {
        if (this._delegate) {
          return this._delegate;
        }
        var tracer = this._provider.getDelegateTracer(this.name, this.version, this.options);
        if (!tracer) {
          return NOOP_TRACER2;
        }
        this._delegate = tracer;
        return this._delegate;
      };
      return ProxyTracer3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/NoopTracerProvider.js
  var NoopTracerProvider2 = (
    /** @class */
    function() {
      function NoopTracerProvider3() {
      }
      NoopTracerProvider3.prototype.getTracer = function(_name, _version, _options) {
        return new NoopTracer2();
      };
      return NoopTracerProvider3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace/ProxyTracerProvider.js
  var NOOP_TRACER_PROVIDER2 = new NoopTracerProvider2();
  var ProxyTracerProvider2 = (
    /** @class */
    function() {
      function ProxyTracerProvider3() {
      }
      ProxyTracerProvider3.prototype.getTracer = function(name, version, options) {
        var _a2;
        return (_a2 = this.getDelegateTracer(name, version, options)) !== null && _a2 !== void 0 ? _a2 : new ProxyTracer2(this, name, version, options);
      };
      ProxyTracerProvider3.prototype.getDelegate = function() {
        var _a2;
        return (_a2 = this._delegate) !== null && _a2 !== void 0 ? _a2 : NOOP_TRACER_PROVIDER2;
      };
      ProxyTracerProvider3.prototype.setDelegate = function(delegate) {
        this._delegate = delegate;
      };
      ProxyTracerProvider3.prototype.getDelegateTracer = function(name, version, options) {
        var _a2;
        return (_a2 = this._delegate) === null || _a2 === void 0 ? void 0 : _a2.getTracer(name, version, options);
      };
      return ProxyTracerProvider3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/api/trace.js
  var API_NAME8 = "trace";
  var TraceAPI2 = (
    /** @class */
    function() {
      function TraceAPI3() {
        this._proxyTracerProvider = new ProxyTracerProvider2();
        this.wrapSpanContext = wrapSpanContext2;
        this.isSpanContextValid = isSpanContextValid2;
        this.deleteSpan = deleteSpan2;
        this.getSpan = getSpan2;
        this.getActiveSpan = getActiveSpan2;
        this.getSpanContext = getSpanContext2;
        this.setSpan = setSpan2;
        this.setSpanContext = setSpanContext2;
      }
      TraceAPI3.getInstance = function() {
        if (!this._instance) {
          this._instance = new TraceAPI3();
        }
        return this._instance;
      };
      TraceAPI3.prototype.setGlobalTracerProvider = function(provider) {
        var success = registerGlobal2(API_NAME8, this._proxyTracerProvider, DiagAPI2.instance());
        if (success) {
          this._proxyTracerProvider.setDelegate(provider);
        }
        return success;
      };
      TraceAPI3.prototype.getTracerProvider = function() {
        return getGlobal2(API_NAME8) || this._proxyTracerProvider;
      };
      TraceAPI3.prototype.getTracer = function(name, version) {
        return this.getTracerProvider().getTracer(name, version);
      };
      TraceAPI3.prototype.disable = function() {
        unregisterGlobal2(API_NAME8, DiagAPI2.instance());
        this._proxyTracerProvider = new ProxyTracerProvider2();
      };
      return TraceAPI3;
    }()
  );

  // node_modules/@apexthirdparty/opentelemetry-api/build/esm/trace-api.js
  var trace2 = TraceAPI2.getInstance();

  // node_modules/@apexthirdparty/opentelemetry-instrumentation-xml-http-request/build/esnext/enums/EventNames.js
  var EventNames3;
  (function(EventNames4) {
    EventNames4["METHOD_OPEN"] = "open";
    EventNames4["METHOD_SEND"] = "send";
    EventNames4["EVENT_ABORT"] = "abort";
    EventNames4["EVENT_ERROR"] = "error";
    EventNames4["EVENT_LOAD"] = "loaded";
    EventNames4["EVENT_TIMEOUT"] = "timeout";
  })(EventNames3 || (EventNames3 = {}));

  // images/libraries/apex/telemetry/processors/RedwoodSpanProcessor.mjs
  var DOCUMENT_FETCH_SPAN_KEY = Symbol.for("documentFetchSpan");
  var PERFORMANCE_NAVIGATION_TIMING_KEY = Symbol.for("PerformanceNavigationTiming");
  var PERFORMANCE_RESOURCE_TIMING_KEY = Symbol.for("PerformanceResourceTiming");
  var REQUEST_KEY = Symbol.for("request");
  var RESPONSE_OR_ERROR_KEY = Symbol.for("responseOrError");
  var XHR_KEY = Symbol.for("xhr");
  var RedwoodSpanProcessor = class {
    constructor(config) {
      const { spanProcessor, applyCustomAttributesOnSpan } = config;
      this._spanProcessor = spanProcessor;
      this._applyCustomAttributesOnSpan = applyCustomAttributesOnSpan;
      this._instrumentationMap = /* @__PURE__ */ new Map([
        ["@opentelemetry/instrumentation-document-load", { filter: ["documentFetch"], onStart: this._onStartDocumentLoad, onEnd: this._onEndDocumentLoad }],
        ["@opentelemetry/instrumentation-fetch", { filter: [], onEnd: this._onEndFetch }],
        ["@opentelemetry/instrumentation-xml-http-request", { filter: [], onEnd: this._onEndXHR }],
        ["@opentelemetry/instrumentation-user-interaction", { filter: [], onEnd: this._onEndUserInteraction }],
        ["@apex/instrumentation-user-interaction", { filter: [], onEnd: this._onEndUserInteraction }]
      ]);
    }
    /**
     * Set performance resource timing attributes on the provided span attributes reference.
     * PerformanceNavigationTiming extends PerformanceResourceTiming, so both are supported.
     *
     * @param {SpanAttributes} attributes
     * @param {PerformanceResourceTiming} performanceEntry
     */
    _setPerformanceResourceTimingAttributes(attributes, performanceEntry) {
      attributes["http.first_byte_time"] = performanceEntry.responseStart;
      attributes["http.response.decoded_size"] = performanceEntry.decodedBodySize || void 0;
      attributes["http.response.encoded_size"] = performanceEntry.encodedBodySize || void 0;
      attributes["http.response.size"] = performanceEntry.transferSize || void 0;
    }
    /**
     * Set screen and viewport attributes on the provided span attributes reference.
     *
     * @param {SpanAttributes} attributes
     */
    _setScreenAndViewportAttributes(attributes) {
      attributes["screen.height"] = window.screen.height;
      attributes["screen.orientationType"] = window.screen.orientation.type;
      attributes["screen.width"] = window.screen.width;
      attributes["viewport.height"] = window.top.visualViewport.height;
      attributes["viewport.width"] = window.top.visualViewport.width;
    }
    /**
     * Debugging method to sort an object's keys; used to read span attributes more easily
     *
     * @param {{}} object
     * @returns
     */
    _sortObjectByKeys(object) {
      const entries = Object.entries(object);
      const sorted = entries.toSorted((a, b) => a[0] === b[0] ? 0 : a[0] < b[0] ? -1 : 1);
      const newObj = Object.fromEntries(sorted);
      return JSON.stringify(newObj, null, 2);
    }
    /**
     * Truncates string values that exceed the maximum attribute length (1024)
     *
     * @param {String} value
     * @returns truncated string
     */
    _truncateStringValue(value) {
      const MAX_ATTRIBUTE_LENGTH = 1024;
      return value.length > MAX_ATTRIBUTE_LENGTH ? value.substring(0, MAX_ATTRIBUTE_LENGTH) : value;
    }
    /**
     * onStart handler for events instrumented by the document load plugin.
     *
     * Used to add some additional properties for later processing in the onEnd handler.
     *
     * @param {Span} span
     * @param {Context} context
     */
    _onStartDocumentLoad(span, context2) {
      const { name } = span;
      if (name === "documentLoad") {
        const navigationTiming = window.performance.getEntriesByType("navigation")?.[0];
        if (navigationTiming) {
          Object.defineProperty(span, PERFORMANCE_NAVIGATION_TIMING_KEY, {
            value: navigationTiming,
            configurable: false,
            enumerable: false,
            writable: false
          });
        }
      } else if (name === "documentFetch" && context2) {
        const parentSpan = trace2.getSpan(context2);
        if (parentSpan) {
          Object.defineProperty(parentSpan, DOCUMENT_FETCH_SPAN_KEY, {
            value: span,
            configurable: false,
            enumerable: false,
            writable: false
          });
        }
      } else if (name === "resourceFetch") {
      }
    }
    /**
     * onEnd handler for events instrumented by the document load plugin.
     *
     * @param {Span} span
     */
    _onEndDocumentLoad(span) {
      const { name, attributes } = span;
      if (name === "documentLoad") {
        span.name = "navigation";
        const navigationTiming = span[PERFORMANCE_NAVIGATION_TIMING_KEY];
        if (navigationTiming) {
          this._setPerformanceResourceTimingAttributes(attributes, navigationTiming);
          attributes["nav.domcomplete_time"] = navigationTiming.domComplete;
        } else {
          const documentFetch = span[DOCUMENT_FETCH_SPAN_KEY];
          if (documentFetch) {
            attributes["http.response.encoded_size"] = documentFetch.attributes["http.response_content_length"] || void 0;
            attributes["http.response.decoded_size"] = documentFetch.attributes["http.response_content_length_uncompressed"] || attributes["http.response.encoded_size"];
          }
          attributes["nav.domcomplete_time"] = void 0;
        }
        attributes["nav.char_set"] = document.characterSet;
        attributes["nav.compat_mode"] = document.compatMode;
        attributes["nav.content_type"] = document.contentType;
        attributes["nav.referrer"] = document.referrer || void 0;
        this._setScreenAndViewportAttributes(attributes);
      } else if (name === "documentFetch") {
      } else if (name === "resourceFetch") {
        span.name = "resource";
        const resourceTiming = span[PERFORMANCE_RESOURCE_TIMING_KEY];
        if (resourceTiming) {
          this._setPerformanceResourceTimingAttributes(attributes, resourceTiming);
          delete attributes["http.response_content_length"];
          delete attributes["http.response_content_length_uncompressed"];
        }
      }
    }
    /**
     * onEnd handler for events instrumented by the fetch plugin.
     *
     * @param {Span} span
     */
    _onEndFetch(span) {
      span.name = "fetch";
      const { attributes } = span;
      const request = span[REQUEST_KEY];
      if (request) {
        const { body } = request;
        if (body) {
          let contentLength = request.headers?.["Content-Length"];
          if (!contentLength) {
            contentLength = body.byteLength ?? body.size ?? body.length;
          }
          attributes["http.request.size"] = contentLength || void 0;
        }
      }
      const responseOrError = span[RESPONSE_OR_ERROR_KEY];
      if (responseOrError) {
        if (responseOrError instanceof Response) {
          attributes.error = false;
          const contentType = responseOrError.headers?.get("Content-Type") || void 0;
          attributes["http.response.content_type"] = contentType;
          const url = span.attributes["http.url"];
          const resourceTiming = window.performance.getEntriesByType("resource").findLast((entry) => entry.initiatorType === "fetch" && entry.name === url);
          if (resourceTiming) {
            this._setPerformanceResourceTimingAttributes(attributes, resourceTiming);
          } else {
            attributes["http.response.encoded_size"] = attributes["http.response_content_length"] || void 0;
            attributes["http.response.decoded_size"] = attributes["http.response_content_length_uncompressed"] || attributes["http.response.encoded_size"];
          }
        } else {
          attributes.error = true;
          if (responseOrError instanceof Error) {
            attributes["error.kind"] = responseOrError.name || "unknownError";
            attributes["error.message"] = responseOrError.message || void 0;
            const { stack } = responseOrError;
            if (stack && typeof stack === "string") {
              attributes["error.stack"] = this._truncateStringValue(stack);
            }
            delete attributes["http.status_code"];
            delete attributes["http.status_text"];
          }
        }
      }
      delete attributes["http.host"];
      delete attributes["http.response_content_length"];
      delete attributes["http.response_content_length_uncompressed"];
      delete attributes["http.scheme"];
      this._setScreenAndViewportAttributes(attributes);
    }
    /**
     * onEnd handler for events instrumented by the XHR plugin.
     *
     * @param {Span} span
     */
    _onEndXHR(span) {
      span.name = "fetch";
      const { attributes } = span;
      const xhr = span[XHR_KEY];
      if (xhr) {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status) {
          attributes.error = false;
          const responseContentType = xhr.getResponseHeader("Content-Type");
          attributes["http.response.content_type"] = responseContentType || void 0;
          const url = span.attributes["http.url"];
          const resourceTiming = window.performance.getEntriesByType("resource").findLast((entry) => entry.initiatorType === "xmlhttprequest" && entry.name === url);
          if (resourceTiming) {
            this._setPerformanceResourceTimingAttributes(attributes, resourceTiming);
          } else {
          }
        } else {
          attributes.error = true;
          let errorKind = void 0;
          let errorMessage = void 0;
          const lastEventName = span.events[span.events.length - 1].name;
          if (lastEventName === EventNames3.EVENT_ABORT) {
            errorKind = "AbortError";
            errorMessage = "Request was aborted.";
          } else if (lastEventName === EventNames3.EVENT_TIMEOUT) {
            errorKind = "TimeoutError";
            errorMessage = "Request timed out.";
          } else {
            errorKind = "UnknownError";
            errorMessage = "Request failed with an unknown error.";
          }
          attributes["error.kind"] = errorKind;
          attributes["error.message"] = errorMessage;
          delete attributes["http.status_code"];
          delete attributes["http.status_text"];
        }
      }
      delete attributes["http.host"];
      delete attributes["http.response_content_length"];
      delete attributes["http.response_content_length_uncompressed"];
      delete attributes["http.scheme"];
      this._setScreenAndViewportAttributes(attributes);
    }
    /**
     * onEnd handler for events instrumented by the user interaction plugin.
     *
     * @param {Span} span
     */
    _onEndUserInteraction(span) {
      const { attributes } = span;
      if (!attributes["container.event"]) {
        attributes["container.event"] = span.name;
      }
      span.name = "componentEvent";
      this._setScreenAndViewportAttributes(attributes);
    }
    /**
     * Override for span processor method that executes on a forced tracer flush.
     *
     * @returns {Promise<void>}
     */
    forceFlush() {
      return this._spanProcessor.forceFlush();
    }
    /**
     * Override for span processor method that executes on span start.
     * Span is recording and can be updated with `setAttribute()`.
     *
     * @param {Span} span
     * @param {Context} context
     */
    onStart(span, context2) {
      const { instrumentationLibrary } = span;
      if (instrumentationLibrary) {
        const { name: instrumentationName } = instrumentationLibrary;
        const instrumentationEntry = this._instrumentationMap.get(instrumentationName);
        if (instrumentationEntry) {
          instrumentationEntry.onStart?.call(this, span, context2);
          if (instrumentationEntry.filter?.includes(span.name)) {
            return;
          }
        }
      }
      this._applyCustomAttributesOnSpan?.(span);
      this._spanProcessor.onStart(span, context2);
    }
    /**
     * Override for span processor method that executes on span end.
     * Span is no longer recording and must be updated with direct writes,
     * as `setAttribute()` becomes no-op.
     *
     * @param {ReadableSpan} span
     */
    onEnd(span) {
      const { attributes } = span;
      const { instrumentationLibrary } = span;
      if (instrumentationLibrary) {
        const { name: instrumentationName } = instrumentationLibrary;
        attributes.component = instrumentationName;
        const instrumentationEntry = this._instrumentationMap.get(instrumentationName);
        if (instrumentationEntry) {
          if (instrumentationEntry.filter?.includes(span.name)) {
            return;
          }
          instrumentationEntry.onEnd?.call(this, span);
        }
      }
      const httpUrl = attributes["http.url"];
      if (httpUrl) {
        const cleanUrl = new URL(httpUrl);
        cleanUrl.username = "";
        cleanUrl.password = "";
        cleanUrl.search = "";
        attributes["http.url"] = cleanUrl.toString();
      }
      delete attributes["http.user_agent"];
      this._spanProcessor.onEnd(span);
    }
    /**
     * Override for span processor method that executes on tracer shutdown.
     *
     * @returns {Promise<void>}
     */
    shutdown() {
      return this._spanProcessor.shutdown();
    }
  };

  // images/libraries/apex/telemetry/plugins/UserInteractionInstrumentation.mjs
  var UserInteractionInstrumentation = class extends InstrumentationBase3 {
    constructor(config) {
      super("@apex/instrumentation-user-interaction", "15.1.0", config);
      this._boundEventHandler = void 0;
    }
    /**
     * Generate a selector for the given element. If the element
     * has an ID, that will be returned. Otherwise, it will
     * return the element's tag and concatenated class list.
     *
     * @param {HTMLElement} element
     * @returns {string} selector
     */
    _getSelectorForElement(element) {
      let selector = element.id ? `#${element.id}` : "";
      if (!selector) {
        const classes = element.classList.length ? `.${Array.from(element.classList).join(".")}` : "";
        selector = `${element.tagName.toLowerCase()}${classes}`;
      }
      return selector;
    }
    /**
     * Generate a selector chain for the given element, where
     * the root is an element with an ID or the body.
     *
     * @param {HTMLElement} element
     * @returns {string} selector chain
     */
    _getSelectorChainForElement(element) {
      const selectors = [];
      let current = element;
      while (current) {
        selectors.unshift(this._getSelectorForElement(current));
        if (current.id || current === document.body) {
          break;
        }
        current = current.parentElement;
      }
      return selectors.join(" > ");
    }
    /**
     * Get the Redwood trigger attributes for a given UI event.
     * This will return attributes in the Redwood format.
     * If desired, this could return in the OTel format instead, and
     * a span processor could do the transformation to Redwood.
     *
     * @param {UIEvent} event
     * @returns {object} trigger attributes
     */
    _getTriggerAttributesForEvent(event) {
      const { target, type } = event;
      const label = target.closest("[data-otel-label]:not(html)")?.dataset?.otelLabel;
      return {
        "trigger.label": label,
        "trigger.tag_name": target.tagName.toLowerCase(),
        "trigger.target": this._getSelectorChainForElement(target),
        "trigger.type": type
      };
    }
    /**
     * Handle the given UI event;
     * - filter synthetic clicks
     * - generate the appropriate span attributes
     * - start the span
     * - queue the span close for later
     *
     * See
     * https://w3c.github.io/pointerevents/#pointerevent-interface
     * https://w3c.github.io/pointerevents/#event-attributes
     *
     * @param {UIEvent} event
     */
    _handleEvent(event) {
      const { target } = event;
      if (target && target instanceof HTMLElement) {
        const { pointerId, pointerType } = event;
        if (pointerId !== -1 && pointerType !== "") {
          const trigger = this._getTriggerAttributesForEvent(event);
          const span = this.tracer.startSpan("click", {
            attributes: {
              "container.event": "click",
              // TODO -- more descriptive name?
              ...trigger
            }
          });
          const tempHandler = () => {
            queueMicrotask(() => {
              span.end();
            });
          };
          target.addEventListener("click", tempHandler, { once: true, passive: true });
        }
      }
    }
    /**
     * Enable the instrumentation plugin;
     * add the event listener if it doesn't already exist.
     */
    enable() {
      if (!this._boundEventHandler) {
        const boundEventHandler = this._handleEvent.bind(this);
        document.addEventListener("click", boundEventHandler, { capture: true, passive: true });
        this._boundEventHandler = boundEventHandler;
      }
    }
    /**
     * Disable the instrumentation plugin;
     * clean up the event listener if it exists.
     */
    disable() {
      if (this._boundEventHandler) {
        document.removeEventListener("click", this._boundEventHandler, { capture: true });
        this._boundEventHandler = void 0;
      }
    }
  };

  // images/libraries/apex/telemetry/handlers/NoopRestHookHandler.mjs
  var NoopRestHookHandler = class {
    handlePreFetchHook() {
      return Promise.resolve();
    }
    handleRequestHook(request) {
      return Promise.resolve(request);
    }
    handleResponseHook(response) {
      return Promise.resolve(response);
    }
    handlePostFetchHook() {
      return Promise.resolve();
    }
    handlePostFetchErrorHook() {
      return Promise.resolve();
    }
  };

  // images/libraries/apex/telemetry/handlers/TokenRelayHookHandler.mjs
  var TokenRelayHookHandler = class extends NoopRestHookHandler {
    constructor(tokenRelayUrl) {
      super();
      this.tokenRelayUrl = tokenRelayUrl;
      this.currentToken = null;
      this.currentTokenExpiresAt = null;
    }
    handleRequestHook(request) {
      if (request.url === this.tokenRelayUrl) {
        return Promise.resolve(request);
      }
      if (this.currentToken) {
        if (this.currentTokenExpiresAt <= Date.now()) {
          this.currentToken = null;
        } else {
          let newReq = request.clone();
          newReq.headers.set("Authorization", `Bearer ${this.currentToken.access_token}`);
          return Promise.resolve(newReq);
        }
      }
      return fetch(this.tokenRelayUrl, {
        keepalive: true
        // PATCHED
      }).then((rsp) => {
        if (rsp.ok) {
          return rsp.json().then((json) => {
            if (json.access_token) {
              this.currentToken = json;
              this.currentTokenExpiresAt = Date.now() + this.currentToken.expires_in * 1e3;
              let newReq = request.clone();
              newReq.headers.set("Authorization", `Bearer ${this.currentToken.access_token}`);
              return Promise.resolve(newReq);
            } else {
              return Promise.reject(new Error("Invalid token response: " + JSON.stringify(json)));
            }
          }).catch(() => {
            return Promise.reject(new Error("Invalid JSON response"));
          });
        } else {
          return Promise.reject(new Error("Token relay failed: " + rsp.status + " " + rsp.statusText));
        }
      }).catch((err2) => {
        return Promise.reject(err2);
      });
    }
  };

  // images/libraries/apex/telemetry/telemetry.mjs
  (async () => {
    const getURLs = () => {
      let clsUrl2 = apex.telemetry.clsUrl;
      try {
        void new URL(clsUrl2);
      } catch (error) {
        apex.debug.error(`CLS ${clsUrl2} is invalid or missing`, error);
        clsUrl2 = void 0;
      }
      let tokenRelayUrl2 = apex.telemetry.tokenRelayUrl;
      try {
        void new URL(tokenRelayUrl2);
      } catch (error) {
        apex.debug.error(`Token ${tokenRelayUrl2} is invalid or missing`, error);
        tokenRelayUrl2 = void 0;
      }
      return { clsUrl: clsUrl2, tokenRelayUrl: tokenRelayUrl2 };
    };
    const { clsUrl, tokenRelayUrl } = getURLs();
    if (clsUrl && tokenRelayUrl) {
      const hashValue = async (str) => {
        let result = void 0;
        try {
          const encoded = new TextEncoder().encode(str);
          const digest = await window.crypto.subtle.digest("SHA-1", encoded);
          const hash = Array.from(new Uint8Array(digest));
          result = hash.map((b) => b.toString(16).padStart(2, "0")).join("");
        } catch (e) {
        }
        return result;
      };
      const userGUID = await hashValue(apex.env.APP_USER);
      const sanitizeContainerId = (containerId) => {
        let sanitizedId = void 0;
        if (containerId) {
          sanitizedId = containerId.toLowerCase();
          sanitizedId = encodeURIComponent(sanitizedId);
          sanitizedId = sanitizedId.replace(/[~*'()]/g, (char) => {
            return `%${char.charCodeAt(0).toString(16).toUpperCase()}`;
          });
          sanitizedId = sanitizedId.replace(/%(23|2B|3D|3F|40)/g, (_str, hex) => {
            return String.fromCharCode(parseInt(hex, 16));
          });
        }
        return sanitizedId;
      };
      const getSpanAttributes = () => {
        const spanAttributes2 = {};
        const pageAlias = sanitizeContainerId(document.querySelector('meta[name="app-page-alias"]')?.content);
        let parentPageAlias = void 0;
        if (window !== window.parent) {
          parentPageAlias = sanitizeContainerId(window.parent.document.querySelector('meta[name="app-page-alias"]')?.content);
        }
        const containerPath = [parentPageAlias, pageAlias].filter((entry) => !!entry).join("/") || void 0;
        spanAttributes2["container.id"] = pageAlias;
        spanAttributes2["container.parent_id"] = parentPageAlias;
        spanAttributes2["container.path"] = containerPath;
        spanAttributes2["container.type"] = "Page";
        spanAttributes2["customer.id"] = document.querySelector('meta[name="app-tenant-id"]')?.content;
        spanAttributes2["environment.id"] = window.location.hostname;
        spanAttributes2["platform.version"] = apex.redwood?.version || apex.env.APEX_VERSION;
        const appAlias = document.querySelector('meta[name="app-alias"]')?.content;
        spanAttributes2["product.name"] = appAlias;
        spanAttributes2["product.family"] = apex.telemetry.productFamily;
        spanAttributes2["product.version"] = document.querySelector('meta[name="app-version"]')?.content;
        const sessionIdSuffix = appAlias ? `_${appAlias}` : "";
        spanAttributes2.session_id = `${apex.env.APP_SESSION}${sessionIdSuffix}`;
        spanAttributes2["user.guid"] = userGUID;
        return spanAttributes2;
      };
      const spanAttributes = getSpanAttributes();
      const setSpanAttributes = (span) => {
        span.setAttributes(spanAttributes);
      };
      const clsTokenRelayHandler = new TokenRelayHookHandler(tokenRelayUrl);
      window.clsFetch = window.fetch;
      window.fetch = async (req, init) => {
        const url = req.url || req;
        if (url === clsUrl) {
          let request = new Request(req, init);
          request = await clsTokenRelayHandler.handleRequestHook(request);
          return window.clsFetch(request);
        } else {
          return window.clsFetch(req, init);
        }
      };
      const provider = new WebTracerProvider();
      let spanProcessor = new AutoFlushBatchSpanProcessor(
        new ClsExporter({
          endpoint: clsUrl,
          compress: DebugFlags.isClsCompressionEnabled(),
          getExportHeaders: () => ({
            "X-ORCL-CLS-APP-INFO": spanAttributes["product.name"],
            "X-ORCL-CLS-CLIENT-INFO": spanAttributes["platform.version"]
          })
        }),
        {
          scheduledDelayMillis: 15e3
        }
      );
      if (DebugFlags.isConsoleExporterEnabled()) {
        spanProcessor = new MultiSpanProcessor2([
          spanProcessor,
          new ContextProviderSpanProcessor({
            spanProcessor: new SimpleSpanProcessor(
              new ConsoleSpanExporter()
            )
          })
        ]);
      }
      provider.addSpanProcessor(
        new ContextProviderSpanProcessor({
          spanProcessor: new RedwoodSpanProcessor({
            spanProcessor,
            applyCustomAttributesOnSpan: setSpanAttributes
          })
        })
      );
      provider.register({
        contextManager: new StackContextManager()
      });
      const ignoreUrls = [clsUrl, tokenRelayUrl];
      registerInstrumentations({
        instrumentations: [
          // Instrumentation for capturing document load and resource fetch timings
          new DocumentLoadInstrumentation({
            applyCustomAttributesOnSpan: {
              resourceFetch: (span, performanceResourceTiming) => {
                if (performanceResourceTiming) {
                  Object.defineProperty(span, PERFORMANCE_RESOURCE_TIMING_KEY, {
                    value: performanceResourceTiming,
                    configurable: false,
                    enumerable: false,
                    writable: false
                  });
                }
              }
            }
          }),
          // instrumentation for requests via fetch
          new FetchInstrumentation({
            ignoreUrls,
            applyCustomAttributesOnSpan: (span, request, responseOrError) => {
              Object.defineProperty(span, REQUEST_KEY, {
                value: request,
                configurable: false,
                enumerable: false,
                writable: false
              });
              Object.defineProperty(span, RESPONSE_OR_ERROR_KEY, {
                value: responseOrError,
                configurable: false,
                enumerable: false,
                writable: false
              });
            }
          }),
          // Instrumentation for capturing user interactions (e.g., clicks)
          new UserInteractionInstrumentation(),
          // instrumentation for requests via XHR
          new XMLHttpRequestInstrumentation({
            ignoreUrls,
            applyCustomAttributesOnSpan: (span, xhr) => {
              Object.defineProperty(span, XHR_KEY, {
                value: xhr,
                configurable: false,
                enumerable: false,
                writable: false
              });
            }
          })
        ]
      });
    }
  })();
})();
/*! Bundled license information:

@apexthirdparty/pako/dist/pako.esm.mjs:
  (*! pako 2.1.0 https://github.com/nodeca/pako @license (MIT AND Zlib) *)
*/
