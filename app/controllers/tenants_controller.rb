class TenantsController < ApplicationController

    before_action :current_user, :logged_in?, set_tenants

    def index
        if logged_in?
        set_tenants
        # if @tenants.empty?
        #     flash.alert = "No Tenants Found"
        end
    end

    def new
        @tenant = Tenant.new
    end

    def create
        @tenant = Tenant.new(tenant_params)
        if @tenant.valid?
            @tenant.save
            redirect_to tenant_path(@tenant)
        else
            render :new
        end
    end

    def show
        @tenant = Tenant.find(params[:id])
    end

    def edit
        @tenant = Tenant.find(params[:id])
    end

    def update
        @tenant = Tenant.find(params[:id])
        @tenant.update(repair_params)
            if @tenant.save
                redirect_to user_tenant_path(@user, @tenant)
            else
                render :edit
            end
    end

    def destroy
        @tenant = Tenant.find(params[:id])
        @tenant.destroy
        redirect_to tenants_path
    end

    private

    def set_tenants
        @tenants = current_user.tenants
    end

    def tenant_params
        params.require(:tenant).permit(:renter, :co_renter, 
        :address, :renter_email, :co_renter_email, :renter_cell_phone, :co_renter_cell_phone)
    end

end 