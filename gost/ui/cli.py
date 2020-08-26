import click

from .commands import collate, comparison, pbs, plotting, query


@click.group()
def entry_point():
    """
    Entry point for the whole command module.
    """
    pass


entry_point.add_command(pbs.pbs)
entry_point.add_command(query.query)
entry_point.add_command(query.query_filesystem)
entry_point.add_command(comparison.comparison)
entry_point.add_command(collate.collate)
entry_point.add_command(plotting.plotting)
