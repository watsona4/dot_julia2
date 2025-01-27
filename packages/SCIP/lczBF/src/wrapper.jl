wrap(base) = joinpath("wrapper", base * ".jl")

# used by Clang.jl
using CEnum

# all type definitions
include(wrap("manual_commons"))
include(wrap("commons"))

# wrappers for scip headers
include(wrap("scip_bandit"))
include(wrap("scip_benders"))
include(wrap("scip_branch"))
include(wrap("scip_compr"))
include(wrap("scip_concurrent"))
include(wrap("scip_conflict"))
include(wrap("scip_cons"))
include(wrap("scip_copy"))
include(wrap("scip_cut"))
include(wrap("scip_datastructures"))
include(wrap("scip_debug"))
include(wrap("scip_dialog"))
include(wrap("scip_disp"))
include(wrap("scip_event"))
include(wrap("scip_expr"))
include(wrap("scip_general"))
include(wrap("scip_heur"))
include(wrap("scip_lp"))
include(wrap("scip_mem"))
include(wrap("scip_message"))
include(wrap("scip_nlp"))
include(wrap("scip_nodesel"))
include(wrap("scip_nonlinear"))
include(wrap("scip_numerics"))
include(wrap("scip_param"))
include(wrap("scip_presol"))
include(wrap("scip_pricer"))
include(wrap("scip_probing"))
include(wrap("scip_prob"))
include(wrap("scip_prop"))
include(wrap("scip_randnumgen"))
include(wrap("scip_reader"))
include(wrap("scip_relax"))
include(wrap("scip_reopt"))
include(wrap("scip_sepa"))
include(wrap("scip_sol"))
include(wrap("scip_solve"))
include(wrap("scip_solvingstats"))
include(wrap("scip_table"))
include(wrap("scip_timing"))
include(wrap("scip_tree"))
include(wrap("scip_validation"))
include(wrap("scip_var"))

# default SCIP plugins
include(wrap("scipdefplugins"))

# other public headers
include(wrap("pub_bandit_epsgreedy"))
include(wrap("pub_bandit_exp3"))
include(wrap("pub_bandit"))
include(wrap("pub_bandit_ucb"))
include(wrap("pub_benderscut"))
include(wrap("pub_benders"))
include(wrap("pub_branch"))
include(wrap("pub_compr"))
include(wrap("pub_conflict"))
include(wrap("pub_cons"))
include(wrap("pub_cutpool"))
include(wrap("pub_dialog"))
include(wrap("pub_disp"))
include(wrap("pub_event"))
include(wrap("pub_fileio"))
include(wrap("pub_heur"))
include(wrap("pub_history"))
include(wrap("pub_implics"))
include(wrap("pub_lp"))
include(wrap("pub_matrix"))
include(wrap("pub_message"))
include(wrap("pub_misc"))
include(wrap("pub_misc_linear"))
include(wrap("pub_misc_select"))
include(wrap("pub_misc_sort"))
include(wrap("pub_nlp"))
include(wrap("pub_nodesel"))
include(wrap("pub_paramset"))
include(wrap("pub_presol"))
include(wrap("pub_pricer"))
include(wrap("pub_prop"))
include(wrap("pub_reader"))
include(wrap("pub_relax"))
include(wrap("pub_reopt"))
include(wrap("pub_sepa"))
include(wrap("pub_sol"))
include(wrap("pub_table"))
include(wrap("pub_tree"))
include(wrap("pub_var"))

# all constraint types
include(wrap("cons_abspower"))
include(wrap("cons_and"))
include(wrap("cons_benders"))
include(wrap("cons_benderslp"))
include(wrap("cons_bivariate"))
include(wrap("cons_bounddisjunction"))
include(wrap("cons_cardinality"))
include(wrap("cons_components"))
include(wrap("cons_conjunction"))
include(wrap("cons_countsols"))
include(wrap("cons_cumulative"))
include(wrap("cons_disjunction"))
include(wrap("cons_indicator"))
include(wrap("cons_integral"))
include(wrap("cons_knapsack"))
include(wrap("cons_linear"))
include(wrap("cons_linking"))
include(wrap("cons_logicor"))
include(wrap("cons_nonlinear"))
include(wrap("cons_orbisack"))
include(wrap("cons_orbitope"))
include(wrap("cons_or"))
include(wrap("cons_pseudoboolean"))
include(wrap("cons_quadratic"))
include(wrap("cons_setppc"))
include(wrap("cons_soc"))
include(wrap("cons_sos1"))
include(wrap("cons_sos2"))
include(wrap("cons_superindicator"))
include(wrap("cons_symresack"))
include(wrap("cons_varbound"))
include(wrap("cons_xor"))

# nonlinear expressions
include(wrap("pub_expr"))
include(wrap("expr_manual"))

# SCIP_CALL: macro to check return codes, inspired by @assert
macro SC(ex)
    return :(@assert $(esc(ex)) == SCIP_OKAY)
end
