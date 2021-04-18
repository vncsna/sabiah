defmodule Destroyer do
  alias ExTwitter

  @max_time Application.fetch_env!(:sabiah, :max_time)

  def destroy_tweets do
    ExTwitter.user_timeline([screen_name: "vncsna", count: 200])
    |> Enum.filter(&is_old?(&1))
    |> Enum.map(&destroy_tweet(&1))
  end

  def destroy_favorites do
    ExTwitter.favorites(screen_name: "vncsna")
    |> Enum.filter(&is_old?(&1))
    |> Enum.map(&destroy_tweet(&1))
  end

  def is_old?(%{created_at: created_at}) do
    {:ok, created_at} = Timex.parse(created_at, "%a %b %d %T %z %Y", :strftime)
    {:ok, accessed_at} = DateTime.now("Etc/UTC")
    DateTime.diff(accessed_at, created_at) > @max_time
  end

  def destroy_tweet(%{id_str: id_str}) do
    ExTwitter.destroy_status(id_str)
  end

  def destroy_favorite(%{id_str: id_str}) do
    ExTwitter.destroy_favorite(id_str, [])
  end
end