@set external setSetup: (Browser.window, unit => unit) => unit = "setup"
@set external setDraw: (Browser.window, unit => unit) => unit = "draw"

@val external createCanvas: (float, float) => unit = "createCanvas"
@val external fill: string => unit = "fill"
@val external stroke: string => unit = "stroke"
@val external rect: (float, float, float, float) => unit = "rect"
@new external initP5Global: unit => unit = "p5"
@val external textFont: string => unit = "textFont"
@val external textSize: int => unit = "textSize"
@val external text: (string, int, int) => unit = "text"

@val
external background: (
  @unwrap [
    | #Num(float)
    | #Str(string)
    | #RGB(float, float, float)
  ]
) => unit = "background"
