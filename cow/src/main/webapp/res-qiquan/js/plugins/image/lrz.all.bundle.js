!function(e){function t(r){if(n[r])return n[r].exports;var i=n[r]={exports:{},id:r,loaded:!1};return e[r].call(i.exports,i,i.exports,t),i.loaded=!0,i.exports}var n={};return t.m=e,t.c=n,t.p="",t(0)}([function(e,t,n){n(5),n(6),e.exports=n(7)},function(e,t,n){(function(t){!function(n){function r(e,t){return function(){e.apply(t,arguments)}}function i(e){if("object"!=typeof this)throw new TypeError("Promises must be constructed via new");if("function"!=typeof e)throw new TypeError("not a function");this._state=null,this._value=null,this._deferreds=[],l(e,r(a,this),r(s,this))}function o(e){var t=this;return null===this._state?void this._deferreds.push(e):void f(function(){var n=t._state?e.onFulfilled:e.onRejected;if(null===n)return void(t._state?e.resolve:e.reject)(t._value);var r;try{r=n(t._value)}catch(i){return void e.reject(i)}e.resolve(r)})}function a(e){try{if(e===this)throw new TypeError("A promise cannot be resolved with itself.");if(e&&("object"==typeof e||"function"==typeof e)){var t=e.then;if("function"==typeof t)return void l(r(t,e),r(a,this),r(s,this))}this._state=!0,this._value=e,c.call(this)}catch(n){s.call(this,n)}}function s(e){this._state=!1,this._value=e,c.call(this)}function c(){for(var e=0,t=this._deferreds.length;t>e;e++)o.call(this,this._deferreds[e]);this._deferreds=null}function u(e,t,n,r){this.onFulfilled="function"==typeof e?e:null,this.onRejected="function"==typeof t?t:null,this.resolve=n,this.reject=r}function l(e,t,n){var r=!1;try{e(function(e){r||(r=!0,t(e))},function(e){r||(r=!0,n(e))})}catch(i){if(r)return;r=!0,n(i)}}var f="function"==typeof t&&t||function(e){setTimeout(e,1)},h=Array.isArray||function(e){return"[object Array]"===Object.prototype.toString.call(e)};i.prototype["catch"]=function(e){return this.then(null,e)},i.prototype.then=function(e,t){var n=this;return new i(function(r,i){o.call(n,new u(e,t,r,i))})},i.all=function(){var e=Array.prototype.slice.call(1===arguments.length&&h(arguments[0])?arguments[0]:arguments);return new i(function(t,n){function r(o,a){try{if(a&&("object"==typeof a||"function"==typeof a)){var s=a.then;if("function"==typeof s)return void s.call(a,function(e){r(o,e)},n)}e[o]=a,0===--i&&t(e)}catch(c){n(c)}}if(0===e.length)return t([]);for(var i=e.length,o=0;o<e.length;o++)r(o,e[o])})},i.resolve=function(e){return e&&"object"==typeof e&&e.constructor===i?e:new i(function(t){t(e)})},i.reject=function(e){return new i(function(t,n){n(e)})},i.race=function(e){return new i(function(t,n){for(var r=0,i=e.length;i>r;r++)e[r].then(t,n)})},i._setImmediateFn=function(e){f=e},i.prototype.always=function(e){var t=this.constructor;return this.then(function(n){return t.resolve(e()).then(function(){return n})},function(n){return t.resolve(e()).then(function(){throw n})})},"undefined"!=typeof e&&e.exports?e.exports=i:n.Promise||(n.Promise=i)}(this)}).call(t,n(2).setImmediate)},function(e,t,n){(function(e,r){function i(e,t){this._id=e,this._clearFn=t}var o=n(3).nextTick,a=Function.prototype.apply,s=Array.prototype.slice,c={},u=0;t.setTimeout=function(){return new i(a.call(setTimeout,window,arguments),clearTimeout)},t.setInterval=function(){return new i(a.call(setInterval,window,arguments),clearInterval)},t.clearTimeout=t.clearInterval=function(e){e.close()},i.prototype.unref=i.prototype.ref=function(){},i.prototype.close=function(){this._clearFn.call(window,this._id)},t.enroll=function(e,t){clearTimeout(e._idleTimeoutId),e._idleTimeout=t},t.unenroll=function(e){clearTimeout(e._idleTimeoutId),e._idleTimeout=-1},t._unrefActive=t.active=function(e){clearTimeout(e._idleTimeoutId);var t=e._idleTimeout;t>=0&&(e._idleTimeoutId=setTimeout(function(){e._onTimeout&&e._onTimeout()},t))},t.setImmediate="function"==typeof e?e:function(e){var n=u++,r=arguments.length<2?!1:s.call(arguments,1);return c[n]=!0,o(function(){c[n]&&(r?e.apply(null,r):e.call(null),t.clearImmediate(n))}),n},t.clearImmediate="function"==typeof r?r:function(e){delete c[e]}}).call(t,n(2).setImmediate,n(2).clearImmediate)},function(e,t){function n(){u=!1,a.length?c=a.concat(c):l=-1,c.length&&r()}function r(){if(!u){var e=setTimeout(n);u=!0;for(var t=c.length;t;){for(a=c,c=[];++l<t;)a&&a[l].run();l=-1,t=c.length}a=null,u=!1,clearTimeout(e)}}function i(e,t){this.fun=e,this.array=t}function o(){}var a,s=e.exports={},c=[],u=!1,l=-1;s.nextTick=function(e){var t=new Array(arguments.length-1);if(arguments.length>1)for(var n=1;n<arguments.length;n++)t[n-1]=arguments[n];c.push(new i(e,t)),1!==c.length||u||setTimeout(r,0)},i.prototype.run=function(){this.fun.apply(null,this.array)},s.title="browser",s.browser=!0,s.env={},s.argv=[],s.version="",s.versions={},s.on=o,s.addListener=o,s.once=o,s.off=o,s.removeListener=o,s.removeAllListeners=o,s.emit=o,s.binding=function(e){throw new Error("process.binding is not supported")},s.cwd=function(){return"/"},s.chdir=function(e){throw new Error("process.chdir is not supported")},s.umask=function(){return 0}},function(e,t,n){var r,i;(function(){function n(e){return!!e.exifdata}function o(e,t){t=t||e.match(/^data\:([^\;]+)\;base64,/im)[1]||"",e=e.replace(/^data\:([^\;]+)\;base64,/gim,"");for(var n=atob(e),r=n.length,i=new ArrayBuffer(r),o=new Uint8Array(i),a=0;r>a;a++)o[a]=n.charCodeAt(a);return i}function a(e,t){var n=new XMLHttpRequest;n.open("GET",e,!0),n.responseType="blob",n.onload=function(e){(200==this.status||0===this.status)&&t(this.response)},n.send()}function s(e,t){function n(n){var r=c(n),i=u(n);e.exifdata=r||{},e.iptcdata=i||{},t&&t.call(e)}if(e.src)if(/^data\:/i.test(e.src)){var r=o(e.src);n(r)}else if(/^blob\:/i.test(e.src)){var i=new FileReader;i.onload=function(e){n(e.target.result)},a(e.src,function(e){i.readAsArrayBuffer(e)})}else{var s=new XMLHttpRequest;s.onload=function(){200==this.status||0===this.status?n(s.response):t(new Error("Could not load image")),s=null},s.open("GET",e.src,!0),s.responseType="arraybuffer",s.send(null)}else if(window.FileReader&&(e instanceof window.Blob||e instanceof window.File)){var i=new FileReader;i.onload=function(e){m&&console.log("Got file of length "+e.target.result.byteLength),n(e.target.result)},i.readAsArrayBuffer(e)}}function c(e){var t=new DataView(e);if(m&&console.log("Got file of length "+e.byteLength),255!=t.getUint8(0)||216!=t.getUint8(1))return m&&console.log("Not a valid JPEG"),!1;for(var n,r=2,i=e.byteLength;i>r;){if(255!=t.getUint8(r))return m&&console.log("Not a valid marker at offset "+r+", found: "+t.getUint8(r)),!1;if(n=t.getUint8(r+1),m&&console.log(n),225==n)return m&&console.log("Found 0xFFE1 marker"),g(t,r+4,t.getUint16(r+2)-2);r+=2+t.getUint16(r+2)}}function u(e){var t=new DataView(e);if(m&&console.log("Got file of length "+e.byteLength),255!=t.getUint8(0)||216!=t.getUint8(1))return m&&console.log("Not a valid JPEG"),!1;for(var n=2,r=e.byteLength,i=function(e,t){return 56===e.getUint8(t)&&66===e.getUint8(t+1)&&73===e.getUint8(t+2)&&77===e.getUint8(t+3)&&4===e.getUint8(t+4)&&4===e.getUint8(t+5)};r>n;){if(i(t,n)){var o=t.getUint8(n+7);o%2!==0&&(o+=1),0===o&&(o=4);var a=n+8+o,s=t.getUint16(n+6+o);return l(e,a,s)}n++}}function l(e,t,n){for(var r,i,o,a,s,c=new DataView(e),u={},l=t;t+n>l;)28===c.getUint8(l)&&2===c.getUint8(l+1)&&(a=c.getUint8(l+2),a in b&&(o=c.getInt16(l+3),s=o+5,i=b[a],r=d(c,l+5,o),u.hasOwnProperty(i)?u[i]instanceof Array?u[i].push(r):u[i]=[u[i],r]:u[i]=r)),l++;return u}function f(e,t,n,r,i){var o,a,s,c=e.getUint16(n,!i),u={};for(s=0;c>s;s++)o=n+12*s+2,a=r[e.getUint16(o,!i)],!a&&m&&console.log("Unknown tag: "+e.getUint16(o,!i)),u[a]=h(e,o,t,n,i);return u}function h(e,t,n,r,i){var o,a,s,c,u,l,f=e.getUint16(t+2,!i),h=e.getUint32(t+4,!i),g=e.getUint32(t+8,!i)+n;switch(f){case 1:case 7:if(1==h)return e.getUint8(t+8,!i);for(o=h>4?g:t+8,a=[],c=0;h>c;c++)a[c]=e.getUint8(o+c);return a;case 2:return o=h>4?g:t+8,d(e,o,h-1);case 3:if(1==h)return e.getUint16(t+8,!i);for(o=h>2?g:t+8,a=[],c=0;h>c;c++)a[c]=e.getUint16(o+2*c,!i);return a;case 4:if(1==h)return e.getUint32(t+8,!i);for(a=[],c=0;h>c;c++)a[c]=e.getUint32(g+4*c,!i);return a;case 5:if(1==h)return u=e.getUint32(g,!i),l=e.getUint32(g+4,!i),s=new Number(u/l),s.numerator=u,s.denominator=l,s;for(a=[],c=0;h>c;c++)u=e.getUint32(g+8*c,!i),l=e.getUint32(g+4+8*c,!i),a[c]=new Number(u/l),a[c].numerator=u,a[c].denominator=l;return a;case 9:if(1==h)return e.getInt32(t+8,!i);for(a=[],c=0;h>c;c++)a[c]=e.getInt32(g+4*c,!i);return a;case 10:if(1==h)return e.getInt32(g,!i)/e.getInt32(g+4,!i);for(a=[],c=0;h>c;c++)a[c]=e.getInt32(g+8*c,!i)/e.getInt32(g+4+8*c,!i);return a}}function d(e,t,n){var r,i="";for(r=t;t+n>r;r++)i+=String.fromCharCode(e.getUint8(r));return i}function g(e,t){if("Exif"!=d(e,t,4))return m&&console.log("Not valid EXIF data! "+d(e,t,4)),!1;var n,r,i,o,a,s=t+6;if(18761==e.getUint16(s))n=!1;else{if(19789!=e.getUint16(s))return m&&console.log("Not valid TIFF data! (no 0x4949 or 0x4D4D)"),!1;n=!0}if(42!=e.getUint16(s+2,!n))return m&&console.log("Not valid TIFF data! (no 0x002A)"),!1;var c=e.getUint32(s+4,!n);if(8>c)return m&&console.log("Not valid TIFF data! (First offset less than 8)",e.getUint32(s+4,!n)),!1;if(r=f(e,s,s+c,v,n),r.ExifIFDPointer){o=f(e,s,s+r.ExifIFDPointer,w,n);for(i in o){switch(i){case"LightSource":case"Flash":case"MeteringMode":case"ExposureProgram":case"SensingMethod":case"SceneCaptureType":case"SceneType":case"CustomRendered":case"WhiteBalance":case"GainControl":case"Contrast":case"Saturation":case"Sharpness":case"SubjectDistanceRange":case"FileSource":o[i]=S[i][o[i]];break;case"ExifVersion":case"FlashpixVersion":o[i]=String.fromCharCode(o[i][0],o[i][1],o[i][2],o[i][3]);break;case"ComponentsConfiguration":o[i]=S.Components[o[i][0]]+S.Components[o[i][1]]+S.Components[o[i][2]]+S.Components[o[i][3]]}r[i]=o[i]}}if(r.GPSInfoIFDPointer){a=f(e,s,s+r.GPSInfoIFDPointer,y,n);for(i in a){switch(i){case"GPSVersionID":a[i]=a[i][0]+"."+a[i][1]+"."+a[i][2]+"."+a[i][3]}r[i]=a[i]}}return r}var m=!1,p=function(e){return e instanceof p?e:this instanceof p?void(this.EXIFwrapped=e):new p(e)};"undefined"!=typeof e&&e.exports&&(t=e.exports=p),t.EXIF=p;var w=p.Tags={36864:"ExifVersion",40960:"FlashpixVersion",40961:"ColorSpace",40962:"PixelXDimension",40963:"PixelYDimension",37121:"ComponentsConfiguration",37122:"CompressedBitsPerPixel",37500:"MakerNote",37510:"UserComment",40964:"RelatedSoundFile",36867:"DateTimeOriginal",36868:"DateTimeDigitized",37520:"SubsecTime",37521:"SubsecTimeOriginal",37522:"SubsecTimeDigitized",33434:"ExposureTime",33437:"FNumber",34850:"ExposureProgram",34852:"SpectralSensitivity",34855:"ISOSpeedRatings",34856:"OECF",37377:"ShutterSpeedValue",37378:"ApertureValue",37379:"BrightnessValue",37380:"ExposureBias",37381:"MaxApertureValue",37382:"SubjectDistance",37383:"MeteringMode",37384:"LightSource",37385:"Flash",37396:"SubjectArea",37386:"FocalLength",41483:"FlashEnergy",41484:"SpatialFrequencyResponse",41486:"FocalPlaneXResolution",41487:"FocalPlaneYResolution",41488:"FocalPlaneResolutionUnit",41492:"SubjectLocation",41493:"ExposureIndex",41495:"SensingMethod",41728:"FileSource",41729:"SceneType",41730:"CFAPattern",41985:"CustomRendered",41986:"ExposureMode",41987:"WhiteBalance",41988:"DigitalZoomRation",41989:"FocalLengthIn35mmFilm",41990:"SceneCaptureType",41991:"GainControl",41992:"Contrast",41993:"Saturation",41994:"Sharpness",41995:"DeviceSettingDescription",41996:"SubjectDistanceRange",40965:"InteroperabilityIFDPointer",42016:"ImageUniqueID"},v=p.TiffTags={256:"ImageWidth",257:"ImageHeight",34665:"ExifIFDPointer",34853:"GPSInfoIFDPointer",40965:"InteroperabilityIFDPointer",258:"BitsPerSample",259:"Compression",262:"PhotometricInterpretation",274:"Orientation",277:"SamplesPerPixel",284:"PlanarConfiguration",530:"YCbCrSubSampling",531:"YCbCrPositioning",282:"XResolution",283:"YResolution",296:"ResolutionUnit",273:"StripOffsets",278:"RowsPerStrip",279:"StripByteCounts",513:"JPEGInterchangeFormat",514:"JPEGInterchangeFormatLength",301:"TransferFunction",318:"WhitePoint",319:"PrimaryChromaticities",529:"YCbCrCoefficients",532:"ReferenceBlackWhite",306:"DateTime",270:"ImageDescription",271:"Make",272:"Model",305:"Software",315:"Artist",33432:"Copyright"},y=p.GPSTags={0:"GPSVersionID",1:"GPSLatitudeRef",2:"GPSLatitude",3:"GPSLongitudeRef",4:"GPSLongitude",5:"GPSAltitudeRef",6:"GPSAltitude",7:"GPSTimeStamp",8:"GPSSatellites",9:"GPSStatus",10:"GPSMeasureMode",11:"GPSDOP",12:"GPSSpeedRef",13:"GPSSpeed",14:"GPSTrackRef",15:"GPSTrack",16:"GPSImgDirectionRef",17:"GPSImgDirection",18:"GPSMapDatum",19:"GPSDestLatitudeRef",20:"GPSDestLatitude",21:"GPSDestLongitudeRef",22:"GPSDestLongitude",23:"GPSDestBearingRef",24:"GPSDestBearing",25:"GPSDestDistanceRef",26:"GPSDestDistance",27:"GPSProcessingMethod",28:"GPSAreaInformation",29:"GPSDateStamp",30:"GPSDifferential"},S=p.StringValues={ExposureProgram:{0:"Not defined",1:"Manual",2:"Normal program",3:"Aperture priority",4:"Shutter priority",5:"Creative program",6:"Action program",7:"Portrait mode",8:"Landscape mode"},MeteringMode:{0:"Unknown",1:"Average",2:"CenterWeightedAverage",3:"Spot",4:"MultiSpot",5:"Pattern",6:"Partial",255:"Other"},LightSource:{0:"Unknown",1:"Daylight",2:"Fluorescent",3:"Tungsten (incandescent light)",4:"Flash",9:"Fine weather",10:"Cloudy weather",11:"Shade",12:"Daylight fluorescent (D 5700 - 7100K)",13:"Day white fluorescent (N 4600 - 5400K)",14:"Cool white fluorescent (W 3900 - 4500K)",15:"White fluorescent (WW 3200 - 3700K)",17:"Standard light A",18:"Standard light B",19:"Standard light C",20:"D55",21:"D65",22:"D75",23:"D50",24:"ISO studio tungsten",255:"Other"},Flash:{0:"Flash did not fire",1:"Flash fired",5:"Strobe return light not detected",7:"Strobe return light detected",9:"Flash fired, compulsory flash mode",13:"Flash fired, compulsory flash mode, return light not detected",15:"Flash fired, compulsory flash mode, return light detected",16:"Flash did not fire, compulsory flash mode",24:"Flash did not fire, auto mode",25:"Flash fired, auto mode",29:"Flash fired, auto mode, return light not detected",31:"Flash fired, auto mode, return light detected",32:"No flash function",65:"Flash fired, red-eye reduction mode",69:"Flash fired, red-eye reduction mode, return light not detected",71:"Flash fired, red-eye reduction mode, return light detected",73:"Flash fired, compulsory flash mode, red-eye reduction mode",77:"Flash fired, compulsory flash mode, red-eye reduction mode, return light not detected",79:"Flash fired, compulsory flash mode, red-eye reduction mode, return light detected",89:"Flash fired, auto mode, red-eye reduction mode",93:"Flash fired, auto mode, return light not detected, red-eye reduction mode",95:"Flash fired, auto mode, return light detected, red-eye reduction mode"},SensingMethod:{1:"Not defined",2:"One-chip color area sensor",3:"Two-chip color area sensor",4:"Three-chip color area sensor",5:"Color sequential area sensor",7:"Trilinear sensor",8:"Color sequential linear sensor"},SceneCaptureType:{0:"Standard",1:"Landscape",2:"Portrait",3:"Night scene"},SceneType:{1:"Directly photographed"},CustomRendered:{0:"Normal process",1:"Custom process"},WhiteBalance:{0:"Auto white balance",1:"Manual white balance"},GainControl:{0:"None",1:"Low gain up",2:"High gain up",3:"Low gain down",4:"High gain down"},Contrast:{0:"Normal",1:"Soft",2:"Hard"},Saturation:{0:"Normal",1:"Low saturation",2:"High saturation"},Sharpness:{0:"Normal",1:"Soft",2:"Hard"},SubjectDistanceRange:{0:"Unknown",1:"Macro",2:"Close view",3:"Distant view"},FileSource:{3:"DSC"},Components:{0:"",1:"Y",2:"Cb",3:"Cr",4:"R",5:"G",6:"B"}},b={120:"caption",110:"credit",25:"keywords",55:"dateCreated",80:"byline",85:"bylineTitle",122:"captionWriter",105:"headline",116:"copyright",15:"category"};p.getData=function(e,t){return(e instanceof Image||e instanceof HTMLImageElement)&&!e.complete?!1:(n(e)?t&&t.call(e):s(e,t),!0)},p.getTag=function(e,t){return n(e)?e.exifdata[t]:void 0},p.getAllTags=function(e){if(!n(e))return{};var t,r=e.exifdata,i={};for(t in r)r.hasOwnProperty(t)&&(i[t]=r[t]);return i},p.pretty=function(e){if(!n(e))return"";var t,r=e.exifdata,i="";for(t in r)r.hasOwnProperty(t)&&(i+="object"==typeof r[t]?r[t]instanceof Number?t+" : "+r[t]+" ["+r[t].numerator+"/"+r[t].denominator+"]\r\n":t+" : ["+r[t].length+" values]\r\n":t+" : "+r[t]+"\r\n");return i},p.readFromBinaryFile=function(e){return c(e)},r=[],i=function(){return p}.apply(t,r),!(void 0!==i&&(e.exports=i))}).call(this)},function(e,t,n){var r,i;!function(){function n(e){var t=e.naturalWidth,n=e.naturalHeight;if(t*n>1048576){var r=document.createElement("canvas");r.width=r.height=1;var i=r.getContext("2d");return i.drawImage(e,-t+1,0),0===i.getImageData(0,0,1,1).data[3]}return!1}function o(e,t,n){var r=document.createElement("canvas");r.width=1,r.height=n;var i=r.getContext("2d");i.drawImage(e,0,0);for(var o=i.getImageData(0,0,1,n).data,a=0,s=n,c=n;c>a;){var u=o[4*(c-1)+3];0===u?s=c:a=c,c=s+a>>1}var l=c/n;return 0===l?1:l}function a(e,t,n){var r=document.createElement("canvas");return s(e,r,t,n),r.toDataURL("image/jpeg",t.quality||.8)}function s(e,t,r,i){var a=e.naturalWidth,s=e.naturalHeight,u=r.width,l=r.height,f=t.getContext("2d");f.save(),c(t,f,u,l,r.orientation);var h=n(e);h&&(a/=2,s/=2);var d=1024,g=document.createElement("canvas");g.width=g.height=d;for(var m=g.getContext("2d"),p=i?o(e,a,s):1,w=Math.ceil(d*u/a),v=Math.ceil(d*l/s/p),y=0,S=0;s>y;){for(var b=0,I=0;a>b;)m.clearRect(0,0,d,d),m.drawImage(e,-b,-y),f.drawImage(g,0,0,d,d,I,S,w,v),b+=d,I+=w;y+=d,S+=v}f.restore(),g=m=null}function c(e,t,n,r,i){switch(i){case 5:case 6:case 7:case 8:e.width=r,e.height=n;break;default:e.width=n,e.height=r}switch(i){case 2:t.translate(n,0),t.scale(-1,1);break;case 3:t.translate(n,r),t.rotate(Math.PI);break;case 4:t.translate(0,r),t.scale(1,-1);break;case 5:t.rotate(.5*Math.PI),t.scale(1,-1);break;case 6:t.rotate(.5*Math.PI),t.translate(0,-r);break;case 7:t.rotate(.5*Math.PI),t.translate(n,-r),t.scale(-1,1);break;case 8:t.rotate(-.5*Math.PI),t.translate(-n,0)}}function u(e){if(window.Blob&&e instanceof Blob){var t=new Image,n=window.URL&&window.URL.createObjectURL?window.URL:window.webkitURL&&window.webkitURL.createObjectURL?window.webkitURL:null;if(!n)throw Error("No createObjectURL function found to create blob url");t.src=n.createObjectURL(e),this.blob=e,e=t}if(!e.naturalWidth&&!e.naturalHeight){var r=this;e.onload=function(){var e=r.imageLoadListeners;if(e){r.imageLoadListeners=null;for(var t=0,n=e.length;n>t;t++)e[t]()}},this.imageLoadListeners=[]}this.srcImage=e}u.prototype.render=function(e,t,n){if(this.imageLoadListeners){var r=this;return void this.imageLoadListeners.push(function(){r.render(e,t,n)})}t=t||{};var i=this.srcImage,o=i.src,c=o.length,u=i.naturalWidth,l=i.naturalHeight,f=t.width,h=t.height,d=t.maxWidth,g=t.maxHeight,m=this.blob&&"image/jpeg"===this.blob.type||0===o.indexOf("data:image/jpeg")||o.indexOf(".jpg")===c-4||o.indexOf(".jpeg")===c-5;f&&!h?h=l*f/u<<0:h&&!f?f=u*h/l<<0:(f=u,h=l),d&&f>d&&(f=d,h=l*f/u<<0),g&&h>g&&(h=g,f=u*h/l<<0);var p={width:f,height:h};for(var w in t)p[w]=t[w];var v=e.tagName.toLowerCase();"img"===v?e.src=a(this.srcImage,p,m):"canvas"===v&&s(this.srcImage,e,p,m),"function"==typeof this.onrender&&this.onrender(e),n&&n()},r=[],i=function(){return u}.apply(t,r),!(void 0!==i&&(e.exports=i))}()},function(e,t){function n(e){function t(e){for(var t=[16,11,10,16,24,40,51,61,12,12,14,19,26,58,60,55,14,13,16,24,40,57,69,56,14,17,22,29,51,87,80,62,18,22,37,56,68,109,103,77,24,35,55,64,81,104,113,92,49,64,78,87,103,121,120,101,72,92,95,98,112,100,103,99],n=0;64>n;n++){var r=F((t[n]*e+50)/100);1>r?r=1:r>255&&(r=255),U[N[n]]=r}for(var i=[17,18,24,47,99,99,99,99,18,21,26,66,99,99,99,99,24,26,56,99,99,99,99,99,47,66,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99],o=0;64>o;o++){var a=F((i[o]*e+50)/100);1>a?a=1:a>255&&(a=255),D[N[o]]=a}for(var s=[1,1.387039845,1.306562965,1.175875602,1,.785694958,.5411961,.275899379],c=0,u=0;8>u;u++)for(var l=0;8>l;l++)x[c]=1/(U[N[c]]*s[u]*s[l]*8),C[c]=1/(D[N[c]]*s[u]*s[l]*8),c++}function n(e,t){for(var n=0,r=0,i=new Array,o=1;16>=o;o++){for(var a=1;a<=e[o];a++)i[t[r]]=[],i[t[r]][0]=n,i[t[r]][1]=o,r++,n++;n*=2}return i}function r(){y=n(W,V),S=n(q,X),b=n(H,z),I=n(J,Y)}function i(){for(var e=1,t=2,n=1;15>=n;n++){for(var r=e;t>r;r++)L[32767+r]=n,T[32767+r]=[],T[32767+r][1]=n,T[32767+r][0]=r;for(var i=-(t-1);-e>=i;i++)L[32767+i]=n,T[32767+i]=[],T[32767+i][1]=n,T[32767+i][0]=t-1+i;e<<=1,t<<=1}}function o(){for(var e=0;256>e;e++)B[e]=19595*e,B[e+256>>0]=38470*e,B[e+512>>0]=7471*e+32768,B[e+768>>0]=-11059*e,B[e+1024>>0]=-21709*e,B[e+1280>>0]=32768*e+8421375,B[e+1536>>0]=-27439*e,B[e+1792>>0]=-5329*e}function a(e){for(var t=e[0],n=e[1]-1;n>=0;)t&1<<n&&(M|=1<<_),n--,_--,0>_&&(255==M?(s(255),s(0)):s(M),_=7,M=0)}function s(e){G.push(j[e])}function c(e){s(e>>8&255),s(255&e)}function u(e,t){var n,r,i,o,a,s,c,u,l,f=0;const h=8,d=64;for(l=0;h>l;++l){n=e[f],r=e[f+1],i=e[f+2],o=e[f+3],a=e[f+4],s=e[f+5],c=e[f+6],u=e[f+7];var g=n+u,m=n-u,p=r+c,w=r-c,v=i+s,y=i-s,S=o+a,b=o-a,I=g+S,P=g-S,F=p+v,U=p-v;e[f]=I+F,e[f+4]=I-F;var D=.707106781*(U+P);e[f+2]=P+D,e[f+6]=P-D,I=b+y,F=y+w,U=w+m;var x=.382683433*(I-U),C=.5411961*I+x,T=1.306562965*U+x,L=.707106781*F,A=m+L,G=m-L;e[f+5]=G+C,e[f+3]=G-C,e[f+1]=A+T,e[f+7]=A-T,f+=8}for(f=0,l=0;h>l;++l){n=e[f],r=e[f+8],i=e[f+16],o=e[f+24],a=e[f+32],s=e[f+40],c=e[f+48],u=e[f+56];var M=n+u,_=n-u,E=r+c,O=r-c,k=i+s,j=i-s,B=o+a,N=o-a,W=M+B,V=M-B,H=E+k,z=E-k;e[f]=W+H,e[f+32]=W-H;var q=.707106781*(z+V);e[f+16]=V+q,e[f+48]=V-q,W=N+j,H=j+O,z=O+_;var X=.382683433*(W-z),J=.5411961*W+X,Y=1.306562965*z+X,Q=.707106781*H,K=_+Q,Z=_-Q;e[f+40]=Z+J,e[f+24]=Z-J,e[f+8]=K+Y,e[f+56]=K-Y,f++}var $;for(l=0;d>l;++l)$=e[l]*t[l],R[l]=$>0?$+.5|0:$-.5|0;return R}function l(){c(65504),c(16),s(74),s(70),s(73),s(70),s(0),s(1),s(1),s(0),c(1),c(1),s(0),s(0)}function f(e,t){c(65472),c(17),s(8),c(t),c(e),s(3),s(1),s(17),s(0),s(2),s(17),s(1),s(3),s(17),s(1)}function h(){c(65499),c(132),s(0);for(var e=0;64>e;e++)s(U[e]);s(1);for(var t=0;64>t;t++)s(D[t])}function d(){c(65476),c(418),s(0);for(var e=0;16>e;e++)s(W[e+1]);for(var t=0;11>=t;t++)s(V[t]);s(16);for(var n=0;16>n;n++)s(H[n+1]);for(var r=0;161>=r;r++)s(z[r]);s(1);for(var i=0;16>i;i++)s(q[i+1]);for(var o=0;11>=o;o++)s(X[o]);s(17);for(var a=0;16>a;a++)s(J[a+1]);for(var u=0;161>=u;u++)s(Y[u])}function g(){c(65498),c(12),s(3),s(1),s(0),s(2),s(17),s(3),s(17),s(0),s(63),s(0)}function m(e,t,n,r,i){var o,s=i[0],c=i[240];const l=16,f=63,h=64;for(var d=u(e,t),g=0;h>g;++g)A[N[g]]=d[g];var m=A[0]-n;n=A[0],0==m?a(r[0]):(o=32767+m,a(r[L[o]]),a(T[o]));for(var p=63;p>0&&0==A[p];p--);if(0==p)return a(s),n;for(var w,v=1;p>=v;){for(var y=v;0==A[v]&&p>=v;++v);var S=v-y;if(S>=l){w=S>>4;for(var b=1;w>=b;++b)a(c);S=15&S}o=32767+A[v],a(i[(S<<4)+L[o]]),a(T[o]),v++}return p!=f&&a(s),n}function p(){for(var e=String.fromCharCode,t=0;256>t;t++)j[t]=e(t)}function w(e){if(0>=e&&(e=1),e>100&&(e=100),P!=e){var n=0;n=50>e?Math.floor(5e3/e):Math.floor(200-2*e),t(n),P=e}}function v(){var t=(new Date).getTime();e||(e=50),p(),r(),i(),o(),w(e);(new Date).getTime()-t}var y,S,b,I,P,F=(Math.round,Math.floor),U=new Array(64),D=new Array(64),x=new Array(64),C=new Array(64),T=new Array(65535),L=new Array(65535),R=new Array(64),A=new Array(64),G=[],M=0,_=7,E=new Array(64),O=new Array(64),k=new Array(64),j=new Array(256),B=new Array(2048),N=[0,1,5,6,14,15,27,28,2,4,7,13,16,26,29,42,3,8,12,17,25,30,41,43,9,11,18,24,31,40,44,53,10,19,23,32,39,45,52,54,20,22,33,38,46,51,55,60,21,34,37,47,50,56,59,61,35,36,48,49,57,58,62,63],W=[0,0,1,5,1,1,1,1,1,1,0,0,0,0,0,0,0],V=[0,1,2,3,4,5,6,7,8,9,10,11],H=[0,0,2,1,3,3,2,4,3,5,5,4,4,0,0,1,125],z=[1,2,3,0,4,17,5,18,33,49,65,6,19,81,97,7,34,113,20,50,129,145,161,8,35,66,177,193,21,82,209,240,36,51,98,114,130,9,10,22,23,24,25,26,37,38,39,40,41,42,52,53,54,55,56,57,58,67,68,69,70,71,72,73,74,83,84,85,86,87,88,89,90,99,100,101,102,103,104,105,106,115,116,117,118,119,120,121,122,131,132,133,134,135,136,137,138,146,147,148,149,150,151,152,153,154,162,163,164,165,166,167,168,169,170,178,179,180,181,182,183,184,185,186,194,195,196,197,198,199,200,201,202,210,211,212,213,214,215,216,217,218,225,226,227,228,229,230,231,232,233,234,241,242,243,244,245,246,247,248,249,250],q=[0,0,3,1,1,1,1,1,1,1,1,1,0,0,0,0,0],X=[0,1,2,3,4,5,6,7,8,9,10,11],J=[0,0,2,1,2,4,4,3,4,7,5,4,4,0,1,2,119],Y=[0,1,2,3,17,4,5,33,49,6,18,65,81,7,97,113,19,34,50,129,8,20,66,145,161,177,193,9,35,51,82,240,21,98,114,209,10,22,36,52,225,37,241,23,24,25,26,38,39,40,41,42,53,54,55,56,57,58,67,68,69,70,71,72,73,74,83,84,85,86,87,88,89,90,99,100,101,102,103,104,105,106,115,116,117,118,119,120,121,122,130,131,132,133,134,135,136,137,138,146,147,148,149,150,151,152,153,154,162,163,164,165,166,167,168,169,170,178,179,180,181,182,183,184,185,186,194,195,196,197,198,199,200,201,202,210,211,212,213,214,215,216,217,218,226,227,228,229,230,231,232,233,234,242,243,244,245,246,247,248,249,250];this.encode=function(e,t,n){var r=(new Date).getTime();t&&w(t),G=new Array,M=0,_=7,c(65496),l(),h(),f(e.width,e.height),d(),g();var i=0,o=0,s=0;M=0,_=7,this.encode.displayName="_encode_";for(var u,p,v,P,F,U,D,T,L,R=e.data,A=e.width,j=e.height,N=4*A,W=0;j>W;){for(u=0;N>u;){for(F=N*W+u,U=F,D=-1,T=0,L=0;64>L;L++)T=L>>3,D=4*(7&L),U=F+T*N+D,W+T>=j&&(U-=N*(W+1+T-j)),u+D>=N&&(U-=u+D-N+4),p=R[U++],v=R[U++],P=R[U++],E[L]=(B[p]+B[v+256>>0]+B[P+512>>0]>>16)-128,O[L]=(B[p+768>>0]+B[v+1024>>0]+B[P+1280>>0]>>16)-128,k[L]=(B[p+1280>>0]+B[v+1536>>0]+B[P+1792>>0]>>16)-128;i=m(E,x,i,y,b),o=m(O,C,o,S,I),s=m(k,C,s,S,I),u+=32}W+=8}if(_>=0){var V=[];V[1]=_+1,V[0]=(1<<_+1)-1,a(V)}if(c(65497),n){for(var H=G.length,z=new Uint8Array(H),q=0;H>q;q++)z[q]=G[q].charCodeAt();G=[];(new Date).getTime()-r;return z}var X="data:image/jpeg;base64,"+btoa(G.join(""));G=[];(new Date).getTime()-r;return X},v()}e.exports=n},function(e,t,n){function r(e,t){var n=this;if(!e)throw new Error("没有收到图片，可能的解决方案：https://github.com/think2011/localResizeIMG4/issues/7");t=t||{},n.defaults={width:null,height:null,quality:.7},n.file=e;for(var r in t)t.hasOwnProperty(r)&&(n.defaults[r]=t[r]);return this.init()}function i(e){var t=null;return t=e?[].filter.call(document.scripts,function(t){return-1!==t.src.indexOf(e)})[0]:document.scripts[document.scripts.length-1],t?t.src.substr(0,t.src.lastIndexOf("/")):null}n.p=i("lrz")+"/",window.URL=window.URL||window.webkitURL;var o=n(1),a=n(4),s=function(e){var t=/OS (\d)_.* like Mac OS X/g.exec(e),n=/Android (\d.*?);/g.exec(e)||/Android\/(\d.*?) /g.exec(e);return{oldIOS:t?+t.pop()<8:!1,oldAndroid:n?+n.pop().substr(0,3)<4.5:!1,iOS:/\(i[^;]+;( U;)? CPU.+Mac OS X/.test(e),android:/Android/g.test(e),mQQBrowser:/MQQBrowser/g.test(e)}}(navigator.userAgent);r.prototype.init=function(){var e=this,t=e.file,n=new Image,r=document.createElement("canvas"),i="string"==typeof t?t:URL.createObjectURL(t);if(e.img=n,e.blob=i,e.canvas=r,!document.createElement("canvas").getContext)throw new Error("浏览器不支持canvas");return new o(function(t,r){n.onerror=function(){throw new Error("加载图片文件失败")},n.onload=function(){e._getBase64().then(function(e){return e.length<10&&r("生成base64失败"),e}).then(function(n){t({origin:e.file,base64:n,base64Len:n.length});for(var r in e)e.hasOwnProperty(r)&&(e[r]=null);URL.revokeObjectURL(e.blob)})},n.crossOrigin="*",n.src=i})},r.prototype._getBase64=function(){var e=this,t=e.img,n=e.file,r=e.canvas;return new o(function(i){a.getData("object"==typeof n?n:t,function(){e.orientation=a.getTag(this,"Orientation"),e.resize=e._getResize(),e.ctx=r.getContext("2d"),r.width=e.resize.width,r.height=e.resize.height,e.ctx.fillStyle="#fff",e.ctx.fillRect(0,0,r.width,r.height),s.oldIOS?e._createBase64ForOldIOS().then(i):e._createBase64().then(i)})})},r.prototype._createBase64ForOldIOS=function(){var e=this,t=e.img,r=e.canvas,i=e.defaults,a=e.orientation;return new o(function(e){!function(){var o=[n(5)];(function(n){var o=new n(t);"5678".indexOf(a)>-1?o.render(r,{width:r.height,height:r.width,orientation:a}):o.render(r,{width:r.width,height:r.height,orientation:a}),e(r.toDataURL("image/jpeg",i.quality))}).apply(null,o)}()})},r.prototype._createBase64=function(){var e=this,t=e.resize,r=e.img,i=e.canvas,a=e.ctx,c=e.defaults,u=e.orientation;switch(u){case 3:a.rotate(180*Math.PI/180),a.drawImage(r,-t.width,-t.height,t.width,t.height);break;case 6:a.rotate(90*Math.PI/180),a.drawImage(r,0,-t.width,t.height,t.width);break;case 8:a.rotate(270*Math.PI/180),a.drawImage(r,-t.height,0,t.height,t.width);break;case 2:a.translate(t.width,0),a.scale(-1,1),a.drawImage(r,0,0,t.width,t.height);break;case 4:a.translate(t.width,0),a.scale(-1,1),a.rotate(180*Math.PI/180),a.drawImage(r,-t.width,-t.height,t.width,t.height);break;case 5:a.translate(t.width,0),a.scale(-1,1),a.rotate(90*Math.PI/180),a.drawImage(r,0,-t.width,t.height,t.width);break;case 7:a.translate(t.width,0),a.scale(-1,1),a.rotate(270*Math.PI/180),a.drawImage(r,-t.height,0,t.height,t.width);break;default:a.drawImage(r,0,0,t.width,t.height)}return new o(function(e){s.oldAndroid||s.mQQBrowser||!navigator.userAgent?!function(){var t=[n(6)];(function(t){var n=new t,r=a.getImageData(0,0,i.width,i.height);e(n.encode(r,100*c.quality))}).apply(null,t)}():e(i.toDataURL("image/jpeg",c.quality))})},r.prototype._getResize=function(){var e=this,t=e.img,n=e.defaults,r=n.width,i=n.height,o=e.orientation,a={width:t.width,height:t.height};if(o&&"5678".indexOf(o)>-1&&(a.width=t.height,a.height=t.width,r=n.height,i=n.width),a.width<r||a.height<i)return a;var s=a.width/a.height;for(r&&i?s>=r/i?a.width>r&&(a.width=r,a.height=Math.ceil(r/s)):a.height>i&&(a.height=i,a.width=Math.ceil(i*s)):r?r<a.width&&(a.width=r,a.height=Math.ceil(r/s)):i&&i<a.height&&(a.width=Math.ceil(i*s),a.height=i);a.width>=3264||a.height>=2448;)a.width*=.8,a.height*=.8;return a},window.lrz=function(e,t){return new r(e,t)},window.lrz.version="4.2.10",e.exports=window.lrz}]);
//# sourceMappingURL=lrz.all.bundle.js.map