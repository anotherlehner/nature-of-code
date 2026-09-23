type webgl
@val external webgl: webgl = "WEBGL"

type terrain
@send external calculate: terrain => unit = "calculate"
@send external render: terrain => unit = "render"
@new external initTerrain: (int, int, int) => terrain = "Terrain"

type vector = {
  mutable x: float,
  mutable y: float
}
@val external createVector: (float, float) => vector = "createVector"

@set external setSetup: (Browser.window, unit => unit) => unit = "setup"
@set external setDraw: (Browser.window, unit => unit) => unit = "draw"

@val external createCanvas: (float, float) => unit = "createCanvas"
@val external createWebGLCanvas: (float, float, webgl) => unit = "createCanvas"

@val
external stroke: @unwrap
[
  | #Num(float)
  | #Str(string)
] => unit = "stroke"

@val external rect: (float, float, float, float) => unit = "rect"
@new external initP5Global: unit => unit = "p5"
@val external textFont: string => unit = "textFont"
@val external textSize: float => unit = "textSize"
@val external text: (string, float, float) => unit = "text"
@val external point: (float, float) => unit = "point"
@val external scale: float => unit = "scale"
@val external strokeWeight: int => unit = "strokeWeight"
@val external floor: float => float = "floor"
@val external constrain: (float, float, float) => float = "constrain"
@val external randomGaussian: (float, float) => float = "randomGaussian"
@val external circle: (float, float, float) => unit = "circle"
@val external noStroke: unit => unit = "noStroke"
@val external push: unit => unit = "push"
@val external pop: unit => unit = "pop"

@val external translate: (float, float, float) => unit = "translate"

@val external rotateX: float => unit = "rotateX"
@val external rotateY: float => unit = "rotateY"
@val external rotateZ: float => unit = "rotateZ"

@val external map: (float, float, float, float, float) => float = "map"

@val
external noise: @unwrap
[
  | #OneD(float)
  | #TwoD(float, float)
] => float = "noise" // For some reason this is returning NaN?

@val external noise2d: (float, float) => float = "noise"
@val external noise3d: (float, float, float) => float = "noise"

@val external noiseDetail: (float, float) => unit = "noiseDetail"

@val external loadPixels: unit => unit = "loadPixels"
@val external updatePixels: unit => unit = "updatePixels"
@val external set: (float, float, float) => unit = "set"

@val
external fill: @unwrap
[
  | #CSSColor(string)
  | #Range(float, float)
] => unit = "fill"

@val
external random: @unwrap
[
  | #Num(int)
  | #Range(int, int)
] => float = "random"

@val external randomChoice: array<'a> => 'a = "random"

@val
external background: @unwrap
[
  | #Num(float)
  | #Str(string)
  | #RGB(float, float, float)
] => unit = "background"

@val external mouseX: float = "mouseX"
@val external mouseY: float = "mouseY"

@val external noise3: (float, float, float) => float = "noise"
@val external floorInt: float => int = "floor"
@val external beginShape: int => unit = "beginShape"
@val external endShape: unit => unit = "endShape"
@val external vertex: (float, float, float) => unit = "vertex"
@val external quadStrip: int = "QUAD_STRIP"
