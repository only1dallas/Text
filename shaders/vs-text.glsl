
attribute vec4 textCoord;
attribute vec2 textOffset;
attribute vec2 lookup;

attribute float id;

uniform sampler2D t_lookup;

uniform vec2 windowSize;

uniform float dpr;
uniform float textureSize;
uniform float letterWidth;


varying vec4 vLookup;
varying vec4 vTextCoord;
varying vec2 vTextOffset;
varying vec3 vPos;
varying vec2 vUv;
varying float vID;

void main(){
  
  vPos        = texture2D( t_lookup , lookup ).xyz + position;

  vUv = uv;

  vID = id;

  vTextCoord  = textCoord;//texture2D( t_textCoord , uv );
  vTextOffset = textOffset;

  vec3 pos = vPos;
  vec4 mvPos = modelViewMatrix * vec4( pos , 1.0 );
 
  gl_Position = projectionMatrix * mvPos;

}
