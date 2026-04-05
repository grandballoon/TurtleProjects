-- ============================================================
-- TRIG 2: Draw the unit circle and label the key points
-- ============================================================
-- The "unit circle" is what you get when the turtle walks
-- distance 1 (or 100, for visibility) at every possible heading.

speed(0)
local R = 120  -- radius for visibility

-- Draw the circle as a trail of dots
penup()
pencolor("gray")
for angle = 0, 359, 3 do
    home()
    setheading(angle)
    forward(R)
    dot(2)
end

-- Draw axes
pencolor("gray")
pensize(1)
home()
pendown()
setpos(-150, 0)
home()
setpos(150, 0)
home()
setpos(0, -150)
home()
setpos(0, 150)
home()
penup()

-- Now mark the "famous" angles and show their coordinates
local famous = {0, 30, 45, 60, 90, 120, 135, 150, 180, 210, 225, 240, 270, 300, 315, 330}

for _, angle in ipairs(famous) do
    home()
    penup()

    -- Draw a faint line from center to the point
    pencolor("gray")
    pensize(1)
    pendown()
    setheading(angle)
    forward(R)
    penup()

    -- Mark the point
    pencolor("gold")
    dot(5)

    -- The coordinates ARE cosine and sine (scaled by R)
    local x, y = position()
    local cos_val = x / R
    local sin_val = y / R
    print(angle .. "°: cos=" .. string.format("%.3f", cos_val)
                 .. " sin=" .. string.format("%.3f", sin_val))
end

-- ============================================================
-- TRIG 3: Cosine is the shadow on the x-axis
-- ============================================================
-- For any point on the circle, drop a vertical line to the x-axis.
-- That horizontal distance is cosine.
-- The vertical distance up to the point is sine.

speed(0)
local R = 130

-- Draw circle and axes
penup()
pencolor("gray")
for a = 0, 359, 3 do
    home()
    setheading(a)
    forward(R)
    dot(1)
end
pencolor("gray")
pensize(1)
home()
pendown()
setpos(-160, 0)
setpos(160, 0)
setpos(0, 0)
setpos(0, -160)
setpos(0, 160)
penup()
home()

-- Pick an angle and show the triangle
local angle = 40  -- try changing this!

-- Walk to the point on the circle
setheading(angle)
pencolor("white")
pensize(2)
pendown()
forward(R)
local px, py = position()
penup()

-- Drop a vertical line to the x-axis (this is sine)
pencolor("cyan")
pensize(2)
pendown()
setpos(px, 0)
penup()

-- Draw the horizontal from origin to the foot (this is cosine)
pencolor("red")
pensize(2)
home()
pendown()
setpos(px, 0)
penup()

-- Label
home()
penup()
setpos(px / 2, -20)
pencolor("red")
text("cos", "monospace", 14, "center")
setpos(px + 15, py / 2)
pencolor("cyan")
text("sin", "monospace", 14, "left")

print("angle = " .. angle .. "°")
print("cos(" .. angle .. ") = " .. string.format("%.3f", px / R))
print("sin(" .. angle .. ") = " .. string.format("%.3f", py / R))
print("hypotenuse = " .. R .. " (always the radius)")


-- Trig 4
speed(0)
local R = 130
local angle = 40  -- try changing this!

-- Draw circle and axes
penup()
pencolor("gray")
for a = 0, 359, 3 do
    home()
    setheading(a)
    forward(R)
    dot(1)
end
pencolor("gray")
pensize(1)
home()
pendown()
setpos(-160, 0)
setpos(160, 0)
setpos(0, 0)
setpos(0, -160)
setpos(0, 160)
penup()
home()

-- Compute the point on the circle
local px = R * math.cos(math.rad(angle))
local py = R * math.sin(math.rad(angle))

-- Hypotenuse: origin to circle point (white)
pencolor("white")
pensize(2)
pendown()
setpos(px, py)
penup()

-- Vertical drop: circle point down to x-axis (cyan = sine)
pencolor("cyan")
pensize(2)
pendown()
setpos(px, 0)
penup()

-- Horizontal: origin to foot of drop (red = cosine)
home()
pencolor("red")
pensize(2)
pendown()
setpos(px, 0)
penup()

-- Labels
setpos(px / 2, -20)
text("cos", "monospace", 14, "center")
setpos(px + 15, py / 2)
text("sin", "monospace", 14, "left")

print("angle = " .. angle .. "°")
print("cos(" .. angle .. ") = " .. string.format("%.3f", px / R))
print("sin(" .. angle .. ") = " .. string.format("%.3f", py / R))
print("hypotenuse = " .. R .. " (always the radius)")


-- ============================================================
-- TRIG 5: Plot sine and cosine as WAVES
-- ============================================================
-- So far sine and cosine have been ratios on the circle.
-- What if we plot them as the angle changes?
-- x-axis = angle, y-axis = the value of sin or cos

speed(0)
local scale = 80   -- vertical scale (amplitude)
local xscale = 0.8 -- horizontal compression so it fits

-- Draw horizontal axis
pencolor("gray")
pensize(1)
penup()
setpos(-180, 0)
pendown()
setpos(180, 0)
penup()

-- Plot cosine (red)
pencolor("red")
pensize(2)
penup()
for deg = -180, 180 do
    local x = deg * xscale
    local y = math.cos(math.rad(deg)) * scale
    if deg == -180 then
        setpos(x, y)
        pendown()
    else
        setpos(x, y)
    end
end
penup()

-- Plot sine (cyan)
pencolor("cyan")
pensize(2)
penup()
for deg = -180, 180 do
    local x = deg * xscale
    local y = math.sin(math.rad(deg)) * scale
    if deg == -180 then
        setpos(x, y)
        pendown()
    else
        setpos(x, y)
    end
end
penup()

-- Labels
pencolor("red")
setpos(150, math.cos(math.rad(180)) * scale - 15)
text("cos", "monospace", 14)
pencolor("cyan")
setpos(150, math.sin(math.rad(180)) * scale + 5)
text("sin", "monospace", 14)

print("Red = cosine, Cyan = sine")
print("Notice: they're the SAME wave, just shifted.")
print("Cosine leads sine by 90°.")
print("Both waves repeat every 360° — that's the PERIOD.")



-- ============================================================
-- TRIG 6: The circle and the wave are the same thing
-- ============================================================
-- This is the big reveal. Watch a point go around the circle
-- and trace its y-coordinate as a wave.

speed(0)
local R = 80
local wave_offset = 150  -- where to draw the wave

-- Draw the circle on the left
penup()
pencolor("gray")
for a = 0, 359, 3 do
    setpos(
        -wave_offset + R * math.cos(math.rad(a)),
        R * math.sin(math.rad(a))
    )
    dot(1)
end

-- Draw the wave axis on the right
pencolor("gray")
pensize(1)
penup()
setpos(0, 0)
pendown()
setpos(wave_offset + 50, 0)
penup()

-- Now trace both simultaneously
pencolor("gold")
pensize(3)
for deg = 0, 360, 2 do
    local rad = math.rad(deg)

    -- Point on circle
    local cx = -wave_offset + R * math.cos(rad)
    local cy = R * math.sin(rad)

    -- Corresponding point on sine wave
    local wx = deg * 0.5  -- spread the wave out horizontally
    local wy = R * math.sin(rad)  -- SAME y-coordinate

    -- Draw the circle point
    penup()
    setpos(cx, cy)
    pencolor("gold")
    dot(3)

    -- Draw the wave point
    setpos(wx, wy)
    pencolor("cyan")
    dot(3)

    -- Connect them with a faint line (same height!)
    pencolor("gray")
    pensize(1)
    pendown()
    setpos(cx, cy)
    penup()
end

print("Gold dot = point traveling around the circle")
print("Cyan dot = its y-coordinate plotted over time")
print("The horizontal gray lines show: SAME HEIGHT.")
print("The sine wave IS the circle, unrolled.")
