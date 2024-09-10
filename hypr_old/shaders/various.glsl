precision mediump float;

varying vec2 v_texcoord;
uniform sampler2D tex;
uniform float time;

const bool killswitch             = false;

// =================================================================== General
const float contrast              = 1.0;
const float gamma                 = 1.0;

// =================================================================== Scanlines
const bool doScanlines            = !killswitch && true;
const float scanlineBarHeight     = 2.0;
const float scanlineIntensity     = 1.5;
const float scanlineThreshold     = 1.8;

// =================================================================== Noise
const bool doAdditiveNoise        = !killswitch && true;
const vec3 additiveNoiseIntensity = vec3(0.05, 0.05, 0.1) * 2.5;
const bool doChromaNoise          = !killswitch && false;
const float chromaNoiseIntensity  = 1.0;

// =================================================================== Shimmer
const bool doShimmer              = !killswitch && true;
const float shimmerThreshold      = 0.6;
const float shimmerIntensity      = 0.2;

// =================================================================== Vibrance
const bool doVibrance             = !killswitch && true;
const float vibrance              = 0.3;
const vec3 vibranceColorBalance   = vec3(2.0, 1.0, 2.0);
const vec3 vibranceCoefs          = vibranceColorBalance * -vibrance;


// https://www.shadertoy.com/view/XdcXzn
mat4 contrastMatrix(float contrast) {
    float t = (1.0 - contrast) / 2.0;
    return mat4(
    contrast, 0, 0, 0,
    0, contrast, 0, 0,
    0, 0, contrast, 0,
    t, t, t, 1);
}

// https://stackoverflow.com/questions/12964279/whats-the-origin-of-this-glsl-rand-one-liner
highp float prnd(vec2 co)
{
    highp float a = 12.9898;
    highp float b = 78.233;
    highp float c = 43758.5453;
    highp float dt= dot(co.xy, vec2(a, b));
    highp float sn= mod(dt, 3.14);
    return fract(sin(sn) * c);
}

// https://gist.github.com/mairod/a75e7b44f68110e1576d77419d608786?permalink_comment_id=3180018#gistcomment-3180018
vec3 hueShift(vec3 color, float hue) {
    const vec3 k = vec3(0.57735, 0.57735, 0.57735);
    float cosAngle = cos(hue);
    return vec3(color * cosAngle + cross(k, color) * sin(hue) + k * dot(k, color) * (1.0 - cosAngle));
}

// https://stackoverflow.com/a/17897228
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

// https://stackoverflow.com/a/17897228
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

void main(void) {
    vec3 color = texture2D(tex, v_texcoord).rgb;
    float saturation = max(color.r, max(color.g, color.b)) - min(color.r, min(color.g, color.b));
    float luma = dot(vec3(0.212656, 0.715158, 0.072186), color);

    if (doChromaNoise) {
        float rand = prnd(v_texcoord * time/100.0);
        color = hueShift(color, - chromaNoiseIntensity / 2.0 + rand* chromaNoiseIntensity);
    }

    if (doVibrance) {
        vec3 p_col = vec3(vec3(vec3(vec3(sign(vibranceCoefs) * saturation) - 1.0) * vibranceCoefs) + 1.0);
        color.r = mix(luma, color.r, p_col.r);
        color.g = mix(luma, color.g, p_col.g);
        color.b = mix(luma, color.b, p_col.b);
    }

    if (doShimmer) {
        float stauration = saturation;
        if (stauration > shimmerThreshold) {
            color = mix(color,
            hueShift(color, (v_texcoord.y*100.00) + time * 10.0),
            (stauration - shimmerThreshold) * shimmerIntensity);
        }
    }

    if (doAdditiveNoise) {
        color.rgb += (vec3(
        prnd(v_texcoord + ((vec2(0.01, 0.01)) + time / 500000.0)),
        prnd(v_texcoord + ((vec2(0.02, 0.02)) + time / 500000.0)),
        prnd(v_texcoord + ((vec2(0.03, 0.03)) + time / 500000.0))) * additiveNoiseIntensity) - (additiveNoiseIntensity / 2.0);
    }

    if (doScanlines) {
        float coefScanline = (sin(gl_FragCoord.y * 3.1415 / scanlineBarHeight) + 1.0) / (10.0/scanlineIntensity);
        color = mix(color, min(vec3(coefScanline,coefScanline,coefScanline), color), scanlineThreshold);

        // compensate dimmed contrast. There is too much crossmodulation between intensity, threshold
        // and bar height going on to make this deterministic. This works fine for the preset values
        color.rgb *= 1.0 + (scanlineThreshold);

        // simple gamma correction attempt
        //        color.rgb = pow(color.rgb, vec3(1.0/1.1));

        // s-surve correction attempt
        // float k = 0.2;
        // color = (
        //     ( (k-1.0) * ((2.0 * color) - 1.0) ) /
        //     ( 2.0 * ( (4.0 * k) * abs(color - 0.5) -(k+1.0) ) )
        // ) + 0.5;
    }

    if (gamma != 1.0) {
        color.rgb = pow(color.rgb, vec3(1.0/gamma));
    }

    vec4 pixelOut = vec4(color.r, color.g, color.b, 1.0);
    if (contrast != 1.0) {
        pixelOut *= (contrastMatrix(contrast));
    }
    gl_FragColor = pixelOut;
}
