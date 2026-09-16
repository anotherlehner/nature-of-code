let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#fff"
let textColor = "#000"

let main = () => {
  Browser.window->P5.setSetup(() => {
    P5.createCanvas(screenWidth, screenHeight)
    P5.background(#Str(bgColor))
    P5.fill(#CSSColor(textColor))
    P5.textFont("monospace")
    P5.textSize(scaleFactor * 4.0)
    P5.text("Exercise 0.4 (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
  })

  Browser.window->P5.setDraw(() => {
    let x = P5.randomGaussian(screenWidth / 2.0, 150.0)
    let y = P5.randomGaussian(screenHeight / 2.0, 130.0)
    let r = P5.random(#Num(255))
    let g = P5.random(#Num(255))
    let b = P5.random(#Num(255))
    let a = P5.random(#Num(255))
    let circleSize = P5.random(#Range(16, 30))
    P5.noStroke()
    P5.fill(#RGBA(r, g, b, a))
    P5.circle(x, y, circleSize)
  })

  P5.initP5Global()
}

main()
