include( "shared.lua" )

surface.CreateFont( "YeastFont", {
	font = "Arial", 
	extended = false,
	size = 25,
	weight = 900,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

function ENT:Draw()

	self:DrawModel()

	local dis = LocalPlayer():GetPos():Distance(self:GetPos())

	local FadeAlpha = 255 + yb.settings.ScreenFadeDist - dis

	local FadeAlphaH = 255 + yb.settings.ScreenFadeDist - dis

	if FadeAlphaH > 230 then

		FadeAlphaH = 230

	end

	if dis < 255 + yb.settings.ScreenFadeDist then

		cam.Start3D2D( self:LocalToWorld( Vector( 3.1, -6.25, 1 ) ), self:LocalToWorldAngles( Angle( 0, 90, 90 ) ), 0.1 )

			draw.RoundedBox( 5, 0, 0, 125, 30, Color( 0, 0, 0, FadeAlphaH ) )

			draw.SimpleText( yb.language.Yeast.." 2 dag", "YeastFont", 62.5, 15, Color( 142, 118, 61, FadeAlpha ), 1, 1 )

		cam.End3D2D()

	end

end