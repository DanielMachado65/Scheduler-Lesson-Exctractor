defmodule SchedulerLesson.Lesson do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "lessons" do
    field :name, :string
    field :description, :string

    timestamps()
  end
end
