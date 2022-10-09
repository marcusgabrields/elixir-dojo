defmodule Rules do
  @spec eat_ghost?(boolean, boolean) :: boolean
  def eat_ghost?(has_a_pallet_active, is_touching_a_ghost),
    do: has_a_pallet_active and is_touching_a_ghost

  @spec score?(boolean, boolean) :: boolean
  def score?(is_touching_a_power_pallet, is_touching_a_dot),
    do: is_touching_a_power_pallet or is_touching_a_dot

  @spec lose?(boolean, boolean) :: boolean
  def lose?(has_a_pallet_active, is_touching_a_ghost),
    do: not has_a_pallet_active and is_touching_a_ghost

  @spec win?(boolean, boolean, boolean) :: boolean
  def win?(has_eaten_all_dots, has_a_pallet_active, is_touching_a_ghost),
    do: has_eaten_all_dots and not lose?(has_a_pallet_active, is_touching_a_ghost)
end
