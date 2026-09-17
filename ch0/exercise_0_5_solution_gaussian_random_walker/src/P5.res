@set external setSetup: (Browser.window, unit => unit) => unit = "setup"
@set external setDraw: (Browser.window, unit => unit) => unit = "draw"

@val external createCanvas: (float, float) => unit = "createCanvas"
@val external stroke: string => unit = "stroke"
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

@val
external fill: (
  @unwrap [
    | #CSSColor(string)
    | #Range(float, float)
  ]
) => unit = "fill"

@val
external random: (
  @unwrap [
    | #Num(int)
    | #Range(int, int)
  ]
) => float = "random"

@val
external background: (
  @unwrap [
    | #Num(float)
    | #Str(string)
    | #RGB(float, float, float)
  ]
) => unit = "background"

@val external mouseX: float = "mouseX"
@val external mouseY: float = "mouseY"