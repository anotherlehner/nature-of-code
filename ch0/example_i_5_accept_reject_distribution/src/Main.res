let baseWidth = 160.0
let baseHeight = 120.0
let scaleFactor = 6.0
let screenWidth = baseWidth * scaleFactor
let screenHeight = baseHeight * scaleFactor
let bgColor = "#1a1c2c"
let textColor = "#f4f4f4"
let fillColor = "#444"

let randomCounts: array<int> = Array.make(~length=20, 0)

let rec acceptReject = () => {
  let r1 = P5.random(#Num(1))
  let probability = r1
  let r2 = P5.random(#Num(1))
  if r2 < probability {
    r1
  } else {
    acceptReject()
  }
}

let showTitle = () => {
  P5.strokeWeight(0)
  P5.fill(#CSSColor(textColor))
  P5.textFont("monospace")
  P5.textSize(scaleFactor * 4.0)
  P5.text("Example 0.5 (ReScript + p5.js)", 2.0 * scaleFactor, 6.0 * scaleFactor)
}

let main = () => {
  Browser.window->P5.setSetup(() => {
    P5.createCanvas(screenWidth, screenHeight)
    P5.background(#Str(bgColor))
    showTitle()
  })

  Browser.window->P5.setDraw(() => {
    P5.background(#Str(bgColor))
    showTitle()

    let index = Float.toInt(acceptReject() * Int.toFloat(randomCounts->Array.length))
    randomCounts[index] = randomCounts[index]->Option.getOr(0) + 1

    P5.stroke(textColor)
    P5.strokeWeight(2)
    P5.fill(#CSSColor(fillColor))

    let w = screenWidth / Int.toFloat(randomCounts->Array.length)
    let _ = randomCounts->Array.mapWithIndex((count, index) => {
      P5.rect(
        Int.toFloat(index) * w,
        screenHeight - Int.toFloat(count),
        w - 1.0,
        Int.toFloat(count),
      )
    })
  })

  P5.initP5Global()
}

main()
