defmodule Mix.Tasks.SchedulerLesson.InsertLesson do
  use Mix.Task

  def run(_args) do
    {:ok, _} = Application.ensure_all_started(:scheduler_lesson)

    alias SchedulerLesson.Repo
    alias SchedulerLesson.Lesson

    require IEx
    IEx.pry()

    case Repo.insert(%Lesson{name: "Nome da lição", description: "Descrição da lição"}) do
      {:ok, lesson} ->
        IO.puts("Inserção realizada com sucesso: #{inspect(lesson)}")

      {:error, changeset} ->
        IO.puts("Erro ao inserir: #{inspect(changeset)}")

      any ->
        IO.puts("Resultado inesperado: #{inspect(any)}")
    end

    IO.puts("Lesson inserted successfully")
  end
end
