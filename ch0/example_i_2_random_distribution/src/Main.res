let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#1a1c2c"
let textColor = "#f4f4f4"
let fillColor = "#888888"

let total = 20
let randomCounts: array<int> = Array.make(~length=total, 0)

let showTitle = () => {
  P5.strokeWeight(0)
  P5.fill(textColor)
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text("Random Distribution (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
}

let updateCounts = () => {
  let index = Float.toInt(P5.floor(P5.random(total)))
  randomCounts[index] = randomCounts[index]->Option.getOr(0) + 1
}

let showRectangles = () => {
  // Draw a rectangle to graph results
  P5.stroke(textColor)
  P5.strokeWeight(2)
  P5.fill(fillColor)
  let w = screenWidth / Int.toFloat(randomCounts->Array.length)
  let _ = randomCounts->Array.mapWithIndex((count, index) => {
    P5.rect(Int.toFloat(index) * w, screenHeight - Int.toFloat(count), w - 1.0, Int.toFloat(count))
  })
}

let main = () => {
  Browser.window->P5.setSetup(() => {
    P5.createCanvas(screenWidth, screenHeight)
    P5.background(#Str(bgColor))
  })

  Browser.window->P5.setDraw(() => {
    P5.background(#Str(bgColor))
    showTitle()
    updateCounts()
    showRectangles()
  })

  P5.initP5Global()
}

main()
