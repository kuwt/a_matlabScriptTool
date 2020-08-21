function [a,b,c,d] = test_reconstructByPlanes_plane_model_linear(sol,ks,phi)
    a = (sol(1) * ks(4) * phi + sol(2)) * ks(1);
    b = (sol(3) * ks(4) * phi + sol(4)) * ks(2);
    c = (sol(5) * ks(4) * phi + sol(6)) * ks(3);
    d = (sol(7) * ks(4) * phi + sol(8));
end
