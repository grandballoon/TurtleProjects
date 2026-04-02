# Lua Turtle Curriculum Framework

## Philosophy

Traditional math education front-loads symbolic manipulation and defers geometric intuition. This curriculum inverts that: students build spatial understanding through turtle programs first, then discover that algebra is notation for what they already know.

**Four tracks per unit:**

1. **Turtle Track** (primary) — Build understanding through programs
2. **Notation Track** (secondary, lags 1+ units) — Transcribe knowledge as algebra/formal math
3. **World Track** (tertiary) — Real-world problems, analogies, physical situations
4. **Test Track** (extension) — SAT/ACT/AP problem format decoding

The turtle track always leads. A student should never encounter a formula before they've already internalized the concept through turtle movement.

---

## Unit 1: Lines and Turns

**Math concepts:** Distance, angle, clockwise vs. counter-clockwise, degrees as fraction of full turn

### Turtle Track

```lua
-- 1a. Move and see what happens
forward(100)

-- 1b. Move and turn
forward(100)
right(90)
forward(100)

-- 1c. What does the number in right() mean?
-- Try different values. What's a full spin?
forward(50)
right(45)
forward(50)
right(45)
forward(50)

-- 1d. Exploration: what happens if you turn 360?
-- What about 180? What about 720?
```

### Notation Track (introduced later, in Unit 3)
- Degrees as fractions of 360
- The number line as "turtle walking right"

### World Track
- Clock hands: "Turn right 90 degrees" = "quarter turn like a clock hand going from 12 to 3"
- Compass directions: 0° = East, 90° = North
- Dance: "quarter turn," "half turn," "about face"

### Test Track
- "An angle measures 135°. What fraction of a full rotation is this?" (SAT geometry)

---

## Unit 2: The Square (Loops and Repetition)

**Math concepts:** Right angles, repetition, closure (returning to start), perimeter

### Turtle Track

```lua
-- 2a. Draw a square the long way
forward(100)
right(90)
forward(100)
right(90)
forward(100)
right(90)
forward(100)
right(90)

-- 2b. Notice: you wrote the same thing 4 times. Loops.
for i = 1, 4 do
    forward(100)
    right(90)
end

-- 2c. What if the sides aren't 100?
-- Change the number — what changes? What stays the same?
for i = 1, 4 do
    forward(50)
    right(90)
end

-- 2d. Variables: give the side a name
local size = 75
for i = 1, 4 do
    forward(size)
    right(90)
end
```

### Notation Track
- Perimeter = 4 × side (but we say: "the turtle walks `side` four times, total distance is `4 × side`")
- Variable as "a name for a number you might change"

### World Track
- Floor tiles, window panes, picture frames — all squares
- "A room is 12 feet on each side. How far do you walk around the edge?"

### Test Track
- "A square has perimeter 48. What is its side length?" (Immediate if you think: turtle walks 4 sides, total 48, each side is 48/4)

---

## Unit 3: Regular Polygons and the Exterior Angle Theorem

**Math concepts:** Regular polygons, exterior angles, interior angles, the total turning theorem (exterior angles sum to 360°)

This is the first major "aha" — traditionally taught in 9th/10th grade geometry, but falls out of turtle movement trivially.

### Turtle Track

```lua
-- 3a. Triangle
for i = 1, 3 do
    forward(100)
    right(120)
end

-- 3b. Pentagon
for i = 1, 5 do
    forward(80)
    right(72)
end

-- 3c. Hexagon
for i = 1, 6 do
    forward(60)
    right(60)
end

-- 3d. See the pattern?
-- sides × turn_angle = 360. Always.
-- The turtle always turns a TOTAL of 360° to get back where it started.
-- (This is the Exterior Angle Theorem.)

-- 3e. General polygon function
function polygon(sides, size)
    local angle = 360 / sides
    for i = 1, sides do
        forward(size)
        right(angle)
    end
end

polygon(3, 100)  -- triangle
polygon(8, 50)   -- octagon
polygon(12, 30)  -- dodecagon

-- 3f. What happens with 36 sides? 50? 100?
polygon(100, 3)
-- It looks like a circle...
```

### Notation Track
- Exterior angle = 360 / n
- Interior angle = 180 - (360 / n) — but derive it from the turtle: "at each corner, the turtle turns by the exterior angle; the interior angle is what's left over from a straight line (180°)"
- Sum of interior angles = n × (180 - 360/n) = 180(n - 2) — but arrives AFTER the student already knows from the turtle that exterior angles sum to 360

### World Track
- Stop signs (octagon), honeycomb (hexagon), soccer ball (pentagons + hexagons)
- "Why are hexagonal tiles better than square tiles for covering a floor?" (tessellation preview)

### Test Track
- "What is the measure of each interior angle of a regular decagon?" (SAT: 180 - 360/10 = 144°)
- "The exterior angles of a polygon sum to ___." (360°. Trivial if you've been a turtle.)

---

## Unit 4: Stars and Non-Convex Polygons

**Math concepts:** Multiples, modular arithmetic (intuitive), greatest common divisor (intuitive), regular star polygons

### Turtle Track

```lua
-- 4a. Five-pointed star
for i = 1, 5 do
    forward(100)
    right(144)
end

-- 4b. Why 144? Because 720 / 5 = 144.
-- The turtle goes around TWICE (720°) in 5 steps.

-- 4c. Star exploration: what happens with different angles?
-- Try right(144) vs right(72) with 5 sides.
-- 72 gives a pentagon. 144 gives a star. Why?

-- 4d. Six-pointed star (two triangles)
for i = 1, 6 do
    forward(100)
    right(120)  -- 720 / 6 = 120... wait, that's a triangle.
end
-- Six-pointed star needs a different approach:
-- Draw it as two overlapping triangles.

-- 4e. General star function
function star(points, skip, size)
    local angle = (360 * skip) / points
    for i = 1, points do
        forward(size)
        right(angle)
    end
end

star(5, 2, 100)  -- classic 5-pointed star
star(7, 2, 80)   -- 7-pointed star, skip 2
star(7, 3, 80)   -- 7-pointed star, skip 3 — different shape!
star(8, 3, 60)   -- 8-pointed star
```

### Notation Track
- Total turning = 360 × k, where k = number of times around
- For a {n/k} star polygon: turn angle = 360k / n
- GCD preview: star(6, 2) doesn't make a 6-pointed star — it makes a triangle traced twice. Because GCD(6, 2) = 2. The star only works when GCD(n, k) = 1.

### World Track
- Star of David, nautical stars, star ratings
- Islamic geometric art (built from star polygons)

### Test Track
- "How many degrees does the minute hand of a clock turn in 25 minutes?" (360 × 25/60 = 150°)

---

## Unit 5: Variables, Scaling, and Ratios

**Math concepts:** Proportional reasoning, ratios, scaling, variables as changeable quantities

### Turtle Track

```lua
-- 5a. Nested squares
for s = 20, 100, 20 do
    for i = 1, 4 do
        forward(s)
        right(90)
    end
end

-- 5b. Spiral
for i = 1, 50 do
    forward(i * 4)
    right(90)
end

-- 5c. Scaling a shape: draw the same polygon at different sizes
function polygon(sides, size)
    local angle = 360 / sides
    for i = 1, sides do
        forward(size)
        right(angle)
    end
end

-- Same shape, different size. What changed? What didn't?
polygon(6, 30)
polygon(6, 60)
polygon(6, 90)
-- The angles are the same. Only the lengths changed.
-- That's what "similar figures" means.

-- 5d. Golden ratio spiral (preview of deeper math)
local a, b = 1, 1
for i = 1, 10 do
    for j = 1, 4 do
        forward(a * 10)
        right(90)
    end
    a, b = b, a + b
end
```

### Notation Track
- Ratio as "how many times bigger": if polygon(6, 60) is twice polygon(6, 30), the ratio is 2:1
- Similar figures: same angles, proportional sides
- Fibonacci sequence from the spiral code

### World Track
- Map scales: "1 inch = 10 miles"
- Recipes: "double the recipe" = scale all ingredients by 2
- Architecture: blueprints as scaled drawings

### Test Track
- "Two similar triangles have sides in ratio 3:5. If the smaller has perimeter 24, what is the perimeter of the larger?" (40)

---

## Unit 6: Circles and Pi

**Math concepts:** Circle as limit of polygon, circumference, π, radius vs. diameter, arc length

This is one of the most powerful units. The student has already seen (Unit 3) that a 100-sided polygon looks like a circle. Now we make it precise.

### Turtle Track

```lua
-- 6a. Circle from polygon
function circle_from_polygon(radius, sides)
    -- Each side has length = circumference / sides
    local circumference = 2 * math.pi * radius
    local step = circumference / sides
    local angle = 360 / sides
    for i = 1, sides do
        forward(step)
        right(angle)
    end
end

circle_from_polygon(80, 6)   -- hexagon
circle_from_polygon(80, 12)  -- looks rounder
circle_from_polygon(80, 36)  -- almost a circle
circle_from_polygon(80, 360) -- indistinguishable from a circle

-- 6b. Now use the built-in
circle(80)

-- 6c. Arcs — partial circles
circle(80, 1/2)  -- semicircle
circle(80, 1/4)  -- quarter circle
arc(80, 90)      -- also a quarter circle

-- 6d. Flower
for i = 1, 6 do
    circle(50, 1/2)
    right(60)
end

-- 6e. Yin-yang (challenging)
circle(100, 1/2)
circle(50, 1/2)
circle(-50, 1/2)
```

### Notation Track
- C = 2πr (but the student already knows: "the turtle walked 2 × π × r to get around")
- π ≈ 3.14159... — "the number of diameters that fit around the circle"
- Arc length = (degrees / 360) × 2πr
- Area = πr² (preview — fuller treatment in later unit)

### World Track
- Wheel distance: "How far does a bike tire travel in one rotation?"
- Pizza: "A 14-inch pizza" means diameter = 14, radius = 7
- Running track: the outer lane is longer — by how much?

### Test Track
- "A circle has radius 5. What is its circumference?" (10π ≈ 31.4)
- "An arc subtends 60° of a circle with radius 12. What is the arc length?" (4π)

---

## Unit 7: Coordinates and the Cartesian Plane

**Math concepts:** x-y coordinates, origin, quadrants, distance formula, midpoint

### Turtle Track

```lua
-- 7a. The turtle lives on a coordinate plane.
-- It starts at (0, 0) — the origin.
print(position())  -- prints: 0  0

-- 7b. Move and check position
forward(100)
print(position())  -- prints: 100  0 (moved right along x-axis)

-- 7c. Drawing axes
pencolor("gray")
pensize(1)
-- x-axis
setpos(-200, 0)
setpos(200, 0)
-- y-axis
setpos(0, -200)
setpos(0, 200)
home()

-- 7d. Plot points
penup()
function plot(x, y)
    setpos(x, y)
    dot(6)
end

pencolor("red")
plot(50, 80)
plot(-30, 60)
plot(-70, -40)
plot(100, -20)

-- 7e. Distance between two points
-- How far is (50, 80) from (-30, 60)?
setpos(50, 80)
print(distance(-30, 60))
-- The turtle already knows the distance formula.

-- 7f. Draw a line between any two points
function line(x1, y1, x2, y2)
    penup()
    setpos(x1, y1)
    pendown()
    setpos(x2, y2)
end
```

### Notation Track
- Ordered pair (x, y)
- Quadrants I–IV
- Distance formula: d = √((x₂-x₁)² + (y₂-y₁)²) — but the student already knows this as "how far the turtle would walk"
- Midpoint = ((x₁+x₂)/2, (y₁+y₂)/2) — "the point halfway along the turtle's path"

### World Track
- Maps with grid references
- GPS coordinates (latitude/longitude as x/y)
- Screen pixels in games and apps

### Test Track
- "What is the distance between (3, 4) and (0, 0)?" (5 — a 3-4-5 right triangle)
- "Find the midpoint of the segment from (-2, 6) to (4, -2)." (1, 2)

---

## Unit 8: Angles, Trigonometry Preview, and heading()

**Math concepts:** Angles as directions, bearing, heading, introduction to sine/cosine through turtle movement

### Turtle Track

```lua
-- 8a. Heading: which way is the turtle facing?
print(heading())  -- 0 (east)
left(90)
print(heading())  -- 90 (north)
left(90)
print(heading())  -- 180 (west)

-- 8b. setheading: point in any direction
setheading(45)    -- northeast
forward(100)
home()
setheading(135)   -- northwest
forward(100)

-- 8c. towards(): what angle points at a target?
home()
print(towards(100, 100))  -- 45 degrees
-- To walk toward a point: turn to face it, then go
setheading(towards(100, 100))
forward(distance(100, 100))
-- Now you're at (100, 100).

-- 8d. The unit circle — walk to all the "nice" angles
penup()
home()
for angle = 0, 359, 15 do
    home()
    setheading(angle)
    forward(100)
    dot(4)
end
-- You just drew the unit circle.

-- 8e. Where does the turtle end up?
-- forward(100) at heading 0° → (100, 0): x changed, y didn't
-- forward(100) at heading 90° → (0, 100): y changed, x didn't
-- forward(100) at heading 45° → (≈70.7, ≈70.7): both changed equally
-- These ratios are cosine and sine.
home()
setheading(30)
forward(100)
local x, y = position()
print(x, y)  -- ≈86.6, 50
-- cos(30°) ≈ 0.866, sin(30°) ≈ 0.5
-- x = 100 × cos(30°), y = 100 × sin(30°)
```

### Notation Track
- sin(θ) = y/r, cos(θ) = x/r — "where the turtle ends up when it walks r at heading θ"
- The unit circle IS the turtle walking at heading θ for distance 1
- SOH CAH TOA as a lookup table for ratios the student already understands

### World Track
- Navigation: compass bearings, "heading 270° means west"
- Slope of a hill: "the turtle climbs at angle θ"
- Surveying: "from this point, the tree is at bearing 37° and distance 50m"

### Test Track
- "A right triangle has hypotenuse 10 and angle 30°. What is the side opposite the 30° angle?" (5)
- "In which quadrant does the terminal side of a 210° angle lie?" (III)

---

## Unit 9: Transformations (Multi-Turtle)

**Math concepts:** Translation, rotation, reflection, symmetry, congruence

### Turtle Track

```lua
-- 9a. Two turtles drawing the same shape in different places = translation
local t1 = Turtle()
local t2 = Turtle()

t2:teleport(150, 0)

for i = 1, 4 do
    t1:forward(80)
    t1:right(90)
    t2:forward(80)
    t2:right(90)
end
-- Same square, different position = translation

-- 9b. Two turtles, one rotated = rotation
local t1 = Turtle()
local t2 = Turtle()
t2:left(45)

for i = 1, 4 do
    t1:forward(80)
    t1:right(90)
    t2:forward(80)
    t2:right(90)
end
-- Same square, one tilted 45° = rotation

-- 9c. Reflection: one turtle mirrors the other
local t1 = Turtle()
local t2 = Turtle()
-- t2 mirrors t1 across the y-axis

function mirror_draw(steps)
    for _, step in ipairs(steps) do
        t1:forward(step.dist)
        t1:right(step.turn)
        t2:forward(step.dist)
        t2:left(step.turn)  -- opposite turn = reflection
    end
end

-- 9d. Symmetry: rotational symmetry from one turtle's output
function rotational_symmetry(n, draw_fn)
    for i = 1, n do
        draw_fn()
        right(360 / n)
    end
end

rotational_symmetry(6, function()
    forward(60)
    right(60)
    forward(60)
    left(120)
    forward(60)
    right(60)
    forward(60)
    -- (come back to center)
    right(180)
    forward(60)
    left(60)
    forward(60)
    right(120)
    forward(60)
    left(60)
    forward(60)
    right(180)
end)
```

### Notation Track
- Translation: (x, y) → (x + a, y + b)
- Rotation: (x, y) → (x cos θ - y sin θ, x sin θ + y cos θ) — but the student already gets this because "the turtle is just facing a different direction"
- Reflection across y-axis: (x, y) → (-x, y) — "swap left and right"

### World Track
- Snowflakes (6-fold symmetry)
- Butterfly wings (bilateral symmetry)
- Tiling patterns in architecture

### Test Track
- "Triangle A has vertices at (1,1), (3,1), (2,3). Triangle B is A translated 4 units right and 2 units up. What are B's vertices?" ((5,3), (7,3), (6,5))

---

## Unit 10: Functions, Abstraction, and Slope

**Math concepts:** Functions as reusable machines, input-output, slope, y = mx + b

### Turtle Track

```lua
-- 10a. You've been writing functions already. Let's be explicit.
function square(size)
    for i = 1, 4 do
        forward(size)
        right(90)
    end
end

-- square is a function. 'size' is its input. The output is a drawing.
-- Functions are machines: put something in, get something out.

-- 10b. A function that draws the graph of y = mx + b
function draw_line(m, b, x_start, x_end)
    penup()
    setpos(x_start, m * x_start + b)
    pendown()
    -- Walk along the line in small steps
    for x = x_start, x_end, 1 do
        setpos(x, m * x + b)
    end
end

draw_line(2, 10, -100, 100)   -- steep line, y-intercept at 10
draw_line(0.5, -30, -100, 100) -- shallow line
draw_line(-1, 50, -100, 100)   -- downward slope

-- 10c. What IS slope? It's how steep the turtle's path is.
-- m = 2 means "for every 1 step right, go 2 steps up"
-- The turtle already knows this — it's just heading.
-- slope = tan(heading)

-- 10d. Parallel lines have the same slope (same heading)
pencolor("red")
draw_line(1, 0, -100, 100)
pencolor("blue")
draw_line(1, 50, -100, 100)
-- Same steepness, different starting point.

-- 10e. Perpendicular lines: slopes multiply to -1
pencolor("red")
draw_line(2, 0, -100, 100)
pencolor("blue")
draw_line(-0.5, 0, -100, 100)
-- 2 × (-0.5) = -1 → perpendicular
```

### Notation Track
- f(x) = mx + b
- Slope = rise/run = Δy/Δx = tan(θ)
- y-intercept: where the turtle's line crosses the y-axis

### World Track
- Hill grades: "a 6% grade means slope = 0.06"
- Economics: "the cost increases $3 per unit" → m = 3

### Test Track
- "What is the slope of the line passing through (2, 5) and (6, 13)?" ((13-5)/(6-2) = 2)
- "A line has slope 3 and passes through (1, 7). What is its y-intercept?" (y = 3x + b → 7 = 3(1) + b → b = 4)

---

## Units 11–20: Outline (Detailed Programs TBD)

### Unit 11: Area and Fill
- `begin_fill()` / `end_fill()` as geometric area
- Area of triangle, rectangle, trapezoid via turtle fill
- Pick's theorem preview (counting filled grid squares)

### Unit 12: Quadratic Functions and Parabolas
- Plot y = x² by walking along it
- Vertex as the turtle's turning point
- Symmetry of parabolas (connect to Unit 9)

### Unit 13: Right Triangles and the Pythagorean Theorem
- Draw right triangles, measure sides with `distance()`
- a² + b² = c² — verify with turtle
- Pythagorean triples as turtle programs

### Unit 14: Trigonometric Functions (Full Treatment)
- sin, cos, tan as turtle ratios
- Plot sine/cosine waves by walking them
- Amplitude and period as turtle parameters

### Unit 15: Parametric Curves
- Spirographs via parametric equations
- Lissajous figures
- The turtle's path IS a parametric curve: x(t), y(t)

### Unit 16: Polar Coordinates
- `setheading(θ); forward(r(θ))` IS polar plotting
- Roses, cardioids, limaçons
- Polar ↔ Cartesian conversion

### Unit 17: Vectors and Linear Algebra Preview
- Two turtles as vectors: addition = "walk both paths"
- Dot product as "how much do two turtles agree on direction?"
- Matrix as "transformation recipe for the turtle"

### Unit 18: Fractals and Recursion
- Koch snowflake, Sierpinski triangle
- Recursion as "the turtle follows its own instructions"
- Self-similarity, fractal dimension (intuitive)

### Unit 19: Calculus Preview — Derivative as Heading
- The derivative IS the turtle's heading at each point
- Tangent line = "which way the turtle is facing right now"
- Integration as "total distance traveled" (area under the curve)

### Unit 20: DynaTurtles — Physics
- Conservation of momentum: two turtles colliding
- Gravity: turtle's heading changes while moving (acceleration)
- Orbital mechanics: circular and elliptical orbits
- Papert's original vision, fully realized

---

## Beyond Unit 20: University and Graduate Topics

These are speculative but grounded in the geometric-first philosophy:

- **Differential geometry**: The turtle IS a Frenet frame. Curvature = rate of turning. Torsion = turning in 3D.
- **Complex numbers**: The turtle on the Argand plane. Multiplication = rotation + scaling.
- **Group theory**: Symmetry operations on turtle drawings as group elements.
- **Topology**: When does a turtle path enclose a region? Winding numbers. Jordan curve theorem (intuitive).
- **Numerical methods**: Euler's method IS turtle graphics. "Take a step in the direction you're heading."

---

## SAT/ACT Fast Track

For students who've completed Units 1–10, a focused 2-hour SAT math session covers:

1. **Angle problems** → "You are the turtle. Which way are you facing?" (Units 1, 3, 4)
2. **Polygon/circle problems** → Exterior angle theorem, C = 2πr (Units 3, 6)
3. **Coordinate geometry** → Distance, midpoint, slope (Units 7, 10)
4. **Function problems** → f(x) as "where does the turtle end up?" (Unit 10)
5. **Triangle problems** → Pythagorean theorem, special triangles (Units 8, 13)
6. **Word problem decoding** → "Translate this into turtle commands, then answer" (World Track throughout)

The thesis: if the geometric intuition is solid, SAT math is just pattern matching. The two hours teach *format*, not math.

---

## Implementation Notes

### API Coverage
All programs above use only the current luaturtle.com API. No missing commands block the first 10 units. Multi-turtle (Unit 9) depends on the public multi-turtle API, which exists but isn't documented.

### Speed Setting
Early units should run at speed 3–5 so students can watch the turtle move. `speed(0)` ("fastest") or `speed("instant")` are for later units where animation is a distraction.

### Coordinate Convention
The standard math convention (0° = east, CCW-positive, center origin, y-up) means all trig works without sign corrections. This is load-bearing for Units 8 and 14+.

### Per-Program Metadata (for curriculum tooling)
Each program should eventually carry:
- **Prerequisites**: which units must be complete
- **Math concepts**: tagged for search/filtering
- **Difficulty**: 1–5 scale
- **Estimated time**: minutes to complete
- **AoPS alignment**: which AoPS chapter/section maps to this program
