let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#f4f4f4"
let textColor = "#1a1c2c"
let fgColor = "#ff0044"
let boxSize = 250.0

type ball = {
  position: P5.vector,
  velocity: P5.vector,
  radius: float,
}

let ballInstance = ref(None)

let setup = () => {
  P5.createWebGLCanvas(screenWidth, screenHeight, P5.webgl)
  P5.background(#Str(bgColor))
  P5.noStroke()
  ballInstance := Some({
    position: P5.create3dVector(5.0, 10.0, 20.0),
    velocity: P5.create3dVector(4.0, 4.0, 4.0),
    radius: 12.0
  })
}

let draw = () => {
  P5.background(#Num(255.0))
  P5.lights()
  
  switch ballInstance.contents {
  | Some(b) =>
      b.position->P5.add(b.velocity)

      if (b.position.x > boxSize / 2.0 - b.radius || b.position.x < -boxSize / 2.0 + b.radius) {
        b.velocity.x = b.velocity.x * -1.0
      }
      if (b.position.y > boxSize / 2.0 - b.radius || b.position.y < -boxSize / 2.0 + b.radius) {
        b.velocity.y = b.velocity.y * -1.0
      }
      if (b.position.z > boxSize / 2.0 - b.radius || b.position.z < -boxSize / 2.0 + b.radius) {
        b.velocity.z = b.velocity.z * -1.0
      }

      P5.orbitControl()

      P5.rotateX(3.1415926 / 3.0)
      P5.rotateY(3.1415926 / 1.5)

      P5.push()
      P5.noFill()
      P5.stroke(#Num(0.0))
      P5.box1(boxSize)
      P5.pop()

      P5.push()
      P5.translate3d(b.position.x, b.position.y, b.position.z)
      P5.sphere(b.radius, 24.0, 16.0)
      P5.pop()
  | None => JsError.throwWithMessage("invalid ball")
  }
}

let main = () => {
  Browser.window->P5.setSetup(setup)
  Browser.window->P5.setDraw(draw)
  P5.initP5Global()
}

main()
