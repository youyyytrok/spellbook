{{
    config(
        schema = 'camelot_v2_corn',
        alias = 'base_trades',
        materialized = 'incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        unique_key = ['tx_hash', 'evt_index'],
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
    )
}}

{{
    uniswap_compatible_v2_trades(
        blockchain = 'corn',
        project = 'camelot',
        version = '2',
        Pair_evt_Swap = source('camelot_corn', 'CamelotPair_evt_Swap'),
        Factory_evt_PairCreated = source('camelot_corn', 'CamelotFactory_evt_PairCreated')
    )
}}
