defmodule SchedulerLesson.Lesson do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "lessons" do
    field :nome, :string
    field :descricao, :string
  end
end
