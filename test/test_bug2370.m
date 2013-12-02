function test_bug2370

% MEM 1500mb
% WALLTIME 0:05:00

% TEST test_bug2370
% TEST ft_filetype ft_read_headshape ft_write_headshape read_ply write_ply

filename = [tempname '.ply'];

[pnt, tri] = icosahedron162;

% combine them in a structure
mesh1.pnt = pnt;
mesh1.tri = tri;

ft_write_headshape(filename, mesh1, 'format', 'ply');
mesh2 = ft_read_headshape(filename);
assert(isequal(mesh1.tri, mesh2.tri));
ratio = mesh1.pnt(:)\mesh2.pnt(:);
assert(ratio>0.99 && ratio<1.01);
delete(filename);

ft_write_headshape(filename, mesh1, 'format', 'ply_ascii');
mesh2 = ft_read_headshape(filename);
assert(isequal(mesh1.tri, mesh2.tri));
ratio = mesh1.pnt(:)\mesh2.pnt(:);
assert(ratio>0.99 && ratio<1.01);
delete(filename);

ft_write_headshape(filename, mesh1, 'format', 'ply_binary');
mesh2 = ft_read_headshape(filename);
assert(isequal(mesh1.tri, mesh2.tri));
ratio = mesh1.pnt(:)\mesh2.pnt(:);
assert(ratio>0.99 && ratio<1.01);
delete(filename);


