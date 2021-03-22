class UsersController < ApplicationController
	before_action :set_user, only: %I[show edit update]
	# before_action :user_params, only %I[]
	def index

	end
    
	def show
		
	end

	def edit
	
	end

	def update
		@user.update(user_params)
    redirect_to user_path
	end

	private
	def set_user
		@user = User.friendly.find(params[:slug]) # 블로그 수정 대상인 유저
	end

	def user_params
		params.require(:user).permit(:image)
	end

  def verify_owner # 현 페이지 블로그 소유자가 로그인한 사람인가요?
    user_signed_in? && current_user.friendly_id == @user.friendly_id
  end

  def redirect_not_owner
    unless verify_writer_own
      flash[:alert] = "팀만 이 스터디방에 글을 작성할 수 있습니다!"
      redirect_to root_path
    end
  end

end
