class ProductsController < ApplicationController

      def index
        @products = Product.all
      end


      def new
        @product = Product.new
      end

      def create
        @product = Product.new

         @product.name = params[:product][:name]
         @product.description = params[:product][:description]
         @product.url = params[:product][:url]
         @product.price_in_cents = params[:product][:price_in_cents]


       if  @product.save
            flash[:notice] = "Product successful added!"
            redirect_to products_path
         else
           render :new
       end
      end


      def show
        @product= Product.find(params[:id])
        @review = Review.new
        @reviews= @product.reviews
      end



      def edit
        @product = Product.find(params[:id])
      end

      def update
          @product = Product.find(params[:id])


         @product.name = params[:product][:name]
         @product.description = params[:product][:description]
         @product.url = params[:product][:url]
         @product.price_in_cents = params[:product][:price_in_cents]

         if  @product.save
              flash[:success] = "Product successful updated!"
              redirect_to product_path(@product)
           else
             render :edit
         end

      end

      def destroy
         @product       = Product.find(params[:id])
         @product.destroy
         flash[:success] = "Product successfully deleted!"
         redirect_to root_url

      end




end
