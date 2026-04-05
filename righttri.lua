function righttri(angle, hyp)
    fd(hyp)
    lt(180 - angle)
    fd(hyp * math.cos(math.rad(angle)))
    lt(90)
    fd(hyp * math.sin(math.rad(angle)))    
end
