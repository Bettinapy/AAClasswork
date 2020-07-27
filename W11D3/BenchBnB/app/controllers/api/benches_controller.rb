class Api::BenchesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        @benches = Bench.all
    end

    def create 
        @bench = Bench.new(bench_params)
        if @bench.save
            # use locals to pass parameter to partial
            render partial: "/api/benches/bench", locals: { bench: @bench}
        else
            render json: ['Invalid bench'], status: 401
        end
    end

    def bench_params
        params.require(:bench).permit(:description, :lat, :lng)
    end
end
