class BranchesController < ApplicationController
  def index
    @branches = current_account.branches
    render json: blueprint(BranchesQuery.new(query_params, @branches).call)
  end

  def create
    @branch = current_account.branches.new branch_params
    if @branch.save
      render json: blueprint(branch)
    else
      render_record_invalid(branch)
    end
  end

  def update
    if branch.update(branch_params)
      render json: blueprint(branch)
    else
      render_record_invalid(branch)
    end
  end

  def show
    render json: blueprint(branch)
  end

  def destroy
    branch.destroy
    redirect_to branches_path
  end

  private

  def branch
    @branch ||= current_account.branches.find(params[:id])
  end

  def branch_params
    params.require(:branch).permit
  end
end
