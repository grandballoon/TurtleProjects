speed(0)
local R = 80
local wave_offset = 150  -- where to draw the wave

t2 = Turtle()
t3 = Turtle()
t2.speed(0)
t3.speed(0)

pencolor("gold")
t2.pencolor("cyan")
t3.pencolor("red")
t3.penup()

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
    
    local rx = deg * 0.5
    local ry = R * math.cos(rad)

    -- Draw the circle point
    penup()
    setpos(cx, cy)
    dot(3)

    -- Draw the wave point
    t2.setpos(wx, wy)
    t2.dot(3)
    
   
    -- Draw the cosine wave (below the circle)
    local cosx = 150 + deg * 0.5
    local cosy = -150 + R * math.cos(rad)
    t3.setpos(cosy, cosx)
    t3.dot(3)
   
end

print("Gold dot = point traveling around the circle")
print("Cyan dot = its y-coordinate plotted over time")
print("The horizontal gray lines show: SAME HEIGHT.")
print("The sine wave IS the circle, unrolled.")
