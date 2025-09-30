import { OrderInterface } from "@/interface/orderInterface";
import { orderService } from "@/services/order.service";
import { Request, Response, NextFunction } from "express";

class OrderController {
    async saveOrder(req: Request, res: Response, next: NextFunction) {
        try {
            console.log(req.body);
            const newOrder: OrderInterface = {
                fullName: req.body.fullName,
                idMunicipality: Number(req.body.idMunicipality),
                orderDate: req.body.orderDate,
                orderDetails: req.body.orderDetails,
                orderStatus: 0,
                orderType: req.body.orderType,
                paymentAmount: req.body.paymentAmount == null ? 0 : req.body.paymentAmount,
                paymentType: req.body.paymentType,
                phone: req.body.phone,
                createdBy: Number(req.body.createdBy),
                address: req.body.address,
                idCompany: Number(req.body.idCompany),
                phoneTwo: req.body.phoneTwo, 
                nit: req.body.nit,
                printerTicket: false
            }

            const result = await orderService.saveOrder(newOrder);
            res.status(200).json({
                success: true,
                message: "Ordern creada exitosamente.",
                data: { result }
            })

        } catch (error) {
            next(error);
        }
    }

    async updateOrder(req: Request, res: Response, next: NextFunction) {
        try {
            const order: OrderInterface = {
                fullName: req.body.fullName,
                idMunicipality: Number(req.body.idMunicipality),
                orderDate: req.body.orderDate,
                orderDetails: req.body.orderDetails,
                orderStatus: 0,
                orderType: req.body.orderType,
                paymentAmount: req.body.paymentAmount == null ? 0 : req.body.paymentAmount,
                paymentType: req.body.paymentType,
                phone: req.body.phone,
                createdBy: Number(req.body.createdBy),
                address: req.body.address,
                idCompany: Number(req.body.idCompany),
                phoneTwo: req.body.phoneTwo,
                nit: req.body.nit, 
                printerTicket: req.body.printerTicket
            }
            const result = await orderService.updateOrder(order, req.body.idOrder);
            res.status(200).json({
                success: true,
                message: 'Orden editada correctamente',
                data: { result }
            });
        } catch (error) {
            next(error);
        }
    }

    async orderById(req: Request, res: Response, next: NextFunction) {
        try {
            const { idOrde } = req.query;
            const order = await orderService.orderById(Number(idOrde));
            if (!order) {
                res.status(404).json({
                    success: false,
                    error: {
                        message: 'Orden no encontrada',
                        statusCode: 404,
                    },
                });

                throw new Error('Orden no encontrada');
            }

            res.status(200).json({
                success: true,
                message: 'Orden encontrada',
                data: { order },
            });
        } catch (error) {
            next(error);
        }
    }

    async deleteOrder(req: Request, res: Response, next: NextFunction) {
        try {
            const { idOrder } = req.query;
            await orderService.deleteOrder(Number(idOrder));

            res.status(200).json({
                success: true,
                message: "Orden eliminada correctamente"
            });
        } catch (error) {
            next(error);
        }
    }

    async markSend(req: Request, res: Response, next: NextFunction) {
        try {
            const { idOrder } = req.body;
            await orderService.markSend(idOrder);
            res.status(200).json({
                success: true,
                message: "Orden marcada como enviada correctamente"
            });
        } catch (error) {
            next(error);
        }
    }


    async getAllOrder(req: Request, res: Response, next: NextFunction) {
        try {
            const page = parseInt(req.query.page as string) || 1;
            const limit = parseInt(req.query.limit as string) || 10;
            const { orderStatus, search } = req.query;

            const result = await orderService.getAllOrder(page, limit, Number(orderStatus), search?.toString());
            res.status(200).json({
                success: true,
                message: 'Ordenes',
                data: result
            })

        } catch (error) {
            next(error);
        }
    }

    async generateTicker(req: Request, res: Response, next: NextFunction) {
        try {
            const { idOrder } = req.body;
            const response = await orderService.generateTicket(idOrder);
            res.json({
                success: true,
                imageBase64: `data:image/png;base64,${response}`,
            });
        } catch (error) {
            next(error);
        }
    }

}

export const orderController = new OrderController();