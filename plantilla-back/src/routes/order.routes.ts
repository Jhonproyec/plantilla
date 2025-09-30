import { orderController } from "@/controllers/orderController";
import { Router } from "express";

export const orderRoute = Router();

orderRoute.post('/', orderController.saveOrder);
orderRoute.get('/', orderController.getAllOrder);
orderRoute.put('/', orderController.updateOrder);
orderRoute.delete('/', orderController.deleteOrder);
orderRoute.get('/byId', orderController.orderById);
orderRoute.put('/markSend', orderController.markSend);
orderRoute.post('/generateTicket', orderController.generateTicker);