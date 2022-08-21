import { createWebHistory, createRouter } from "vue-router";
import WalletConnect from "@/components/WalletConnect";
import MyProperties from "@/components/MyProperties";
import CreateProperty from "@/components/CreateProperty";
import TransferProperty from "@/components/TransferProperty";
import FindProperty from "@/components/FindProperty";

const routes = [
  {
    path: "/",
    name: "Home",
    component: WalletConnect,
  },
  {
    path: "/myProperties",
    name: "MyProperties",
    component: MyProperties,
  },
  {
    path: "/newProperty",
    name: "CreateProperty",
    component: CreateProperty,
  },
  {
    path: "/transferProperty",
    name: "TransferProperty",
    component: TransferProperty,
  },
  {
    path: "/findProperty",
    name: "FindProperty",
    component: FindProperty,
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
