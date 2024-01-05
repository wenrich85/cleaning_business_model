defmodule CleaningBusinessModel.Impl.Home do
  use Ecto.Schema
  import Ecto.Changeset

  schema "homes" do
    field :name, :string
    field :level_of_service, :string
    field :customer_id, :integer

  end

  def changeset(params \\%{}) do
    %__MODULE__{}
    |> cast(params, [:name, :bedrooms, :bathrooms, :kitchens, :half_baths, :level_of_service])
    |> validate_required([:name, :bedrooms])
    |> apply_changes()
  end

end
