function scr_scale_canvas(_bw, _bh, _cw, _ch, _center){
	var _aspect = (_bw / _bh);

	if ((_cw / _aspect) > _ch)
	{
	    window_set_size((_ch *_aspect), _ch);
	}
	else
	{
	    window_set_size(_cw, (_cw / _aspect));
	}
	if (_center)
	{
	    window_center();
	}

	surface_resize(application_surface, min(window_get_width(), _bw), min(window_get_height(), _bh));
}