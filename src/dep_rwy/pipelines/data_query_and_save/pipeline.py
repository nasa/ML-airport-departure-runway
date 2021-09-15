"""Pipeline for arrival runway prediction data query and save
"""

from kedro.pipeline import Pipeline, node

def create_pipelines(**kwargs):
    dqs_pipeline = Pipeline(
        nodes=[

            node(
                func=lambda x: x,
                inputs=[
                    "runways_data_set@DB",
                    ],
                outputs="runways_data_set@CSV",
                name="query_runways",
                ),

            node(
                func=lambda x: x,
                inputs=[
                    "config_data_set@DB",
                    ],
                outputs="config_data_set@CSV",
                name="query_configs",
                ),

            node(
                func=lambda x: x,
                inputs=[
                    "mfs_data_set@DB",
                    ],
                outputs="mfs_data_set@CSV",
                name="query_mfs",
                ),

            node(
                func=lambda x: x,
                inputs=[
                    "planned_fix_data_set@DB",
                    ],
                outputs="planned_fix_data_set@CSV",
                name="query_planned_fix",
                ),

            node(
                func=lambda x: x,
                inputs=[
                    "lookahead_data_set@DB",
                    ],
                outputs="lookahead_data_set@CSV",
                name="lookahead_data_set",
                ),

            ],
        tags="dqs",
        )

    return dqs_pipeline
