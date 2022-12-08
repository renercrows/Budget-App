class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
  end

  def create
    @groups = params[:entity][:group_id].drop(1)
    @groups.each do |group|
      @entity = Entity.new(name: params[:entity][:name], amount: params[:entity][:amount], group_id: group.to_i,
                           user_id: current_user.id)
      @entity.save
    end
    redirect_to group_path(@groups.first.to_i)
  end

  private

  def entity_params
    params.require(:entity).permit(:group_id, :amount, :name)
  end
end
