let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#1a1c2c"
let textColor = "#f4f4f4"
let walkerColor = "#ff0044"

let theta = ref(0.0)
let land = ref(None)

let setup = () => {
  P5.createWebGLCanvas(screenWidth, screenHeight, P5.webgl)
  P5.background(#Str(bgColor))

  // We need to do this here because p5js functions have to be called strictly _AFTER_
  // the setup p5 instance has been created and this setup method run, otherwise we'll
  // get errors that global functions don't exist -- so we had to use a reference
  land := Some(Terrain.make(20.0, 800.0, 400.0))
}

let draw = () => {
  switch land.contents {
    | Some(l2) =>
        Terrain.calculate(l2)
        P5.background(#Num(255.0))
        P5.push()
        P5.translate(0.0, 20.0, -200.0)
        P5.rotateX(3.1415926 / 3.0)
        P5.rotateZ(theta.contents)
        Terrain.render(l2)
        P5.pop()
    | None =>
        JsError.throwWithMessage("invalid land")
  }

  theta := theta.contents + 0.0025
}

let main = () => {
  Browser.window->P5.setSetup(setup)
  Browser.window->P5.setDraw(draw)
  P5.initP5Global()
}

main()
