from Meta_Driver import vary_params_fg_theta

if __name__ == "__main__":
    FG_theta_vec = [0, 2.5, 5, 7.5, 10, -99]
    dist_val = 100
    RB_time_val = 6
    n_males = 4
    num_sims = 1000
    max_m_val = 0.054
    n_mar = 3
    
    vary_params_fg_theta(FG_theta_vec, dist_val, RB_time_val, num_sims, max_m_val, n_males, n_mar)
