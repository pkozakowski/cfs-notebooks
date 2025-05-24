import numpy as np
import pandas as pd


def scramble_df(df: pd.DataFrame, columns: list[str]) -> pd.DataFrame:
    """Permutes cells of a DataFrame to not reveal sensitive data in notebooks."""
    cells = np.array(df[columns]).reshape(-1)
    np.random.shuffle(cells)
    cells_by_column = cells.reshape((-1, len(df)))  # columns first
    return df.assign(**{name: arr for name, arr in zip(columns, cells_by_column)})
