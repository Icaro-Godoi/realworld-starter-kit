defmodule ConduitWeb.Router do
  use ConduitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ConduitWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug ConduitWeb.Plugs.Auth
  end

  scope "/", ConduitWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/api/", ConduitWeb do
    pipe_through :api

    post "/users", UsersController, :create
    post "/users/login", UsersController, :login

    # get "/profiles/:username", ProfilesController, :show

    # get "/articles", ArticlesController, :list_articles
    # get "/articles/:slug", ArticlesController, :show_article

    # get "/tags", TagsController, :show
  end

  scope "/api/", ConduitWeb do
    pipe_through [:api, :auth]

    # resources "/user", UsersController, only: [:show, :update]

    # post "/profiles/:username/follow", ProfilesController, :follow
    # delete "/profiles/:username/follow", ProfilesController, :unfollow

    # get "/articles/feed", ArticlesController, :show_feed

    # post "/articles", ArticlesController, :create_article
    # put "/articles/:slug", ArticlesController, :update_article
    # delete "/articles/:slug", ArticlesController, :delete_article
    # post "/articles/:slug/favorite", ArticlesController, :favorite
    # delete "/articles/:slug/favorite", ArticlesController, :unfavorite

    # get "/articles/:slug/comments", ArticlesController, :show_comments
    # post "/articles/:slug/comments", ArticlesController, :create_comment
    # delete "/articles/:slug/comments/:id", ArticlesController, :delete_comment
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:conduit, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ConduitWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
