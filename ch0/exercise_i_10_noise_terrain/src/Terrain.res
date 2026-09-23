// Foreign Function Interfaces (FFI) to bind to p5.js global functions
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// -- converted to ReScript by Martin Lehner / Gemini AI

// TODO: move these to p5 module
@val external noise3: (float, float, float) => float = "noise"
@val external map: (float, float, float, float, float) => float = "map"
@val external floor: float => int = "floor"
@val external stroke: int => unit = "stroke"
@val external fill: (float, float) => unit = "fill"
@val external beginShape: int => unit = "beginShape"
@val external endShape: unit => unit = "endShape"
@val external vertex: (float, float, float) => unit = "vertex"
@val external quadStrip: int = "QUAD_STRIP"

type t = {
  scl: float,
  w: float,
  h: float,
  cols: int,
  rows: int,
  z: array<array<float>>,
  mutable zoff: float,
}

let testFloorInt = (num: float): int => {
  floor(num)
}

// Constructor function
let make = (scl: float, w: float, h: float): t => {
  let cols = floor(w / scl)
  let rows = floor(h / scl)

  // Use Array.fromInitializer to construct unique row sub-arrays
  let z = Array.fromInitializer(~length=cols, _ => Array.make(~length=rows, 0.0))

  {
    scl,
    w,
    h,
    cols,
    rows,
    z,
    zoff: 0.0,
  }
}

// Calculate height values based on 3D Perlin noise
let calculate = (self: t): unit => {
  let xoff = ref(0.0)

  for i in 0 to self.cols - 1 {
    let yoff = ref(0.0)
    for j in 0 to self.rows - 1 {
      let noiseVal = noise3(xoff.contents, yoff.contents, self.zoff)
      let heightVal = map(noiseVal, 0.0, 1.0, -120.0, 120.0)

      // Safely access row option and mutate the element
      switch self.z[i] {
      | Some(row) => row[j] = heightVal
      | None => ()
      }

      yoff := yoff.contents + 0.1
    }
    xoff := xoff.contents + 0.1
  }

  self.zoff = self.zoff +. 0.01
}

// Render landscape as grid of quads
let render = (self: t): unit => {
  for x in 0 to Array.length(self.z) - 2 {
    beginShape(quadStrip)

    // Safely retrieve adjacent columns
    switch (self.z[x], self.z[x + 1]) {
    | (Some(colCurrent), Some(colNext)) =>
      for y in 0 to Array.length(colCurrent) - 1 {
        stroke(0)

        switch (colCurrent[y], colNext[y]) {
        | (Some(zCurrent), Some(zNext)) =>
          let currentShade = map(zCurrent, -120.0, 120.0, 0.0, 255.0)
          fill(currentShade, 255.0)

          let xCoordinate = Float.fromInt(x) * self.scl - self.w / 2.0
          let yCoordinate = Float.fromInt(y) * self.scl - self.h / 2.0

          vertex(xCoordinate, yCoordinate, zCurrent)
          vertex(xCoordinate + self.scl, yCoordinate, zNext)
        | _ => ()
        }
      }
    | _ => ()
    }

    endShape()
  }
}