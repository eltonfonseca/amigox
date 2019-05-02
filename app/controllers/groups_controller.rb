class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout :resolve_layout

  # GET /groups
  # GET /groups.json
  def index
    @groups = current_user.groups
  end

  # GET /groups/all
  def all
    @groups = Group.joins(:groups_users).where("groups_users.user_id != #{current_user.id}")
  end

  def friend
    @friend = current_user.friend
  end

  def raffle
    @group = Group.find(params[:group_id])
    friends = @group.users
    current_user.raffle(friends)
    flash[:alert] = "ok"
    redirect_to group_path(session[:group_id])
  end

  def chat
    @group = Group.find(params[:group_id])
    @message = Message.new group: @group
    @messages = @group.messages.includes(:user)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    session[:group_id] = @group.id
    if @group.users.exists?(current_user.id)
      @users = @group.users
    else
      @group.users << current_user
      @users = @group.users
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.id_created = current_user.id if current_user
    respond_to do |format|
      if @group.save
        @group.users << current_user
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Layout
    def resolve_layout
      case action_name
      when "show", "friend", "chat"
        "group"
      else
        "application"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :id_created)
    end
end
